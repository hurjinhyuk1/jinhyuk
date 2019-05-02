package a_service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import a_domain.EvaluationDTO;
import a_persistence.EvaluationDAO;

/**
 * Servlet implementation class EvaluationRegisterAction
 */
@WebServlet("/evaluationReg")
public class EvaluationRegisterAction extends HttpServlet {

	private String userID;
	private String lectureName;
	private String professorName;
	private int lectureYear;
	private String semesterDivide;
	private String lectureDivide;
	private String evaluationTitle;
	private String evaluationContent;
	private String totalScore;
	private String creditScore;
	private String comfortableScore;
	private String lectureScore;

	private EvaluationDAO evaluationDAO;
	

	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//userID=request.getParameter("userID");
		
		evaluationDAO=new EvaluationDAO(); //초기화	
		
		HttpSession session=request.getSession();
		
		userID=(String)session.getAttribute("userID");
		
		lectureName = request.getParameter("lectureName");
		professorName = request.getParameter("professorName");
		lectureYear = Integer.parseInt(request.getParameter("lectureYear"));
		semesterDivide = request.getParameter("semesterDivide");
		lectureDivide = request.getParameter("lectureDivide");
		evaluationTitle = request.getParameter("evaluationTitle");
		evaluationContent = request.getParameter("evaluationContent");
		totalScore = request.getParameter("totalScore");
		creditScore = request.getParameter("creditScore");
		comfortableScore = request.getParameter("comfortableScore");
		lectureScore = request.getParameter("lectureScore");
		
		boolean result = evaluationDAO.write(new EvaluationDTO(0,userID,lectureName,professorName,
				lectureYear, semesterDivide,lectureDivide,evaluationTitle,evaluationContent,
				 totalScore, creditScore,comfortableScore,lectureScore,0));

		request.setAttribute("saveResult", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/evaluationRegisterPopup.jsp");
		dispatcher.forward(request, response);	
	}

}
