<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="a_persistence.UserDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>KPU Lecture</title>

<!-- 부트스트랩 CSS 추가하기-->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/color.min.css">
<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">

</head>
<body>

	

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">강의 평가 웹 사이트</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">메인</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown"> 회원관리 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">

						<%
							if (session.getAttribute("userID") == null) {
						%>
						<a class="dropdown-item" href="index.jsp">로그인</a> <a
							class="dropdown-item" href="userJoin.jsp">회원가입</a>



						<%
							} else {
						%>
						<a class="dropdown-item" href="userLogoutAction">로그아웃</a>
						<%
							}
						%>

					</div>
					</li>
			</ul>
			
		</div>
	</nav>
	
	
	<section class="container mt-3" style="max-width:560px;">
	<form method="post" action= "/controller?key=join">
	
		<div class="form group">
			<label>아이디</label>
			<input type="text" name="userID" class="form-control">
			
		</div>
		<div class="form group">
			<label>비밀번호</label>
			<input type="text" name="userPassword" class="form-control">
			
		</div>
		<div class="form-group">
			<label>이메일</label>
			<input type="email" name="userEmail" class="form-control">
		</div>
		
		<button type="submit" class="btn btn-primary">회원가입</button>
	</form>
		
	</section>
	
 
	<footer class="bg-dark mt-4 p-5 text-center" style="color:#FFFFFF;">
		Copyright &copy; 2018 허진혁 All right reserved
	</footer>


</body>
</html>