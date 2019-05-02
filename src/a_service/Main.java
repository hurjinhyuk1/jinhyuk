package a_service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import a_domain.EvaluationDTO;
import a_persistence.EvaluationDAO;

/**
 * Servlet implementation class Main
 */
@WebServlet("/main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userID;
	String lectureDivide = "전체";
	String searchType = "최신순";
	String search = "";
	int pageNumber = 0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		userID= request.getParameter("userID");
		
		

		if(request.getParameter("lectureDivide") != null) {
			lectureDivide = request.getParameter("lectureDivide");
			
		}
		if(request.getParameter("searchType") != null) {
			searchType = request.getParameter("searchType");
		}
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		if(request.getParameter("pageNumber") != null) {
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} 
			catch (Exception e) {
				System.out.println("검색 페이지 번호 오류");
			}
		}
		
		request.setAttribute("userID", userID);
		request.setAttribute("lectureDivide",lectureDivide );
		request.setAttribute("searchType", searchType);
		request.setAttribute("search", search);
		request.setAttribute("pageNumber", pageNumber);
		
		ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
		evaluationList = new EvaluationDAO().getList(lectureDivide, searchType, search, pageNumber);


		request.setAttribute("evaluationList", evaluationList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mainPage.jsp");
		dispatcher.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
