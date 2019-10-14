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

public class Student extends Person{
	private String fatherOccupation, motherOccupation, motherName, password, fatherCNIC, student_id;
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
			resp.getWriter().print("Login Successful");
			LoadData(rs);
		}
		else
			resp.getWriter().print("Login failed");
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
		logged = true;
	}
}
