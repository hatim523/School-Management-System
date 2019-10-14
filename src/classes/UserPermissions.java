package classes;

public class UserPermissions {
	private boolean studentAttendance, addCourse, addMarks, employeeAttendance, updatePermissions, removeStudent, removeEmployee, addStudent;
	private boolean addEmployee, sendSMS, updateTimetable, updateFee, generateFeeChallan, updateSalary, addClassSection, updateEmployeeInfo;
	private boolean updateStudentInfo;
	
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
}
