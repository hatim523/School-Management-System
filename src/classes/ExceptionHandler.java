package classes;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ExceptionHandler {
	private Exception except;
	public ExceptionHandler(Exception e, HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated constructor stub
		try
		{
			except = e;
			System.out.println("Exception handled");
			System.out.println(e.getStackTrace());
			e.printStackTrace();
			System.out.println(e.getMessage());
			HttpSession sess = req.getSession();
			sess.setAttribute("exception", e.getMessage());
			RequestDispatcher rd = req.getRequestDispatcher("WentWrong.jsp");
			rd.forward(req, resp);
		}
		catch (Exception ex)
		{
			System.out.println("Could not throw exception anymore.");
		}
	}
	public ExceptionHandler(Exception e)
	{
		except = e;
		System.out.println("Exception handled");
		System.out.println(e.getStackTrace());
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	
}
