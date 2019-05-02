package a_service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import a_persistence.UserDAO;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userID;
	private String userPassword;
	private UserDAO userDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userID= request.getParameter("userID");
		userPassword= request.getParameter("userPassword");
		
		userDAO = new UserDAO();
		
		boolean loginSuccess = userDAO.login(userID, userPassword);
		
		if(loginSuccess) {
			request.getSession().setAttribute("userID", userID);
			
			//이메일 인증
			
			boolean emailChecked = userDAO.getUserEmailChecked(userID);
			
			if(emailChecked == false) {
				response.sendRedirect("/emailSendConfirm.jsp");		
				
			}
			else {
				response.sendRedirect("/main");	
				
			}
			 		
		}
		
		else {
			
			request.setAttribute("loginSuccess", loginSuccess);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);	
		}
		
	}

}
