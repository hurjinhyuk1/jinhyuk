package a_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class controller
 */
@WebServlet("/controller")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String cmd="";
		cmd=request.getParameter("key");
		if(cmd.equals("logout")) {			
			RequestDispatcher view=request.getRequestDispatcher("userLogoutAction");
			view.forward(request, response);
			
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("(POST)Served at:").append(request.getContextPath());
		
		String cmd="";
		cmd=request.getParameter("key");
		if(cmd.equals("login")) {
			request.getParameter("userID");
			request.getParameter("userPassword");
			RequestDispatcher view=request.getRequestDispatcher("login");
			view.forward(request, response);
			
			
			
		}
		else if(cmd.equals("join")) {
			
			RequestDispatcher view=request.getRequestDispatcher("userRegisterAction");
			view.forward(request, response);
			
		}
		
		doGet(request, response);
	}

}
