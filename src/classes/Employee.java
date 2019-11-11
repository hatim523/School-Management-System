package classes;

import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Employee extends Person{
	private String CNIC, qualification, jobTitle, employee_id, password;
	private double salary, work_experience;
	private boolean logged;
	private UserPermissions permissions;
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private Connection con;
	
	public Employee(HttpServletRequest request, HttpServletResponse response) {
		req = request;
		resp = response;
		logged = false;
		try
		{
			metaData m1 = new metaData();
			System.out.println(m1.getDatabaseName());
			System.out.println(m1.getSchoolName());
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + m1.getDatabaseName(), "root", "root");
			System.out.println("Connection successful");
		}
		catch (Exception e)
		{
			ExceptionHandler ex = new ExceptionHandler(e, req, resp);
		
		}
	}
	public Employee() {
		// TODO Auto-generated constructor stub
		logged = false;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			metaData m1 = new metaData();
			System.out.println(m1.getDatabaseName());
			System.out.println(m1.getSchoolName());
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + m1.getDatabaseName(), "root", "root");
			System.out.println("Connection successful");
		}
		catch (Exception e)
		{
			ExceptionHandler ex = new ExceptionHandler(e);
		}
	}
	
	
	/*
	 * Beginning of setter/getter functions
	 */
	public char getGender()
	{
		return gender;
	}
	public String getCNIC()
	{
		return CNIC;
	}
	public String getQualification()
	{
		return qualification;
	}
	public String getJobTitle()
	{
		return jobTitle;
	}
	public String getEmployeeID()
	{
		return employee_id;
	}
