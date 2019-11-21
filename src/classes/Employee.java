package classes;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

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
	private InputStream image;
	
	public Employee(HttpServletRequest request, HttpServletResponse response) {
		req = request;
		resp = response;
		HttpSession sess = req.getSession(false);
		logged = (boolean) sess.getAttribute("logged_status");
		try
		{
			metaData m1 = new metaData();
			System.out.println(m1.getDatabaseName());
			System.out.println(m1.getSchoolName());
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + m1.getDatabaseName(), "root", "root");
			if (!LoadSessionData())
				System.out.println("Invalid session id...return to homepage");
		}
		catch (Exception e)
		{
			ExceptionHandler ex = new ExceptionHandler(e, req, resp);
		
		}
	}
	public Employee (HttpServletRequest request, HttpServletResponse response, boolean OnlyLogin)		//Only used for Login purpose
	{
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
	public InputStream getImage()
	{
		return image;
	}
	public String getGender()
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
	public String getPassword()
	{
		return password;
	}
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
			password = EncryptPassword(pPass);
			return 0;
		}
		return 1;
	}
	public boolean getLoggedStatus()
	{
		return logged;
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
			resp.sendRedirect("Emp_homepage.jsp");
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
			gender = "M";
		else if (rs.getString(8).equals("F"))
			gender = "F";
		else
			gender = "O";
		email = rs.getString(9);
		CNIC = rs.getString(10);
		qualification = rs.getString(11);
		jobTitle = rs.getString(12);
		salary = rs.getDouble(13);
		work_experience = rs.getDouble(15);
		permissions = new UserPermissions(employee_id, con);
		HttpSession sess = req.getSession();
		sess.setAttribute("logged_status", true);
		sess.setAttribute("login_id", Integer.parseInt(employee_id) * 43);
		logged = true;
	}
	private boolean LoadSessionData() throws SQLException
	{
		HttpSession sess = req.getSession(false);
		try
		{
			int session_id = (Integer) sess.getAttribute("login_id");
			employee_id = Integer.toString(session_id / 43);
			System.out.println("Loaded employee id: " + employee_id);
			String sql = "Select * from employee where employee_id = ?";
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, employee_id);
			ResultSet rs = psm.executeQuery();
			if (rs.next())
			{
				LoadData(rs);
				return true;
			}
			return false;
		}
		catch (NumberFormatException invalid)
		{
			return false;
		}
		
	}
	public String generateNavBar()			//Provides Dynamic NavBar functionality
	{
		String navBar = "<a class=\\\"w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2\\\" href=\\\"javascript:void(0);\\\" onclick=\\\"openNav()\\\"><i class=\\\"fa fa-bars\\\"></i></a>\" + \r\n" + 
				"				\"  <a href=\\\"Emp_homepage.jsp\\\" class=\\\"w3-bar-item w3-button w3-padding-large w3-theme-d4\\\"><i class=\\\"fa fa-home w3-margin-right\\\"></i>Home</a>";
		
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
			navBar += "<a href=\\\"employee_registration.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Add New Employee</a>";
		if (permissions.getUpdateEmployeeInfo())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Employee Info</a>";
		
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
//		if (permissions.getAddEmployeePermission())
//			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Employee Permissions</a>";
		if (permissions.getGenerateFeeChallanPermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Print Fee Challan</a>";
//		if (permissions.getRightsToUpdatePermission())
//			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Update Permissions</a>";
		if (permissions.getUpdateFeePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Revise Fee Structure</a>";
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
	public ArrayList<String> getCourses() throws SQLException			//For setting option text
	{
		String sql = "select course_name, class, section from class_section, courses, courses_teacher_class where  courses_teacher_class.class_id = class_section.class_id and courses.course_id = courses_teacher_class.course_id and teacher_id = ?"; 
		PreparedStatement psm = con.prepareStatement(sql);
		
		psm.setString(1, employee_id);
		ResultSet rs = psm.executeQuery();
		
		ArrayList<String> teacher_courses = new ArrayList<String>();
		while (rs.next())
		{
			teacher_courses.add(rs.getString(1) + " - " + rs.getString(2) + " " + rs.getString(3));
		}
		System.out.println("Total Courses" + teacher_courses.size());
		return teacher_courses;
	}
	public ArrayList<String> getCourseID_classID() throws SQLException		//For setting option value
	{
		String sql = "select courses.course_id, class_section.class_id from class_section, courses, courses_teacher_class where  courses_teacher_class.class_id = class_section.class_id and courses.course_id = courses_teacher_class.course_id and teacher_id = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setString(1, employee_id);
		
		ArrayList<String> course_data = new ArrayList<String>();
		ResultSet rs = psm.executeQuery();
		while (rs.next())
		{
			course_data.add(rs.getString(1) + "-" + rs.getString(2));
		}
		return course_data;
	}
	public String AddHomeWork() throws SQLException			//Adds the homework from the homepage into DB
	{
		String generatedColumns[] = { "unique_id" };
		String sql = "Insert into homework (course_id, class_id, teacher_id, due_date, homework) values (?,?,?,?,?)";
		PreparedStatement psm = con.prepareStatement(sql, generatedColumns);
		psm.setInt(1, Integer.parseInt(req.getParameter("course")));
		psm.setInt(2, Integer.parseInt(req.getParameter("class")));
		System.out.println(employee_id);
		psm.setInt(3, Integer.parseInt(employee_id));
		psm.setString(4, req.getParameter("sub_date"));
		psm.setString(5, req.getParameter("msg"));
		
		try
		{
			psm.executeUpdate();
			ResultSet res = psm.getGeneratedKeys();
			if (res.next())
				return Integer.toString(res.getInt(1));
		}
		catch (SQLException sq)
		{
			
		}
		return "Adding message Failed...Duplicated Message";
	}
	private String getHomeworkImageSource(String subject_lower)		//Gets source of image based on the subject of homework
	{
		String src = "math.png";
		if (subject_lower.indexOf("math") != -1)
			src = "math.png";
		else if (subject_lower.indexOf("science") != -1)
			src = "science.png";
		else if (subject_lower.indexOf("pakistan") != -1)
			src = "pakistan.png";
		else if (subject_lower.indexOf("geography") != -1)
			src = "geography.png";
		else if (subject_lower.indexOf("english") != -1)
			src = "english.png";
		else if (subject_lower.indexOf("urdu") != -1)
			src = "urdu.png";
		return src;
	}
	public String getHomeWork() throws SQLException, ParseException			//Gets homework added previously, but only which is recent
	{
		RemovePassedHomework();
		String sql = "select * from homework, courses, class_section where DATE_ADD(due_date, INTERVAL 1 DAY) >= date(now()) and teacher_id = ? and homework.course_id = courses.course_id and class_section.class_id = homework.class_id order by due_date";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setString(1, employee_id);
		ResultSet rs = psm.executeQuery();
		String homework = "";
		String temp = "Hello";
		while (rs.next())
		{
			homework += "<div class=\\\"w3-container w3-card w3-white w3-round w3-margin\\\" id=\\\"" + rs.getString(6) + "\\\"><br>\\r\\n" +
					"<img src=\\\"" + getHomeworkImageSource(rs.getString(8).toLowerCase()) + "\\\" alt=\\\"Avatar\\\" class=\\\"w3-left w3-circle w3-margin-right\\\" style=\\\"width:60px\\\">\\r\\n" + 
					"<span class=\\\"w3-right w3-opacity\\\">Due Date: " + rs.getString(4) + "</span>\\r\\n" +
					"<h3>" + rs.getString(8) + " HomeWork\" +\"</h3><br>\\r\\n"+
					"<hr class=\\\"w3-clear\\\">\\r\\n" +
					"<p align=\\\"center\\\"><b>\" + \"Class: " + rs.getString(11) + " " + rs.getString(12) + "</b></p>\\r\\n" +
					"<p> Task(s): " + rs.getString(5) + "</p>\\r\\n" +
					"</div>";
		}
		return homework;
	}
	public void removeHWork() throws NumberFormatException, SQLException		//Removes homework if accidently added
	{
		String sql = "delete from homework where unique_id = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setInt(1, Integer.parseInt(req.getParameter("id")));
		psm.executeUpdate();
	}
	private void RemovePassedHomework() throws SQLException			//Removes old homework to save space
	{
		String sql = "delete from homework where due_date < date_sub(date(now()), interval 3 day)";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.executeUpdate();
	}
	public Employee Register() throws SQLException
	{
		Employee new_employee = new Employee();
		int validCredentials = 0;
		validCredentials = new_employee.setName(req.getParameter("name"));
		validCredentials = new_employee.setFname(req.getParameter("lname"));
		validCredentials = new_employee.setPassword(req.getParameter("psw"));
		validCredentials = new_employee.setGender(req.getParameter("gender"));
		validCredentials = new_employee.setDate(req.getParameter("dob"));
		validCredentials = new_employee.setAddress(req.getParameter("addr"));
		validCredentials = new_employee.setEmail(req.getParameter("usr_email"));
		validCredentials = new_employee.setNumber(req.getParameter("mob_number"));
		validCredentials = new_employee.setEmergencyNumber(req.getParameter("emergency_number"));
		validCredentials = new_employee.setCNIC(req.getParameter("cnic"));
		validCredentials = new_employee.setQualification(req.getParameter("qual"));
		validCredentials = new_employee.setWorkExperience(Double.parseDouble(req.getParameter("experience")));
		validCredentials = new_employee.setJobTitle(req.getParameter("job"));
		validCredentials = new_employee.setSalary(Double.parseDouble(req.getParameter("sal")));
		
		
		if (validCredentials == 0)
		{
			return addRegisteredEmployee(new_employee);
		}
		return null;
	}
	private Employee addRegisteredEmployee(Employee e1) throws SQLException
	{
		String sql = "Insert into employee (name, dateofbirth, fathername, address, phonenumber, emergencynumber, gender, email, cnic, qualification,"
				+ "jobtitle, salary, password, workexperience) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String generatedColumns[] = { "employee_id" };
		PreparedStatement psm = con.prepareStatement(sql, generatedColumns);
		psm.setString(1, e1.getName());
		psm.setString(2, req.getParameter("dob"));
		psm.setString(3, e1.getFname());
		psm.setString(4, e1.getAddress());
		psm.setString(5, e1.getNumber());
		psm.setString(6, e1.getEmergencyNumber());
		psm.setString(7, e1.getGender());
		psm.setString(8, e1.getEmail());
		psm.setString(9, e1.getCNIC());
		psm.setString(10, e1.getQualification());
		psm.setString(11, e1.getJobTitle());
		psm.setDouble(12, e1.getSalary());
		psm.setString(13, e1.getPassword());
		psm.setDouble(14, e1.getWorkExperience());
		
		psm.executeUpdate();
		ResultSet rs = psm.getGeneratedKeys();
		if (rs.next())
		{
			e1.setEmployeeID(rs.getString(1));
			return e1;
		}
		return null;
	}
	private boolean NewUserPermissions(Employee e1)
	{
		UserPermissions p = e1.permissions;
	
		return true;
	}
}
