package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserPermissions {
	private boolean studentAttendance, addCourse, addMarks, employeeAttendance, updatePermissions, removeStudent, removeEmployee, addStudent;
	private boolean addEmployee, sendSMS, updateTimetable, updateFee, generateFeeChallan, updateSalary, addClassSection, updateEmployeeInfo;
	private boolean updateStudentInfo;
	
	
	public UserPermissions(String employee_id, Connection con) throws SQLException {
		LoadPermissions(employee_id, con);
	}
	/*
	 * Beginning of setter/getter functions
	 */
	public boolean getGenerateFeeChallanPermission()
	{
		return generateFeeChallan;
	}
	public boolean getUpdateSalaryPermission()
	{
		return updateSalary;
	}
	public boolean getAddClassSectionPermission()
	{
		return addClassSection;
	}
	public boolean getUpdateEmployeeInfo()
	{
		return updateEmployeeInfo;
	}
	public boolean getUpdateStudentInfo()
	{
		return updateStudentInfo;
	}
	public boolean getRemoveEmployeePermission()
	{
		return removeEmployee;
	}
	public boolean getAddStudentPermission()
	{
		return addStudent;
	}
	public boolean getAddEmployeePermission()
	{
		return addEmployee;
	}
	public boolean getSendSMSPermission()
	{
		return sendSMS;
	}
	public boolean getUpdateTimetablePermission()
	{
		return updateTimetable;
	}
	public boolean getUpdateFeePermission()
	{
		return updateFee;
	}
	public boolean getStudentAttendancePermission()
	{
		return studentAttendance;
	}
	public boolean getAddCoursePermission()
	{
		return addCourse;
	}
	public boolean getAddMarksPermission()
	{
		return addMarks;
	}
	public boolean getEmployeeAttendancePermission()
	{
		return employeeAttendance;
	}
	public boolean getRightsToUpdatePermission()
	{
		return updatePermissions;
	}
	public boolean getRemoveStudentPermission()
	{
		return removeStudent;
	}
	/*
	 * End of setter/getter functions
	 */
	private void LoadPermissions(String id, Connection con) throws SQLException
	{
		String sql = "Select * from userpermissions where employee_id = ?";
		PreparedStatement psm = con.prepareStatement(sql);
		psm.setString(1, id);
		
		ResultSet rs = psm.executeQuery();
		while (rs.next())
		{
			studentAttendance = rs.getBoolean(2);
			addCourse = rs.getBoolean(3);
			addMarks = rs.getBoolean(4);
			employeeAttendance = rs.getBoolean(5);
			updatePermissions = rs.getBoolean(6);
			removeStudent = rs.getBoolean(7);
			removeEmployee = rs.getBoolean(8);
			addEmployee = rs.getBoolean(9);
			addStudent = rs.getBoolean(10);
			sendSMS = rs.getBoolean(11);
			updateTimetable = rs.getBoolean(12);
			updateFee = rs.getBoolean(13);
			generateFeeChallan = rs.getBoolean(14);
			updateSalary = rs.getBoolean(15);
			addClassSection = rs.getBoolean(16);
		}
	}
}