//	public String getPassword()
//	{
//		return password;
//	}
	public double getSalary()
	{
		return salary;
	}
	public double getWorkExperience()
	{
		return work_experience;
	}
	public UserPermissions getPermissions()
	{
		return permissions;
	}
	private int setWorkExperience(double y)
	{
		if (y >= 0 && y <= 80)
		{
			work_experience = y;
			return 0;
		}
		return 1;
	}
	private int setSalary(double s)
	{
		if (s > 100 && s < 100000000)
		{
			salary = s;
			return 0;
		}
		return 1;
	}
	private int setEmployeeID(String em)
	{
		try
		{
			Integer.parseInt(em);
			employee_id = em;
			return 0;
		}
		catch (NumberFormatException ex)
		{
			return 1;
		}
	}
	private int setCNIC (String c)
	{
		try
		{
			if (c.length() < 13 || c.length() > 13)
				return 1;
			Long.parseLong(c);
			CNIC = c;
			return 0;
		}
		catch (NumberFormatException ex)
		{
			return 1;
		}
	}
	private int setQualification(String q)		//Mention qualifications if needed
	{
		if (q.length() >= 2)
		{
			qualification = q;
			return 0;
		}
		return 1;
	}
	private int setJobTitle(String j)		//Mention all job titles if needed
	{
		if (j.length() >= 2)
		{
			jobTitle = j;
			return 1;
		}
		return 1;
	}
	private int setPassword(String pPass)
	{
		if (pPass.length() >= 8)
		{
			password = pPass;
			return 0;
		}
		return 1;
	}
	/*
	 * End of setter/getter functions
	 */
	private String EncryptPassword (String input)
    { 
		/*
		 * Purpose: Encrypts Password into hash form
		 * Usage: Password from user will be encrypted and then compared to database password
		 */
    	try
    	{
    		MessageDigest md = MessageDigest.getInstance("SHA-256");  
            BigInteger number = new BigInteger(1, md.digest(input.getBytes(StandardCharsets.UTF_8)));  
      
            // Convert message digest into hex value  
            StringBuilder hexString = new StringBuilder(number.toString(16));  
      
            // Pad with leading zeros 
            while (hexString.length() < 32)  
            {  
                hexString.insert(0, '0');  
            }  
      
            return hexString.toString();  
    	}
    	catch (Exception e)
    	{
    		ExceptionHandler ex = new ExceptionHandler(e, req, resp);
    	}
    	return null;
    }
	public boolean Login() throws IOException, SQLException, ServletException
	{
		String in_id = req.getParameter("uname").substring(2);
		String in_password = req.getParameter("psw");
		
		System.out.println("Entered ID: " + in_id);
		System.out.println("Entered Pass: " + in_password);
		
		in_password = EncryptPassword(in_password);
		
		String sql = "Select * from employee where employee_id = ? and password = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setString(1, in_id);
		psm.setString(2, in_password);
		
		ResultSet rs = psm.executeQuery();
		if (rs.next())
		{
			HttpSession sess = req.getSession();
			sess.setMaxInactiveInterval(1200);
			LoadData(rs);
			sess.setAttribute("emp_obj", this);
			RequestDispatcher rd = req.getRequestDispatcher("Emp_homepage.jsp");
			rd.forward(req, resp);
		}
		else
		{
			resp.sendRedirect("indexInvalid.jsp");
		}
		return true;
	}
	private void LoadData(ResultSet rs) throws SQLException
	{
		name = rs.getString(2);
		employee_id = String.valueOf(rs.getInt(1));
		dob = rs.getDate(3);
		fname = rs.getString(4);
		address = rs.getString(5);
		number = rs.getString(6);
		emergency_number = rs.getString(7);
		if (rs.getString(8).equals("M"))
			gender = 'M';
		else if (rs.getString(8).equals("F"))
			gender = 'F';
		else
			gender = 'O';
		email = rs.getString(9);
		CNIC = rs.getString(10);
		qualification = rs.getString(11);
		jobTitle = rs.getString(12);
		salary = rs.getDouble(13);
		work_experience = rs.getDouble(15);
		permissions = new UserPermissions(employee_id, con);
		logged = true;
	}
	public String generateNavBar()
	{
		String navBar = "<a class=\\\"w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2\\\" href=\\\"javascript:void(0);\\\" onclick=\\\"openNav()\\\"><i class=\\\"fa fa-bars\\\"></i></a>\" + \r\n" + 
				"				\"  <a href=\\\"#\\\" class=\\\"w3-bar-item w3-button w3-padding-large w3-theme-d4\\\"><i class=\\\"fa fa-home w3-margin-right\\\"></i>Home</a>";
		
		navBar += "<div class=\\\"w3-dropdown-hover w3-hide-small\\\" >\" +" + 
				"				\"    <button class=\\\"w3-button w3-padding-large\\\" title=\\\"Student Related Activities\\\">Student</button>     \" + \r\n" + 
				"				\"    <div class=\\\"w3-dropdown-content w3-card-4 w3-bar-block\\\" style=\\\"width:300px\\\">"; 
				
//		//Adding student functionalities
		if (permissions.getAddMarksPermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Marks</a>";
		if (permissions.getStudentAttendancePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Add Attendance</a>";
		if (permissions.getUpdateStudentInfo())
			navBar += " <a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Info</a>";
		if (permissions.getRemoveStudentPermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Remove Student</a>";
//				
//				
		navBar += "</div>\" + \r\n" + 
				"				\"  </div>";
//		
//		
//		//Now adding Employee functionalities
//		
		navBar += "<div class=\\\"w3-dropdown-hover w3-hide-small\\\" >\" +" + 
				"				\"    <button class=\\\"w3-button w3-padding-large\\\" title=\\\"Teacher Related Functions\\\">Faculty</button>     \" + \r\n" + 
				"				\"    <div class=\\\"w3-dropdown-content w3-card-4 w3-bar-block\\\" style=\\\"width:300px\\\">"; 
		
//		
//		
//		
//		
		if (permissions.getEmployeeAttendancePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Add Attendance</a>";
		if (permissions.getRemoveEmployeePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Remove Employee</a>";
		if (permissions.getUpdateTimetablePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Timetable</a>";
		if (permissions.getAddCoursePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Add new Course</a>";
		if (permissions.getAddEmployeePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Add New Employee</a>";
		if (permissions.getUpdateEmployeeInfo())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Info</a>";
		
		navBar += "</div>\" + \r\n" + 
				"				\"  </div>";
//		
////		//Adding Admin functionalities
		navBar += "<div class=\\\"w3-dropdown-hover w3-hide-small\\\" >\" +" + 
				"				\"    <button class=\\\"w3-button w3-padding-large\\\" title=\\\"Management Tasks\\\">Management</button>     \" + \r\n" + 
				"				\"    <div class=\\\"w3-dropdown-content w3-card-4 w3-bar-block\\\" style=\\\"width:300px\\\">"; 
//		
		if (permissions.getAddClassSectionPermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Add new Class/Section</a>";
		if (permissions.getAddEmployeePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Employee Permissions</a>";
		if (permissions.getGenerateFeeChallanPermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Print Fee Challan</a>";
//		if (permissions.getRightsToUpdatePermission())
//			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Permissions</a>";
		if (permissions.getUpdateFeePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Revise Fee Structure</a>";
		if (permissions.getUpdateSalaryPermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Employee Info</a>";
		if (permissions.getUpdateTimetablePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Change Timetable</a>";
		if (permissions.getSendSMSPermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Send Message</a>";
//		
//
		navBar += "</div>\" + \r\n" + 
				"				\"  </div>";
//		
//		//Adding SMS menu
//		if (permissions.getSendSMSPermission())
//			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white\\\" title=\\\"Send SMS or Email\\\">Message</a>";
		
		navBar += "<div class=\\\"w3-dropdown-hover w3-hide-small\\\" style=\\\"margin-right:20%\\\">\\r\\n\" + \r\n" + 
				"				\"    <button class=\\\"w3-button w3-padding-large\\\" title=\\\"Notifications\\\"><img src=\\\"profileIcon.png\\\" class=\\\"w3-circle\\\" style=\\\"height:27px;width:27px\\\"></button>     \\r\\n\" + \r\n" + 
				"				\"    <div class=\\\"w3-dropdown-content w3-card-4 w3-bar-block\\\" style=\\\"width:300px\\\">\\r\\n\" + \r\n" + 
				"				\"      <a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Profile</a>\\r\\n\" + \r\n" + 
				"				\"      <a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Settings</a>\\r\\n\" + \r\n" + 
				"				\"	  <a href=\\\"getRequests?work_to_do=signout\\\" class=\\\"w3-bar-item w3-button\\\">Sign Out</a>\\r\\n\" + \r\n" + 
				"				\"    </div>\\r\\n\" + \r\n" + 
				"				\"  </div>";
		
		return navBar;
	}
	public ArrayList<String> getCourses() throws SQLException
	{
		String sql = "Select * from courses, teacher_courses where courses.course_id = teacher_courses.course_id and teacher_id = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		
		psm.setString(1, employee_id);
		ResultSet rs = psm.executeQuery();
		
		ArrayList<String> teacher_courses = new ArrayList<String>();
		
		return teacher_courses;
	}
//	public void Register()
//	{
//		int validCredentials = 0;
//		validCredentials = setName(req.getParameter(arg0));
//		validCredentials = setFname(req.getParameter());
//		validCredentials = setPassword(req.getParameter());
//		validCredentials = setGender(req.getParameter());
//		validCredentials = setDate(req.getParameter());
//		validCredentials = setAddress(req.getParameter());
//		validCredentials = setEmail(req.getParameter());
//		validCredentials = setNumber(req.getParameter());
//		validCredentials = setEmergencyNumber(req.getParameter());
//		validCredentials = setCNIC(req.getParameter(CNIC));
//		validCredentials = setQualification(req.getParameter());
//		validCredentials = setWorkExperience(req.getParameter());
//		validCredentials = setJobTitle(req.getParameter());
//		validCredentials = setSalary(req.getParameter());
//		
//	}
}
