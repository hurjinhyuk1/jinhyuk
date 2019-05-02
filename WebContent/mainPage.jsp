<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>KPU lecture</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- 부트스트랩 CSS 추가하기-->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/color.min.css">
<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">


<script>

var userID = ${userID};

var regPopup;
var reportRegPopup;

if(userID==null){
	alert('로그인을 해주세요.');
}

function openRegPopup(){
	var url="/evaluationRegisterPopup.jsp";
	
	window.name = "parentForm";
   
    regPopup = window.open(url, "regPopupForm", "width=600, height=800");  

}
function reportRegPopup(){
	var url="/reportRegisterPopup.jsp";
	
	window.name = "parentForm";
	
   
    
    reportRegPopup = window.open(url, "regPopupForm", "width=300,height=500");  
}


</script>
</head>
<body>
<input type="hidden" id="regPopupResult"/>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">Kpu Lecture</a>
		<h10><%=session.getAttribute("userID") %>님 안녕하세요</h10><br>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
				<a class="nav-link" href="index.jsp">메인</a></li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown"> 회원관리 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">

					<c:choose>
 
						<c:when test="${userID ne NULL}">			
			              
			              <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
			              <a class="dropdown-item" href="/controller?key=logout">로그아웃</a>
			              
						</c:when>
						
						<c:otherwise>
	              		<a class="dropdown-item" href="/controller?key=login">로그인</a>
						</c:otherwise>
					</c:choose>

					</div>
				</li>
			</ul>
			<form action="/main" method="get"class="form-inline my-2 my-lg-0">`
				<input type="text" name="search" class="form=control mr-sm-2" type="search"
					placeholder="내용을 입력하세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
		
	</nav>


	<section class="container">
		<form method="get" action="main" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
		  <option value="전체">전체</option>
		  <option value="전공" <c:if test="${lectureDivide eq '전공'}">selected</c:if>>전공</option>
          <option value="교양" <c:if test="${lectureDivide eq '교양'}">selected</c:if>>교양</option>
          <option value="기타" <c:if test="${lectureDivide eq '기타'}">selected</c:if>>기타</option>
			</select> 
			
		  <select name="searchType" class="form-control mx-1 mt-2">
		   <option value="최신순">최신순</option>
           <option value="추천순" <c:if test="${searchType eq '추천순'}">selected</c:if>>추천순</option>  
			</select> 
			
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요">		
			<button type="submit" class="btn btn-secondary mx-1 mt-2">검색</button>

			<a class="btn btn-primary mx-1 mt-2"    data-toggle="modal" onClick="openRegPopup()">등록하기</a> 
			<a class="btn btn-success mx-1 mt-2"	data-toggle="modal"onClick="reportRegPopup()">쪽지 </a>
		</form>
	

		<c:forEach var="evaluation" items="${evaluationList}">
		 
 		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
					${evaluation.lectureName}&nbsp;<small>${evaluation.professorName}(교수님)</small>
					</div>
					<div class="col-4 text-right">
						
					</div>
				</div>
			</div>


			<div class="card-body">
				<h5 class="card-title">
					${evaluation.evaluationTitle}&nbsp;<small>(${evaluation.lectureYear}년  ${evaluation.semesterDivide})</small>

				</h5>
				<p class="card-text">${evaluation.evaluationContent}</p>

				<div class="row">
				
				
					<div class="col-9 text-left">
						종합<span style="color: red;">${evaluation.totalScore}</span>
						성적 <span style="color: red;">${evaluation.creditScore}</span> 
						널널 <span style="color: red;">${evaluation.comfortableScore}</span>
						 강의 <span style="color: red;">${evaluation.lectureScore}</span>
						<span style="color: green;">(추천: ${evaluation.likeCount})</span>

					</div>
					
					
					
				</div>		
			</div>
			
		</div>		
				
		</c:forEach>



	</section>
	


<ul class="pagination justify-content-center mt-3">
	<li class="page-item">

	
	<a class="page-link disabled">이전</a>

	


	</li>
	
	<li>

	<a class="page-link disabled">다음</a>

	

	</li>
	
</ul>

	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2018 허진혁 All right reserved </footer>
<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!--  파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>



</body>
</html>