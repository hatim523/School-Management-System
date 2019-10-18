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
	public boolean Login() throws IOException, SQLException
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
			resp.getWriter().print("Login Successful");
			LoadData(rs);
		}
		else
			resp.getWriter().print("Login failed");
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
		logged = true;
	}
	public void Register()
	{
		
	}
}
