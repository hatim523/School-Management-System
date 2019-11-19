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
			}
		}
		catch (Exception e)
		{
			ExceptionHandler ex = new ExceptionHandler(e, request, response);
		}
		
		
	}

}
