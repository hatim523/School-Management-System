package classes;

import java.io.*;

public class metaData {
	private String databaseName, schoolName;
	
	public metaData() {
		/*
		 * Set Changing attributes here...results will be changed in the complete code
		 */
		databaseName = "school";
		schoolName = "Khokhar Public School";
	}
	
	public String getDatabaseName()
	{
		return databaseName;
	}
	public String getSchoolName()
	{
		return schoolName;
	}
}
