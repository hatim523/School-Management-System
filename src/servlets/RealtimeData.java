package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RealtimeData
 */
@WebServlet("/RealtimeData")
public class RealtimeData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String work_to_do = request.getParameter("work_to_do");
		
		if (work_to_do.equals("navbar"))
			System.out.println("Generating Navbar");
	}

}
