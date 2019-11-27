package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.Employee;
import classes.ExceptionHandler;
import classes.Student;

/**
 * Servlet implementation class RealtimeData
 */
@WebServlet("/RealtimeData")
public class RealtimeData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			String work_to_do = request.getParameter("work_to_do");
			
			if (work_to_do.equals("emp_reg"))
			{
				System.out.println("Registering new employee oo");
				Employee e1 = new Employee(request, response);
				Employee registered = e1.Register();
				if (registered != null)
				{
					System.out.println("New Employee ID: " + registered.getEmployeeID());
					response.getWriter().write(registered.getEmployeeID());
				}
				else
				{
					System.out.println("Employee registration failed.");
				}
			}
			else if (work_to_do.equals("emp_reg_permissions"))
			{
				Employee e1 = new Employee(request, response);
				e1.NewUserPermissions();
			}
			else if (work_to_do.equals("getEmpInfo"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.getEmployeeInfo(request.getParameter("emp_id"));
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("personalAdd"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.savePersonalInfo();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("contactAdd"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.saveContactInfo();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("workAdd"))
			{
				Employee e1 = new Employee (request, response);
				System.out.println("called");
				String msg = e1.saveWorkInfo();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("printPermissions"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.printPermissions();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("update_permissions"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.savePermissions();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("getStdInfo"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.getStudentInfo(request.getParameter("student_id"));
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("personalAddStd"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.saveStudentPersonalInfo();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("contactAddStd"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.saveStudentContactInfo();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("parentAddStd"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.saveStudentParentInfo();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("classChange"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.saveStudentNewClass();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("RemoveEmpName"))
			{
				Employee e1 = new Employee(request, response);
				String message = "";
				if (!request.getParameter("emp_id").substring(2).equals(e1.getEmployeeID()))
				{
					message = e1.getFullEmployeeName(request.getParameter("emp_id"));
				}
				response.getWriter().write(message);
			}
			else if (work_to_do.equals("deleteEmpData"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.deleteEmployeeData(request.getParameter("emp_id"));
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("RemoveStdName"))
			{
				Employee e1 = new Employee(request, response);
				String message = e1.getFullStudentName(request.getParameter("std_id"));
				response.getWriter().write(message);
			}
			else if (work_to_do.equals("deleteStdData"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.deleteStudentData(request.getParameter("std_id"));
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("std_reg"))
			{
				System.out.println("Registering new employee oo");
				Employee e1 = new Employee(request, response);
				Student registered = e1.RegisterStudent();
				if (registered != null)
				{
					System.out.println("New Student ID: " + registered.getStudentID());
					response.getWriter().write(registered.getStudentID());
				}
				else
				{
					System.out.println("Employee registration failed.");
				}
			}
			else if (work_to_do.equals("course_add"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.AddCourse();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("class_add"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.AddClass();
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("getEmpName"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.getFullEmployeeName(request.getParameter("emp_id"));
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("getSubjectID"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.getSubjectID(request.getParameter("subject_name"));
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("getClassID"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.getClassID(request.getParameter("class"), request.getParameter("section"));
				response.getWriter().write(msg);
			}
			else if (work_to_do.equals("AddCourseTeacher"))
			{
				Employee e1 = new Employee(request, response);
				String msg = e1.AddCourseTeacher();
				response.getWriter().write(msg);
			}
		}
		catch (Exception e)
		{
			@SuppressWarnings("unused")
			ExceptionHandler ex = new ExceptionHandler(e, request, response);
		}
		
		
	}

}
