package classes;

import java.sql.Date;

abstract public class Person {
	protected String name, fname, address, number, emergency_number, email;
	Date dob;
	protected char gender;
	
	public Date getDOB()
	{
		return dob;
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
	public char getGender()
	{
		return gender;
	}
}
