package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class getRequests
 */
@WebServlet("/getRequests")
public class getRequests extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String work_to_do = request.getParameter("work_to_do");
		
		if (work_to_do.equals("signout"))
		{
			System.out.println("signout called");
			HttpSession sess = request.getSession();
			sess.removeAttribute("emp_obj");
			sess.setAttribute("emp_obj", null);
			sess.setAttribute("loggedOut", "false");
			//sess.invalidate();
			response.sendRedirect("index.jsp");
		}
		
	}

}
