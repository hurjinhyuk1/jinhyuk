package a_service;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import javax.mail.Authenticator;
import util.Gmail;

/**
 * Servlet implementation class EvaluationRegisterAction
 */
@WebServlet("/report")
public class EvaluationReportRegisterAction extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String userID;
	private boolean result;
	String reportTitle = null;
	String reportContent = null;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (request.getParameter("reportTitle") != null) {
			reportTitle = request.getParameter("reportTitle");
		}
		if (request.getParameter("reportContent") != null) {
			reportContent = request.getParameter("reportContent");
		}
		String from = "jinhhur98@gmail.com";
		String to = "jinhhur1@naver.com";
		String subject = "KPU LectureEvaluation를 사이트에서 접수된  메일입니다.";
		String content = "질문자: " + userID + "<br>제목: " + reportTitle + "<br>내용: " + reportContent;

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
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}

		request.setAttribute("saveResult", result);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/reportRegisterPopup.jsp");
		dispatcher.forward(request, response);
	}

}
