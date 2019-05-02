package a_service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import a_persistence.UserDAO;
import util.Gmail;
import util.SHA256;

/**
 * Servlet implementation class EvaluationEmailSendAction
 */
@WebServlet("/evaluationEmailSendAction")
public class EvaluationEmailSendAction extends HttpServlet {
	private String userID;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EvaluationEmailSendAction() {
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
		// ponse.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
		UserDAO userDAO = new UserDAO();

		userID = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			// 사용자가 로그인하지 않은 상태일 때
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('로그인을해주세요.');");

			script.println("location.href = 'index.jsp';");

			script.println("</script>");

			script.close();
			return; // 해당 페이지를 닫아준다.

		}

		boolean emailChecked = userDAO.getUserEmailChecked(userID);
		if (emailChecked == true) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('이미 인증 된 회원입니다.');");

			script.println("location.href = 'index.jsp';");

			script.println("</script>");

			script.close();
			return;

		}
		String host = "http://localhost:8088/";
		String from = "jinhhur98@gmail.com";
		String to = userDAO.getUserEmail(userID);
		String subject = "강의평가를 위한 이메일 인증 메일입니다.";
		String content = "다음 링크에 접속해서 이메일 인증을 진행해주세요" + "<a href='" + host + "emailCheckAction?code="
				+ new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");

		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);

		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('오류가 발생했습니다.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();
			return;
		}finally {
			PrintWriter script = response.getWriter();
			script.println("<script>");

			script.println("alert('해당 email로 가서 인증하세요.');");

			script.println("location.href = 'index.jsp';");
			script.println("</script>");

			script.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
