package classes;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
			@SuppressWarnings("unused")
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
			@SuppressWarnings("unused")
			ExceptionHandler ex = new ExceptionHandler(e, req, resp);
		
		}
	}
	public Employee() {
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
			@SuppressWarnings("unused")
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
	private int getBoolean(String condition)
	{
		if (condition.contains("true"))
			return 0;
		else
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
    		@SuppressWarnings("unused")
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
			navBar += "<a href=\\\"updateMarks.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Update Marks</a>";
		if (permissions.getStudentAttendancePermission())
			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">Add Attendance</a>";
		if (permissions.getAddStudentPermission())
			navBar += "<a href=\\\"student_registration.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Add new Student</a>";
		if (permissions.getUpdateStudentInfo())
			navBar += " <a href=\\\"std_update.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Update Student Info</a>";
		if (permissions.getRemoveStudentPermission())
			navBar += "<a href=\\\"removeStudent.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Remove Student</a>";
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
			navBar += "<a href=\\\"removeEmployee.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Remove Employee</a>";
//		if (permissions.getUpdateTimetablePermission())
//			navBar += "<a href=\\\"?#\\\" class=\\\"w3-bar-item w3-button\\\">Update Timetable</a>";
		if (permissions.getAddEmployeePermission())
			navBar += "<a href=\\\"employee_registration.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Add New Employee</a>";
		if (permissions.getUpdateEmployeeInfo())
			navBar += "<a href=\\\"emp_update.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Update Employee Info</a>";
		navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button\\\">View Attendance</a>";
		
		navBar += "</div>\" + \r\n" + 
				"				\"  </div>";
//		
////		//Adding Admin functionalities
		navBar += "<div class=\\\"w3-dropdown-hover w3-hide-small\\\" >\" +" + 
				"				\"    <button class=\\\"w3-button w3-padding-large\\\" title=\\\"Management Tasks\\\">Management</button>     \" + \r\n" + 
				"				\"    <div class=\\\"w3-dropdown-content w3-card-4 w3-bar-block\\\" style=\\\"width:300px\\\">"; 
//		
		if (permissions.getAddClassSectionPermission())
			navBar += "<a href=\\\"add_class.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Add new Class/Section</a>";
		if (permissions.getAddClassSectionPermission())
			navBar += "<a href=\\\"add_course_teacher.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Add Course Teacher</a>";
		if (permissions.getAddCoursePermission())
			navBar += "<a href=\\\"addcourse.jsp\\\"  title=\\\"Introduce new course\\\" class=\\\"w3-bar-item w3-button\\\">Add new Course</a>";
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
		navBar += "</div>\" + \r\n" + 
				"				\"  </div>";
//		
//		//Adding SMS menu
//		if (permissions.getSendSMSPermission())
//			navBar += "<a href=\\\"#\\\" class=\\\"w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white\\\" title=\\\"Send SMS or Email\\\">Message</a>";
		navBar += "<div class=\\\"w3-dropdown-hover w3-hide-small\\\" style=\\\"margin-right:20%\\\">\\r\\n\" + \r\n" + 
				"				\"    <button class=\\\"w3-button w3-padding-large\\\" title=\\\"Notifications\\\"><img src=\\\"profileIcon.png\\\" class=\\\"w3-circle\\\" style=\\\"height:27px;width:27px\\\"></button>     \\r\\n\" + \r\n" + 
				"				\"    <div class=\\\"w3-dropdown-content w3-card-4 w3-bar-block\\\" style=\\\"width:300px\\\">\\r\\n\" + \r\n" + 
				"				\"      <a href=\\\"changePassword.jsp\\\" class=\\\"w3-bar-item w3-button\\\">Change Password</a>\\r\\n\" + \r\n" + 
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
			System.out.println("Returned Employee ID: " + rs.getString(1));
			return e1;
		}
		return null;
	}
	public boolean NewUserPermissions() throws SQLException
	{
		String sql = "Insert into userpermissions (employee_id, attendanceStudent, addCourse, "
				+ "addMarks, attendanceEmployee, removeStudent, removeEmployee, addEmployee, addStudent, sendSMS, "
				+ "updateTimeTable, updateFee, generateFeeChallan, addClassSection, updateEmployeeInfo, "
				+ "updateStudentInfo) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement psm = con.prepareStatement(sql);
		
		System.out.println("Employee ID recieved: " + req.getParameter("emp_id"));
		psm.setInt(1, Integer.parseInt(req.getParameter("emp_id")));
		psm.setInt(2, getBoolean(req.getParameter("student_atd")));
		psm.setInt(3, getBoolean(req.getParameter("course_add")));
		psm.setInt(4, getBoolean(req.getParameter("marks_add")));
		psm.setInt(5, getBoolean(req.getParameter("emp_atd")));
		psm.setInt(6, getBoolean(req.getParameter("student_rem")));
		psm.setInt(7, getBoolean(req.getParameter("emp_rem")));
		psm.setInt(8, getBoolean(req.getParameter("emp_add")));
		psm.setInt(9, getBoolean(req.getParameter("student_add")));
		psm.setInt(10, getBoolean(req.getParameter("sms")));
		psm.setInt(11, getBoolean(req.getParameter("timetable_add")));
		psm.setInt(12, getBoolean(req.getParameter("fees_add")));
		psm.setInt(13, getBoolean(req.getParameter("fees_gen")));
		psm.setInt(14, getBoolean(req.getParameter("class_add")));
		psm.setInt(15, getBoolean(req.getParameter("emp_upd")));
		psm.setInt(16, getBoolean(req.getParameter("std_upd")));
		
		psm.executeUpdate();
		return true;
	}
	public String getEmployeeInfo(String emp_id) throws SQLException				//Used in Update Employee Page
	{
		String sql = "Select * from employee where employee_id = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setString(1, emp_id.substring(2));
		
		ResultSet rs = psm.executeQuery();
		String emp_info = "";
		if (rs.next())
		{
			emp_info += rs.getString(2) + "~" + rs.getDate(3) + "~" + rs.getString(4) + "~" + rs.getString(5) + "~" + rs.getString(6) + "~" +
					rs.getString(7) + "~" + rs.getString(8) + "~" + rs.getString(9) + "~" + rs.getString(10) + "~" + rs.getString(11) + "~" +
					rs.getString(12) + "~" + rs.getString(13)  + "~" + rs.getString(15) + "~" ;
		}
		
		return emp_info;
	}
	public String savePersonalInfo()	//Update Employee Personal Info
	{
		String sql = "Update employee set name = ?, fathername = ?, dateofBirth=?, gender=? where employee_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			
			Employee temp = new Employee();
			temp.setName(req.getParameter("name"));
			temp.setFname(req.getParameter("lname"));
			temp.setGender(req.getParameter("gender"));
			
			psm.setString(1, temp.getName());
			psm.setString(2, temp.getFname());
			psm.setString(3, req.getParameter("dob"));
			psm.setString(4, temp.getGender());
			psm.setString(5, req.getParameter("emp_id").substring(2));
			
			psm.executeUpdate();
			return "Employee Personal Information successfully updated";
		}
		catch (SQLException e)
		{
			return "Error updating Personal Information";
		}
	}
	public String saveContactInfo()		//Update Employee Contact Info
	{
		String sql = "Update employee set address = ?, phoneNumber = ?, emergencyNumber = ?, email=?, cnic = ? where employee_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, req.getParameter("address"));
			psm.setString(2, req.getParameter("number"));
			psm.setString(3, req.getParameter("emergency_number"));
			psm.setString(4, req.getParameter("email"));
			psm.setString(5, req.getParameter("cnic"));
			psm.setString(6, req.getParameter("emp_id").substring(2));
			
			psm.executeUpdate();
			return "Employee Contact Information successfully updated";
		}
		catch (SQLException e)
		{
			return "Error updating Contact Information.";
		}
	}
	public String saveWorkInfo()			//Update Employee Work Information 
	{
		String sql = "Update employee set qualification = ?, jobtitle = ?, salary = ?, workExperience = ? where employee_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, req.getParameter("qual"));
			psm.setDouble(3, Double.parseDouble(req.getParameter("sal")));
			psm.setDouble(4, Double.parseDouble(req.getParameter("exp")));
			psm.setString(2, req.getParameter("job"));
			psm.setString(5, req.getParameter("emp_id").substring(2));
			
			psm.executeUpdate();
			return "Employee Work Information successfully updated";
		}
		catch (SQLException e)
		{
			return "Error updating Work Information";
		}
	}
	public String printPermissions() throws SQLException
	{
		String sql = "select * from userpermissions where employee_id = ?";
		
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setString(1, req.getParameter("emp_id").substring(2));
		String permissions = "<h3 class=\"page-title\">\r\n" + 
				"        Permissions\r\n" + 
				"\r\n" + 
				"        <a href=\"#\" class=\"btn btn-primary btn-xs pull-right\" title=\"save changes to Employee Permissions\" onclick=\"savePermissions()\">Save</a>\r\n" + 
				"    </h3>";
		
		
		permissions += "<div class=\"row\"><br>";
		ResultSet rs = psm.executeQuery();
		int i = 0;
		if (rs.next())
		{
			//Permission Work 1
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Student Attendance</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 2
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add Course</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(i+2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 3
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add Marks</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 4
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Employee Attendance</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(i+2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 1
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Remove Student</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 2
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Remove Employee</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(i+2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 3
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add Employee</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 4
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add Student</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(i+2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 1
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Send Message</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 2
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Update Timetable</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(i+2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 3
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Revise Fee</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 4
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Generate Fee Challan</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(i+2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 1
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add new Class/Section</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 2
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Update Employee Info</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(i+2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 3
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Update Student Info</label>\r\n" + 
					"			<div align=\"center\">";
			
			if (rs.getBoolean(2))
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\" checked>Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\">No";
			}
			else
			{
				permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			}
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
		}
		else						//IF NO PERMISSIONS ARE SET FOR THE SELECTED USER
		{
			//Permission Work 1
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Student Attendance</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 2
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add Course</label>\r\n" + 
					"			<div align=\"center\">";
			
		
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 3
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add Marks</label>\r\n" + 
					"			<div align=\"center\">";
			
		
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 4
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Employee Attendance</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
					"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 1
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Remove Student</label>\r\n" + 
					"			<div align=\"center\">";
			
		
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 2
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Remove Employee</label>\r\n" + 
					"			<div align=\"center\">";
			
	
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 3
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add Employee</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 4
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add Student</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 1
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Send Message</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
		
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 2
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Update Timetable</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 3
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Revise Fee</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 4
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Generate Fee Challan</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 1
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Add new Class/Section</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 2
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Update Employee Info</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
			
			//Permission Work 3
			permissions += "<div class=\"form-group col-sm-6\">\r\n" + 
					"            <div><label>Update Student Info</label>\r\n" + 
					"			<div align=\"center\">";
			
			
			permissions += "<input type=\"radio\" name=\"" + i + "\" style=\"width:20%\" value=\"1\">Yes\r\n" + 
						"			<input type=\"radio\"  name=\"" + i + "\" style=\"width:20%\" value=\"0\" id=\"" + i + "\" checked>No";
			
			
			permissions += "</div>\r\n" + 
					"			</div>\r\n" + 
					"        </div>";
			i++;
			//Permission Work End
		}
		
		permissions += "</div>\r\n" + 
				"    </div>";
		return permissions;
	}
	public String savePermissions()
	{
		//Determining if the permissions already exists
		String check = "Select * from userpermissions where employee_id = ?";
		
		try
		{
			PreparedStatement psm = con.prepareStatement(check);
			System.out.println("ID: " + req.getParameter("emp_id"));
			psm.setString(1, req.getParameter("emp_id").substring(2));
			
			ResultSet rs = psm.executeQuery();
			if (rs.next())
			{
				System.out.println("Already Exist");
				//If permissions already exists then update
				String sql = "Update userpermissions set " +
						"  attendanceStudent   =  ?," + 
						"  addCourse = ?, " +
						"  addMarks   =  ?," + 
						"  attendanceEmployee = ?, " +
						"  removeStudent   =  ?," + 
						"  removeEmployee = ?, " +
						"  addEmployee   =  ?," + 
						"  addStudent = ?, " +
						"  sendSMS   =  ?," + 
						"  updateTimeTable = ?, " +
						"  updateFee   =  ?," + 
						"  generateFeeChallan = ?, " + 
						"  addClassSection   =  ?," + 
						"  updateEmployeeInfo = ?, " +
						"  updateStudentInfo  =  ? where employee_id = ?";
				
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(16, req.getParameter("emp_id").substring(2));
				ps.setInt(1, getBoolean(req.getParameter("student_atd")));
				ps.setInt(2, getBoolean(req.getParameter("course_add")));
				ps.setInt(3, getBoolean(req.getParameter("marks_add")));
				ps.setInt(4, getBoolean(req.getParameter("emp_atd")));
				ps.setInt(5, getBoolean(req.getParameter("student_rem")));
				ps.setInt(6, getBoolean(req.getParameter("emp_rem")));
				ps.setInt(7, getBoolean(req.getParameter("emp_add")));
				ps.setInt(8, getBoolean(req.getParameter("student_add")));
				ps.setInt(9, getBoolean(req.getParameter("sms")));
				ps.setInt(10, getBoolean(req.getParameter("timetable_add")));
				ps.setInt(11, getBoolean(req.getParameter("fees_add")));
				ps.setInt(12, getBoolean(req.getParameter("fees_gen")));
				ps.setInt(13, getBoolean(req.getParameter("class_add")));
				ps.setInt(14, getBoolean(req.getParameter("emp_upd")));
				ps.setInt(15, getBoolean(req.getParameter("std_upd")));
				
				ps.executeUpdate();
			}
			else
			{
				System.out.println("Does not Exist");
				//Permissions does not exist therefore creating a new column
				String sql = "Insert into userpermissions (employee_id, attendanceStudent, addCourse, "
						+ "addMarks, attendanceEmployee, removeStudent, removeEmployee, addEmployee, addStudent, sendSMS, "
						+ "updateTimeTable, updateFee, generateFeeChallan, addClassSection, updateEmployeeInfo, "
						+ "updateStudentInfo) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, req.getParameter("emp_id").substring(2));
				ps.setInt(2, getBoolean(req.getParameter("student_atd")));
				ps.setInt(3, getBoolean(req.getParameter("course_add")));
				ps.setInt(4, getBoolean(req.getParameter("marks_add")));
				ps.setInt(5, getBoolean(req.getParameter("emp_atd")));
				ps.setInt(6, getBoolean(req.getParameter("student_rem")));
				ps.setInt(7, getBoolean(req.getParameter("emp_rem")));
				ps.setInt(8, getBoolean(req.getParameter("emp_add")));
				ps.setInt(9, getBoolean(req.getParameter("student_add")));
				ps.setInt(10, getBoolean(req.getParameter("sms")));
				ps.setInt(11, getBoolean(req.getParameter("timetable_add")));
				ps.setInt(12, getBoolean(req.getParameter("fees_add")));
				ps.setInt(13, getBoolean(req.getParameter("fees_gen")));
				ps.setInt(14, getBoolean(req.getParameter("class_add")));
				ps.setInt(15, getBoolean(req.getParameter("emp_upd")));
				ps.setInt(16, getBoolean(req.getParameter("std_upd")));
				
				ps.executeUpdate();
			}
			
			
			return "Employee Permissions successfully Updated.";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Error Updating Employee Permissions";
		}
	}
	public String getStudentInfo(String student_id) throws SQLException
	{
		String sql = "select * from student, class_section where class_section.class_id = student.class_id and student_id = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		String std_info = "";
		psm.setString(1, student_id.substring(2));
		
		ResultSet rs = psm.executeQuery();
		
		if (rs.next())
		{
			std_info += rs.getString(2) + "~" + rs.getDate(3) + "~" + rs.getString(4) + "~" + rs.getString(5) + "~" + rs.getString(6) + "~" +
					rs.getString(7) + "~" + rs.getString(8) + "~" + rs.getString(9) + "~" + rs.getString(13) + "~" + rs.getString(10) + "~" +
					rs.getString(12) + "~" + rs.getString(11)  + "~" + rs.getString(17) + "~" + rs.getString(18) + "~";
		}
		
		return std_info;
	}
	public String saveStudentPersonalInfo()		//Update Student Personal Info
	{
		String sql = "Update student set name = ?, fathername = ?, dateofBirth=?, gender=? where student_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			
			Employee temp = new Employee();
			temp.setName(req.getParameter("name"));
			temp.setFname(req.getParameter("lname"));
			temp.setGender(req.getParameter("gender"));
			
			psm.setString(1, temp.getName());
			psm.setString(2, temp.getFname());
			psm.setString(3, req.getParameter("dob"));
			psm.setString(4, temp.getGender());
			psm.setString(5, req.getParameter("std_id").substring(2));
			
			psm.executeUpdate();
			return "Student Personal Information successfully updated";
		}
		catch (SQLException e)
		{
			return "Error updating Personal Information";
		}
	}
	public String saveStudentContactInfo()
	{
		String sql = "Update student set address = ?, phoneNumber = ?, emergencyNumber = ?, email=? where student_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, req.getParameter("address"));
			psm.setString(2, req.getParameter("number"));
			psm.setString(3, req.getParameter("emergency_number"));
			psm.setString(4, req.getParameter("email"));
			psm.setString(5, req.getParameter("std_id").substring(2));
			
			psm.executeUpdate();
			return "Student Contact Information successfully updated";
		}
		catch (SQLException e)
		{
			return "Error updating Contact Information.";
		}
	}
	public String saveStudentParentInfo()
	{
		String sql = "Update student set fatherOccupation = ?, motherOccupation = ?, motherName = ?, fatherCNIC = ? where student_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, req.getParameter("fOcc"));
			psm.setString(2, req.getParameter("mOcc"));
			psm.setString(3, req.getParameter("mName"));
			psm.setString(4, req.getParameter("fCNIC"));
			psm.setString(5, req.getParameter("std_id").substring(2));
			
			psm.executeUpdate();
			return "Parent/Guardian Information successfully updated";
		}
		catch (SQLException e)
		{
			return "Error updating Parent/Guardian Information";
		}
	}
	public String saveStudentNewClass()
	{
		//First verifying if the entered class and section are valid
		String sql = "select * from class_section where class=? and section=?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, req.getParameter("class_std"));
			psm.setString(2, req.getParameter("section"));
			
			ResultSet rs = psm.executeQuery();
			if (rs.next())
			{
				sql = "update student set class_id = ? where student_id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, rs.getString(1));
				ps.setString(2, req.getParameter("std_id").substring(2));
				
				ps.executeUpdate();
				return "Student's class/section successfully updated.";
			}
			else
				return "The entered class/section does not exist.";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Error updating class/section of student";
		}
	}
	public String getFullEmployeeName(String id)
	{
		String sql = "Select name, fatherName from employee where employee_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, id.substring(2));
			
			ResultSet rs = psm.executeQuery();
			if (rs.next())
			{
				return rs.getString(1) + "~" + rs.getString(2) + "~";
			}
			return "~";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "~";
		}
	}
	public String deleteEmployeeData(String id)
	{
		String sql = "Delete from employee where employee_id = ?";
		String permissions = "Delete from userpermissions where employee_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			PreparedStatement psm2 = con.prepareStatement(permissions);
			psm.setString(1, id.substring(2));
			psm2.setString(1, id.substring(2));
			
			psm.executeUpdate();
			psm2.executeUpdate();
			return "Data successfully removed of the selected Employee";
		}
		catch (SQLException e)
		{
			return "Error removing Employee's Data. Please try again";
		}
	}
	public String getFullStudentName(String id)
	{
		String sql = "Select name, fatherName from student where student_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, id.substring(2));
			
			ResultSet rs = psm.executeQuery();
			if (rs.next())
			{
				return rs.getString(1) + "~" + rs.getString(2) + "~";
			}
			return "~";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "~";
		}
	}
	public String deleteStudentData(String id)
	{
		String sql = "Delete from student where student_id = ?";
		//TODO More tables to be added where student_id is foreign key
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, id.substring(2));
			
			psm.executeUpdate();
			return "Data removed of the selected Student.";
		}
		catch (SQLException e)
		{
			return "Error deleting Student Data.Please try again later...";
		}
	}
	public ArrayList<String> getClasses() throws SQLException
	{
		String sql = "Select * from class_section";
		PreparedStatement psm = con.prepareStatement(sql);
		
		ResultSet rs = psm.executeQuery();
		ArrayList<String> class_section = new ArrayList<String>();
		while(rs.next())
		{
			class_section.add(rs.getString(2) + "-" + rs.getString(3));
		}
		return class_section;
	}
	public ArrayList<Integer> getClassID() throws SQLException
	{
		String sql = "Select * from class_section";
		PreparedStatement psm = con.prepareStatement(sql);
		
		ArrayList<Integer> class_id = new ArrayList<Integer>();
		ResultSet rs = psm.executeQuery();
		while(rs.next())
		{
			class_id.add(rs.getInt(1));
		}
		return class_id;
	}
	public Student RegisterStudent() throws NoSuchAlgorithmException, SQLException
	{
		Student new_student = new Student();
		int validCredentials = 0;
		validCredentials = new_student.setName(req.getParameter("name"));
		validCredentials = new_student.setFname(req.getParameter("lname"));
		validCredentials = new_student.setPassword(req.getParameter("psw"));
		validCredentials = new_student.setGender(req.getParameter("gender"));
		validCredentials = new_student.setDate(req.getParameter("dob"));
		validCredentials = new_student.setAddress(req.getParameter("addr"));
		validCredentials = new_student.setEmail(req.getParameter("usr_email"));
		validCredentials = new_student.setNumber(req.getParameter("mob_number"));
		validCredentials = new_student.setEmergencyNumber(req.getParameter("emergency_number"));
		validCredentials = new_student.setFatherCNIC(req.getParameter("cnic"));
		validCredentials = new_student.setFatherOccupation(req.getParameter("fatherOccupation"));
		validCredentials = new_student.setMotherName(req.getParameter("motherName"));
		validCredentials = new_student.setMotherOccupation(req.getParameter("motherOccupation"));
		validCredentials = new_student.setClassID(Integer.parseInt(req.getParameter("class")));
		
		if (validCredentials == 0)
		{
			return addRegisteredStudent(new_student);
		}
		return null;

	}
	private Student addRegisteredStudent(Student s1) throws SQLException
	{
		String sql = "Insert into student (name, dateofbirth, fathername, address, phonenumber, emergencynumber, gender, email, fatherOccupation, motherOccupation,"
				+ "mothername, fatherCNIC, password, class_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String generatedColumns[] = { "student_id" };
		PreparedStatement psm = con.prepareStatement(sql, generatedColumns);
		psm.setString(1, s1.getName());
		psm.setString(2, req.getParameter("dob"));
		psm.setString(3, s1.getFname());
		psm.setString(4, s1.getAddress());
		psm.setString(5, s1.getNumber());
		psm.setString(6, s1.getEmergencyNumber());
		psm.setString(7, s1.getGender());
		psm.setString(8, s1.getEmail());
		psm.setString(9, s1.getFatherOccupation());
		psm.setString(10, s1.getMotherOccupation());
		psm.setString(11, s1.getMotherName());
		psm.setString(12, s1.getFatherCNIC());
		psm.setString(13, s1.getPassword());
		psm.setInt(14, s1.getClassID());
		
		psm.executeUpdate();
		ResultSet rs = psm.getGeneratedKeys();
		if (rs.next())
		{
			s1.setID(rs.getString(1));
			System.out.println("Returned Student ID: " + rs.getString(1));
			return s1;
		}
		return null;
	}
	public String AddCourse()
	{
		String sql = "Insert into courses (course_name, totalMarks) values (?,?)";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			
			psm.setString(1, req.getParameter("name"));
			psm.setString(2, req.getParameter("class"));
			
			psm.executeUpdate();
			
			return "Course successfully added";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Course entry Duplication. The given entry already exists.";
		}
	}
	public String AddClass()
	{
		String sql = "Insert into class_section (class, section) values (?,?)";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, req.getParameter("class_name"));
			psm.setString(2, req.getParameter("section"));
			
			psm.executeUpdate();
			return "New Class/Section successfully added.";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Entered Class and Section already exists.";
		}
	}
	public String getSubjectID(String course) throws SQLException
	{
		String sql = "Select course_id from courses where course_name = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		
		psm.setString(1, course.toLowerCase());
		ResultSet rs = psm.executeQuery();
		if (rs.next())
			return rs.getString(1);
		return "";
	}
	public String getClassID(String class_name, String section) throws SQLException
	{
		String sql = "Select class_id from class_section where class = ? and section = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		
		psm.setString(1, class_name);
		psm.setString(2, section);
		
		ResultSet rs = psm.executeQuery();
		if (rs.next())
			return rs.getString(1);
		return "";
	}
	public String AddCourseTeacher()
	{
		String sql = "Insert into courses_teacher_class (course_id, teacher_id, class_id) values (?,?,?)";
		
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, req.getParameter("course"));
			psm.setString(2, req.getParameter("teacher_id").substring(2));
			psm.setString(3, req.getParameter("class_id"));
			
			psm.executeUpdate();
			return "Course Teacher successfully added"; 
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Adding Course Teacher Failed.\n1.Check if the information provided is valid\n2.The teacher is already teaching this course for this class";
		}
	}
	public String changePassword()
	{
		String sql = "update employee set password = ? where employee_id = ? and password = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, EncryptPassword(req.getParameter("new_pass")));
			psm.setString(2, this.employee_id);
			psm.setString(3, EncryptPassword(req.getParameter("old_pass")));
			
			if (psm.executeUpdate() == 1)
				return "Password changed successfully";
			else
				return "Password not changed. Please make sure you entered the correct old password.";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Error changing password. Please check if you have entered old password correctly";
		}
	}
	public String generateMarksTable()
	{
		String subject_class = req.getParameter("subject_class");
		String max_marks = req.getParameter("marks");
		String title = req.getParameter("title_marks");
		//extracting subject id and class id
		try
		{
			int subject_id = Integer.parseInt(subject_class.substring(0, subject_class.indexOf("-")));
			int class_id = Integer.parseInt(subject_class.substring(subject_class.indexOf("-") + 1));
			float total_marks = Float.parseFloat(max_marks);
			
			
			
			String query = "Select course_name from courses where course_id = ?";
			PreparedStatement ptemp = con.prepareStatement(query);
			ptemp.setInt(1, subject_id);
			ResultSet rtemp = ptemp.executeQuery();
			rtemp.next();
			
			//If marks has already been uploaded and are requested to be updated
			String temp = "";
			if ((temp = CheckIfMarksAlreadyExists(title, total_marks, class_id, subject_id, rtemp.getString(1))) != null)
				return temp;
				
			//If marks are not not previously uploaded and new marks are saved
			String sql = "Select student_id, name, fatherName from student where class_id = ?";
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setInt(1, class_id);
			String table_contents = "<h2 class=\"page-title\">\r\n" + 
					rtemp.getString(1) + " " + title + " Marks" + 
					"\r\n" + 
					"<a href=\"#\" class=\"btn btn-primary btn-xs pull-right\" onclick=\"saveTable()\" title=\"Save marks\">Save/Update Marks</a>\r\n" + 
					"</h2>"
					+ "<table id=\"updateMarks\" class=\"czz\" >\r\n" + 
					"			<tr>\r\n" + 
					"			<th>S. No</th>\r\n" + 
					"			<th>Student Id</th>\r\n" + 
					"			<th>Student Name</th>\r\n" + 
					"			<th>Marks Obtained</th>\r\n" + 
					"			\r\n" + 
					"			</tr>\r\n" + 
					"			<tbody>";
			
			ResultSet rs = psm.executeQuery();
			
			int i =0;
			while (rs.next())
			{
				i++;
				table_contents += "<tr>\r\n" + 
						"<input type=\"hidden\" id=\"" + i + "\" value=\"" + rs.getString(1) + "\">" +
						"			<td><p>" + i + "</p></td>\r\n" + 
						"			<td><p>sk" + rs.getString(1) + "</p></td>\r\n" + 
						"			<td><p>" + rs.getString(2) + " " + rs.getString(3) + "</p></td>\r\n" + 
						"			<td><input type=\"number\" class=\"updin\" value=\"0\" min=\"0\" max=\"" + total_marks + "\" id=\"" + rs.getString(1) + "\"></td>\r\n" + 
						"			\r\n" + 
						"			</tr>";
			}
			
			table_contents += "</tbody>\r\n" + 
					"	        </table>"
					+ "<input type=\"hidden\" id=\"table_state\" value=\"new\">"
					+ "<input type=\"hidden\" id=\"total_students\" value=\"" + i + "\">";
			
			return table_contents;
		}
		catch (NumberFormatException ne)
		{
			return "<h3>Please enter a valid subject and class - section</h3>";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "<h2>Error retrieving table contents. Please try again.</h2>";
		}
	}
	private String CheckIfMarksAlreadyExists(String title, float total_marks, int class_id, int subject_id, String subjectName) throws SQLException
	{
		String sql = "Select * from marks, student where title = ? and teacher_id = ? and course_id = ? and marks.class_id = ? and total_Marks = ?"
				+ "and student.student_id = marks.student_id";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setString(1, title);
		psm.setString(2, employee_id);
		psm.setInt(3, subject_id);
		psm.setInt(4, class_id);
		psm.setFloat(5, total_marks);
		
		ResultSet rs = psm.executeQuery();
		String contents = "<h2 class=\"page-title\">\r\n" + 
				subjectName + " " + title + " Marks" + 
				"\r\n" + 
				"<a href=\"#\" class=\"btn btn-primary btn-xs pull-right\" onclick=\"saveTable()\" title=\"Save marks\">Save/Update Marks</a>\r\n" + 
				"</h2>" +
				"<table id=\"updateMarks\" class=\"czz\" >\r\n" + 
				"			<tr>\r\n" + 
				"			<th>S. No</th>\r\n" + 
				"			<th>Student Id</th>\r\n" + 
				"			<th>Student Name</th>\r\n" + 
				"			<th>Marks Obtained</th>\r\n" + 
				"			\r\n" + 
				"			</tr>\r\n" + 
				"			<tbody>";
		
		int i=0;
		while(rs.next())
		{
			i++;
			contents += "<tr>\r\n" + 
					"<input type=\"hidden\" id=\"" + i + "\" value=\"" + rs.getString(3) + "\">" +
					"			<td><p>" + i + "</p></td>\r\n" + 
					"			<td><p>sk" + rs.getString(3) + "</p></td>\r\n" + 
					"			<td><p>" + rs.getString(11) + " " + rs.getString(13) + "</p></td>\r\n" + 
					"			<td><input type=\"number\" class=\"updin\" value=\"" + rs.getFloat(7) + "\" min=\"0\" max=\"" + total_marks + "\" id=\"" + rs.getString(3) + "\"></td>\r\n" + 
					"			\r\n" + 
					"			</tr>";
		}
		
		
		contents += "</tbody>\r\n" + 
				"	        </table>"
				+ "<input type=\"hidden\" id=\"table_state\" value=\"old\">"
				+ "<input type=\"hidden\" id=\"total_students\" value=\"" + i + "\">";
		
		if (i > 0)
			return contents;
		return null;
	}
	public String saveMarks()	//When the table is new
	{
		String subject_class = req.getParameter("subject_class");
		String max_marks = req.getParameter("marks");
		String title = req.getParameter("title_marks");
		try
		{
			int subject_id = Integer.parseInt(subject_class.substring(0, subject_class.indexOf("-")));
			int class_id = Integer.parseInt(subject_class.substring(subject_class.indexOf("-") + 1));
			float total_marks = Float.parseFloat(max_marks);
			int total_students = Integer.parseInt(req.getParameter("total_students"));
			String sql = "Insert into marks (teacher_id, student_id, course_id, class_id, title, marks_obtained, total_Marks, weightage) values"
					+ "(?,?,?,?,?,?,?,?)";
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, employee_id);
			psm.setInt(3, subject_id);
			psm.setInt(4, class_id);
			psm.setString(5, title);
			psm.setFloat(7, total_marks);
			psm.setFloat(8, 0);
			
			//saving data of each student one by one
			for (int i=1; i<=total_students; i++)
			{
				psm.setString(2, req.getParameter("stdID_" + i));
				psm.setString(6, req.getParameter("stdMarks_" + i));
				psm.executeUpdate();
			}
			return "Marks saved for " + title;
		}
		catch (NumberFormatException e)
		{
			return "Operation cancelled. Values tempered.";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Error saving marks. Please try again.";
		}
	}
	public String updateMarks()	//When the table state is old
	{
		String subject_class = req.getParameter("subject_class");
		String max_marks = req.getParameter("marks");
		String title = req.getParameter("title_marks");
		try
		{
			int subject_id = Integer.parseInt(subject_class.substring(0, subject_class.indexOf("-")));
			int class_id = Integer.parseInt(subject_class.substring(subject_class.indexOf("-") + 1));
			float total_marks = Float.parseFloat(max_marks);
			int total_students = Integer.parseInt(req.getParameter("total_students"));
			String sql = "update marks set marks_obtained = ? where teacher_id = ? and student_id = ? and course_id = ? and class_id = ? and"
					+ " title = ? and total_marks = ?";
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(2, employee_id);
			psm.setInt(4, subject_id);
			psm.setInt(5, class_id);
			psm.setString(6, title);
			psm.setFloat(7, total_marks);
			
			//saving data of each student one by one
			boolean all_valid = true;
			for (int i=1; i<=total_students; i++)
			{
				if (Double.parseDouble(req.getParameter("stdMarks_" + i)) > total_marks)
				{
					all_valid = false;
					continue;
				}
				psm.setString(3, req.getParameter("stdID_" + i));
				psm.setString(1, req.getParameter("stdMarks_" + i));
				psm.executeUpdate();
			}
			
			if (all_valid)
				return "Marks saved for " + title;
			else
				return "Some students marks not saved.";
		}
		catch (NumberFormatException e)
		{
			return "Operation cancelled. Values tempered.";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Error saving marks. Please try again.";
		}
	}
}
