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
 * Servlet implementation class postRequests
 */
@WebServlet(description = "Handles all post requests", urlPatterns = { "/postRequests" })
public class postRequests extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			String work_to_do = request.getParameter("work_to_do");
			
			System.out.println("Here!");
			
			if (work_to_do.equals("login"))
			{
				String id_for = request.getParameter("uname");
				if (id_for.contains("fk"))
				{
					Employee e1 = new Employee(request, response, true);
					e1.Login();
					System.out.println("Logged Status: " + e1.getLoggedStatus());
				}
				else if (id_for.contains("sk"))
				{
					Student s1 = new Student(request, response, true);
					s1.Login();
				}
				else
					response.sendRedirect("indexInvalid.jsp");
			}
			
			
			
		}
		catch (Exception e)
		{
			@SuppressWarnings("unused")
			ExceptionHandler ex = new ExceptionHandler(e, request, response);
		}
	}
	
}
