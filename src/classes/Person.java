package classes;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.regex.Pattern;

abstract public class Person {
	protected String name, fname, address, number, emergency_number, email;
	java.util.Date dob;
	protected String gender;
	
	public Date getDOB()
	{
		return (Date) dob;
	}
	public String getName()
	{
		return name;
	}
	public String getFname()
	{
		return fname;
	}
	public String getAddress()
	{
		return address;
	}
	public String getNumber()
	{
		return number;
	}
	public String getEmergencyNumber()
	{
		return emergency_number;
	}
	public String getEmail()
	{
		return email;
	}
	public String getGender()
	{
		return gender;
	}
	protected int setGender(String gen)
	{
		if (gen.equals("M") || gen.equals("F") || gen.equals("m") || gen.equals("f"))
		{
			gender = gen;
			return 0;
		}
		return 1;
	}
	protected int setEmail(String e)
	{
		if (e.contains("@") && e.contains("."))
		{
			email = e;
			return 0;
		}
		return 1;
	}
	protected int setEmergencyNumber(String enumber)
	{
		try
		{
			Double.parseDouble(enumber);
			emergency_number = enumber;
			return 0;
		}
		catch (NumberFormatException ex)
		{
			return 1;
		}
	}
	protected int setNumber (String pnumber)
	{
		try
		{
			Double.parseDouble(pnumber);
			number = pnumber;
			return 0;
		}
		catch (NumberFormatException ex)
		{
			return 1;
		}
	}
	protected int setAddress(String pAdd)
	{
		if (pAdd.length() > 3)
		{
			address = pAdd;
			return 0;
		}
		return 1;
	}
	protected int setFname(String pF)
	{
		if (pF.length() >= 3)
		{
			fname = pF;
			return 0;
		}
		return 1;
	}
	protected int setName(String pN)
	{
		if (pN.length() >= 3)
		{
			name = pN;
			return 0;
		}
		return 1;
	}
	protected int setDate(String d)
	{
		try
		{
		    SimpleDateFormat formatter1=new SimpleDateFormat("dd/MM/yyyy");  
		    dob =formatter1.parse(d);  
			return 0;
		}
		catch (ParseException ex)
		{
			return 1;
		}
	}
}
