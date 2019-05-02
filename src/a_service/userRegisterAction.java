package a_service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import a_domain.UserDTO;
import a_persistence.UserDAO;
import util.SHA256;

/**
 * Servlet implementation class userRegisterAction
 */
@WebServlet("/userRegisterAction")
public class userRegisterAction extends HttpServlet {
	private String userID;
	private String userPassword;
	private String userEmail;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userRegisterAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();

		if (request.getParameter("userID") != null) {

			userID = (String) request.getParameter("userID");
		

		}

		if (request.getParameter("userPassword") != null) {

			userPassword = (String) request.getParameter("userPassword");
			
		}

		if (request.getParameter("userEmail") != null) {

			userEmail = (String) request.getParameter("userEmail");
			


		}

		if (userID == "" || userPassword == "" || userEmail == "") {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('입력이 안 된 사항이 있습니다.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();
			return;

		} else {

			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(new UserDTO(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false));

			if (result == -1) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('이미 존재하는 아이디입니다.!!!');");

				script.println("history.back();");

				script.println("</script>");

				script.close();

			} else {

				session.setAttribute("userID", userID);

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("location.href = '/evaluationEmailSendAction';");

				script.println("</script>");

				script.close();
				
			}

			doGet(request, response);
		}

	}
}
