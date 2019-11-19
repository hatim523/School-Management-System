package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Employee;
import classes.ExceptionHandler;
import classes.Student;

/**
 * Servlet implementation class getRequests
 */
@WebServlet("/getRequests")
public class getRequests extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String work_to_do = request.getParameter("work_to_do");
		
		try
		{
			
			System.out.println("get request");
			if (work_to_do.equals("signout"))
			{
				HttpSession sess = request.getSession();
				sess.removeAttribute("emp_obj");
				sess.setAttribute("logged_status", false);
				sess.setAttribute("login_id", 0);
				sess.invalidate();
				response.sendRedirect("index.jsp");
			}
			else if (work_to_do.equals("HomeworkAdd"))
			{
				Employee e1 = new Employee(request, response);
				if (!e1.getLoggedStatus())
					return;
				String message = e1.AddHomeWork();
				if (message == null)
					response.getWriter().write("Adding Homework Failed...Please try Again");
				response.getWriter().write(message);
			}
			else if (work_to_do.equals("HomeworkRemove"))
			{
				Employee e1 = new Employee(request, response);
				if (!e1.getLoggedStatus())
					return;
				e1.removeHWork();
			}
			else if (work_to_do.equals("std_homework"))		//Getting homework of student for homepage
			{
				Student s1 = new Student(request, response);
				response.getWriter().write(s1.getHomeWork());
			}
			else if (work_to_do.equals("signout_student"))
			{
				HttpSession sess = request.getSession();
				sess.removeAttribute("std_obj");
				sess.setAttribute("std_logged_status", false);
				sess.setAttribute("std_login_id", 0);
				sess.invalidate();
				response.sendRedirect("index.jsp");
			}
		}
		catch (Exception e)
		{
			@SuppressWarnings("unused")
			ExceptionHandler ex = new ExceptionHandler(e, request, response);
		}
		
	}

}
