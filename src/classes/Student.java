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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Student extends Person{
	private String fatherOccupation, motherOccupation, motherName, password, fatherCNIC, student_id, standard, section;
	private int class_id;
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private Connection con;
	private boolean logged;
	
	public Student() {
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
			ExceptionHandler ex = new ExceptionHandler(e);
		}
	}
	public Student(HttpServletRequest requset , HttpServletResponse response) {
		req = requset;
		resp = response;
		HttpSession sess = req.getSession(false);
		logged = (boolean) sess.getAttribute("std_logged_status");
		try
		{
			metaData m1 = new metaData();
			System.out.println(m1.getDatabaseName());
			System.out.println(m1.getSchoolName());
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + m1.getDatabaseName(), "root", "root");
			System.out.println("Connection successful");
			if (!LoadSessionData())
				System.out.println("Invalid session id...return to homepage");
		}
		catch (Exception e)
		{
			@SuppressWarnings("unused")
			ExceptionHandler ex = new ExceptionHandler(e, req, resp);
		}
	}
	public Student(HttpServletRequest request, HttpServletResponse response, boolean login)
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
	/*
	 * Beginning of setter/getter functions
	 */
	public String getFatherOccupation()
	{
		return fatherOccupation;
	}
	public String getMotherOccupation()
	{
		return motherOccupation;
	}
	public String getMotherName()
	{
		return motherName;
	}
	protected int setPassword(String pPass) throws NoSuchAlgorithmException
	{
		if (pPass.length() >= 8)
		{
			password = EncryptPassword(pPass);
			return 0;
		}
		return 1;
	}
	public String getFatherCNIC()
	{
		return fatherCNIC;
	}
	public String getStudentID()
	{
		return student_id;
	}
	protected int setID(String id)
	{
		try
		{
			Integer.parseInt(id);
			student_id = id;
			return 0;
		}
		catch (NumberFormatException ex)
		{
			return 1;
		}
	}
	protected int setFatherCNIC(String c)
	{
		try
		{
			if (c.length() < 13 || c.length() > 13)
				return 1;
			Long.parseLong(c);
			fatherCNIC = c;
			return 0;
		}
		catch (NumberFormatException ex)
		{
			return 1;
		}
	}
	protected int setClassSection(String class_section) throws SQLException
	{
		String sql = "Select * from class_section where class = ? and section = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		
		psm.setString(1, class_section.substring(0, class_section.indexOf("-")));
		psm.setString(2, class_section.substring(class_section.indexOf("-")));
		
		ResultSet rs = psm.executeQuery();
		if (rs.next())
		{
			class_id = rs.getInt(1);
			return 0;
		}
		return 1;
	}
	protected int setClassID(int id)
	{
		class_id = id;
		return 0;
	}
	protected int getClassID()
	{
		return class_id;
	}
	protected int setStudentID(String em)
	{
		try
		{
			Integer.parseInt(em);
			student_id = em;
			return 0;
		}
		catch (NumberFormatException ex)
		{
			return 1;
		}
	}
	protected int setMotherName(String m)
	{
		if (m.length() >= 2)
		{
			motherName = m;
			return 0;
		}
		return 1;
	}
	protected int setMotherOccupation(String o)
	{
		if (o.length() >= 2)
		{
			motherOccupation = o;
			return 0;
		}
		return 1;
	}
	protected int setFatherOccupation(String o)
	{
		if (o.length() >= 2)
		{
			fatherOccupation = o;
			return 0;
		}
		return 1;
	}
	public String getClassSection()
	{
		if (standard == null)
			return "Not Assigned";
		return standard + " " + section;
	}
	/*
	 * End of setter/getter functions
	 */
	
	private String EncryptPassword (String input) throws NoSuchAlgorithmException
    { 
		/*
		 * Purpose: Encrypts Password into hash form
		 * Usage: Password from user will be encrypted and then compared to database password
		 */
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
	protected String getPassword()
	{
		return password;
	}
	public void Login() throws IOException, NoSuchAlgorithmException, SQLException
	{
		String in_id = req.getParameter("uname").substring(2);
		String in_password = req.getParameter("psw");
		
		System.out.println("Entered ID: " + in_id);
		System.out.println("Entered Pass: " + in_password);
		
		in_password = EncryptPassword(in_password);
		
		String sql = "Select * from student where student_id = ? and password = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setString(1, in_id);
		psm.setString(2, in_password);
		
		ResultSet rs = psm.executeQuery();
		if (rs.next())
		{
			HttpSession sess = req.getSession();
			sess.setMaxInactiveInterval(1200);
			LoadData(rs);
			sess.setAttribute("std_obj", this);
			resp.sendRedirect("student_homepage.jsp");
		}
		else
			resp.sendRedirect("indexInvalid.jsp");
	}
	private void LoadData(ResultSet rs) throws SQLException
	{
		student_id = rs.getString(1);
		name = rs.getString(2);
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
		fatherOccupation = rs.getString(10);
		motherOccupation = rs.getString(11);
		motherName = rs.getString(12);
		fatherCNIC = rs.getString(13);
		class_id = rs.getInt(15);
		//Setting class and section
		String sql = "Select * from class_section where class_id = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setInt(1, class_id);
		ResultSet res = psm.executeQuery();
		if (res.next())
		{
			standard = res.getString(2);
			section = res.getString(3);
		}
		
		HttpSession sess = req.getSession();
		sess.setAttribute("std_logged_status", true);
		sess.setAttribute("std_login_id", Integer.parseInt(student_id) * 47);
		logged = true;
	}
	private boolean LoadSessionData() throws SQLException
	{
		HttpSession sess = req.getSession(false);
		try
		{
			int session_id = (Integer) sess.getAttribute("std_login_id");
			student_id = Integer.toString(session_id / 47);
			System.out.println("Loaded student id: " + student_id);
			String sql = "Select * from student where student_id = ?";
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, student_id);
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
	private String getHomeworkImageSource(String subject_lower)
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
	public String getHomeWork() throws SQLException
	{
		String sql = "select * from homework, courses, class_section, employee where DATE_ADD(due_date, INTERVAL 1 DAY) >= date(now()) and "
				+ "homework.class_id = ? and homework.course_id = courses.course_id and class_section.class_id = homework.class_id and "
				+ "homework.teacher_id = employee.employee_id order by due_date";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setInt(1, class_id);
		ResultSet rs = psm.executeQuery();
		String homework = "";
		while (rs.next())
		{
			homework += "<div class=\\\"w3-container w3-card w3-white w3-round w3-margin\\\" id=\\\"" + rs.getString(6) + "\\\"><br>\\r\\n" +
					"<img src=\\\"" + getHomeworkImageSource(rs.getString(8).toLowerCase()) + "\\\" alt=\\\"Avatar\\\" "
							+ "class=\\\"w3-left w3-circle w3-margin-right\\\" style=\\\"width:60px\\\">\\r\\n" + 
					"<span class=\\\"w3-right w3-opacity\\\">Due Date: " + rs.getString(4) + "</span>\\r\\n" +
					"<h3>" + rs.getString(8) + " HomeWork\" +\"</h3><br>\\r\\n"+
					"<hr class=\\\"w3-clear\\\">\\r\\n";
			if (rs.getString(20).equals("M"))
				homework += "<p align=\\\"center\\\"><b>\" + \"Posted By: Sir " + rs.getString(14) + "</b></p>\\r\\n";
			else
				homework += "<p align=\\\"center\\\"><b>\" + \"Posted By: Miss " + rs.getString(14) + "</b></p>\\r\\n";
			homework += "<p> Task(s): " + rs.getString(5) + "</p>\\r\\n" +
					"</div>";
		}
		
		if (homework.equals(""))
			return "<div class=\\\"w3-container w3-card w3-white w3-round w3-margin\\\"><br>\\r\\n"
			+ "<p>No homework due...Enjoy!</p></div>";
		else
			return homework;
	}
	public String changePassword() throws NoSuchAlgorithmException
	{
		String sql = "update student set password = ? where student_id = ? and password = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, EncryptPassword(req.getParameter("new_pass")));
			psm.setString(2, this.student_id);
			psm.setString(3, EncryptPassword(req.getParameter("old_pass")));
			
			if (psm.executeUpdate() == 1)
				return "Password changed successfully";
			else
				return "Password not changed. Please enter correct old password.";
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Error changing password. Please check if you have entered old password correctly";
		}
	}
	public String getSubjectsName()
	{
		String sql = "select course_name, courses.course_id, student.class_id from courses_teacher_class, courses, student where "
				+ "student.class_id = courses_teacher_class.class_id "
				+ "and courses_teacher_class.course_id = courses.course_id and student_id = ?";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			psm.setString(1, student_id);
			
			String subjects = "<ul class=\"nav nav-tabs m-tabs m-tabs-line  m-tabs-line--right m-tabs-line-danger\" role=\"tablist\" >";
			
			ResultSet rs = psm.executeQuery();
			while(rs.next())
			{
				subjects += "<li class=\"nav-item m-tabs__item\">\r\n" + 
						"                                <a class=\"nav-link m-tabs__link\" id=\"" + rs.getString(2) + "-" + rs.getString(3) + "\" data-toggle=\"tab\" onclick=\"getMarks(this)\" role=\"tab\">\r\n" + 
						                          rs.getString(1)          + 
						"                                </a>\r\n" + 
						"                            </li>";
			}
			
			subjects += "</ul>";
			return subjects;
		}
		catch (SQLException e)
		{
			return "Error occured while retrieving subjects. Please try reloading the page";
		}
	}
	public String getMarksTable()
	{
		String sql = "select * from marks, courses where courses.course_id = ? "
				+ "and class_id = ? and student_id = ? and courses.course_id = marks.course_id";
		try
		{
			PreparedStatement psm = con.prepareStatement(sql);
			String course_class_id = req.getParameter("course_class");
			String course_id = course_class_id.substring(0, course_class_id.indexOf("-"));
			String class_id = course_class_id.substring(course_class_id.indexOf("-") + 1);
			
			psm.setString(1, course_id);
			psm.setString(2, class_id);
			psm.setString(3, student_id);
			
			System.out.println("Course_id = " + course_id);
			System.out.println("Class id = " + class_id);
			
			ResultSet rs = psm.executeQuery();
			String marks_table = "<div class=\"tab-pane active\"  id=\"CL203\">\r\n" + 
					"			  <div id=\"accordion\">\r\n"; 
//					"                <h5>" + rs.get"</h5>";
			
			while(rs.next())
			{
				String marks_meta = "select avg(marks_obtained), min(marks_obtained), max(marks_obtained) "
						+ "from marks where title = ? and course_id = ? and class_id = ?";
				PreparedStatement meta = con.prepareStatement(marks_meta);
				meta.setString(1, rs.getString(6));
				meta.setString(2, course_id);
				meta.setString(3, class_id);
				
				ResultSet meta_result = meta.executeQuery();
				meta_result.next();
				
				marks_table += "<div class=\"card\">\r\n" + 
						"               <div class=\"card-header\" id=\"" + rs.getString(6).replaceAll("\\s+","") + "\">\r\n" + 
						"               <h5 class=\"mb-0\">\r\n" + 
						"               <button class=\"btn btn-link collapsed\" data-toggle=\"collapse\" data-target=\"#" + rs.getString(4) + "-" + rs.getString(6).replaceAll("\\s+","") + "\" aria-expanded=\"false\" aria-controls=\""+ rs.getString(4) + "-" + rs.getString(6).replaceAll("\\s+","") +"\">\r\n" + 
										rs.getString(6) + 
						"               </button>\r\n" + 
						"               </h5>\r\n" + 
						"               </div>\r\n" + 
						"\r\n" + 
						"               <div id=\"" + rs.getString(4) + "-" + rs.getString(6).replaceAll("\\s+","") + "\" class=\"collapse\" data-parent=\"#accordion\" aria-labelledby=\"" + rs.getString(6).replaceAll("\\s+","") + "\">\r\n" + 
						"               <div class=\"card-body\">\r\n" + 
						"               <table class=\"sum_table table m-table m-table--head-bg-info table-bordered table-striped table-responsive\">\r\n" + 
						"               <thead>\r\n" + 
						"               <tr class=\"titlerow\">\r\n" + 
						"               <th class=\"text-center\">" + rs.getString(6).replaceAll("\\s+","") + "</th>\r\n" + 
						"                                                                                  \r\n" + 
						"               <th class=\"text-center\">Obtained Marks</th>\r\n" + 
						"               <th class=\"text-center\">Total Marks</th>\r\n" + 
						"               <th class=\"text-center\">Average</th>\r\n" + 
						"                                                                               \r\n" + 
						"              <th class=\"text-center\">Minimum</th>\r\n" + 
						"              <th class=\"text-center\">Maximum</th>\r\n" + 
						"                                                                                                                                                                      \r\n" + 
						"              </tr>\r\n" + 
						"              </thead>\r\n" + 
						"              <tbody>\r\n" + 
						"              <tr class=\"calculationrow\">\r\n" + 
						"              <td class=\"text-center\"> 1</td>\r\n" + 
						"              <td class=\"text-center ObtMarks\">" + rs.getString(7) + "</td>\r\n" + 
						"              <td class=\"text-center GrandTotal\">" + rs.getString(8) + "</td>\r\n" + 
						"              <td class=\"text-center AverageMarks\">" + meta_result.getString(1) + "</td>\r\n" + 
						"                                                                                     \r\n" + 
						"              <td class=\"text-center MinMarks\">" + meta_result.getString(2) + "</td>\r\n" + 
						"              <td class=\"text-center MaxMarks\">" + meta_result.getString(3) + "</td>\r\n" + 
						"              </tr>\r\n"
						+ "			</tbody>\r\n" + 
						"              </table>\r\n" + 
						"              </div>\r\n" + 
						"              </div>\r\n" + 
						"              </div>";
			}
			
			marks_table += "</div>\r\n" + 
					"  </div>";
			
			return marks_table;
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return "Error occured while retrieving marks. Please try reloading the page";
		}
	}
}
