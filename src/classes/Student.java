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
		// TODO Auto-generated constructor stub
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
			ExceptionHandler ex = new ExceptionHandler(e);
		
		}
	}
	public Student(HttpServletRequest requset , HttpServletResponse response) {
		// TODO Auto-generated constructor stub
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
//	public String getPassword()
//	{
//		return password;
//	}
	public String getFatherCNIC()
	{
		return fatherCNIC;
	}
	public String getStudentID()
	{
		return student_id;
	}
	private int setFatherCNIC(String c)
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
	private int setStudentID(String em)
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
	private int setMotherName(String m)
	{
		if (m.length() >= 2)
		{
			motherName = m;
			return 0;
		}
		return 1;
	}
	private int setMotherOccupation(String o)
	{
		if (o.length() >= 2)
		{
			motherOccupation = o;
			return 0;
		}
		return 1;
	}
	private int setFatherOccupation(String o)
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
			gender = 'M';
		else if (rs.getString(8).equals("F"))
			gender = 'F';
		else
			gender = 'O';
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
			return "No homework due...Enjoy!";
		else
			return homework;
	}
}
