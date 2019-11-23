package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserPermissions {
	protected boolean studentAttendance, addCourse, addMarks, employeeAttendance, updateEmployeeInfo, removeStudent, removeEmployee, addStudent;
	protected boolean addEmployee, sendSMS, updateTimetable, updateFee, generateFeeChallan, addClassSection;
	protected boolean updateStudentInfo;
	
	
	public UserPermissions(String employee_id, Connection con) throws SQLException {
		LoadPermissions(employee_id, con);
	}
	public UserPermissions()
	{
		
	}
	/*
	 * Beginning of setter/getter functions
	 */
	public boolean getGenerateFeeChallanPermission()
	{
		return generateFeeChallan;
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
			removeStudent = rs.getBoolean(6);
			removeEmployee = rs.getBoolean(7);
			addEmployee = rs.getBoolean(8);
			addStudent = rs.getBoolean(9);
			sendSMS = rs.getBoolean(10);
			updateTimetable = rs.getBoolean(11);
			updateFee = rs.getBoolean(12);
			generateFeeChallan = rs.getBoolean(13);
			addClassSection = rs.getBoolean(14);
			updateEmployeeInfo = rs.getBoolean(15);
			updateStudentInfo = rs.getBoolean(16);
		}
	}
}
