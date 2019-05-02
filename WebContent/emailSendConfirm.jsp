<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<c:choose>
						<c:when test="${userID ne NULL}">						
							<a class="dropdown-item" href="index.jsp">로그인</a> 
							<a class="dropdown-item" href="userJoin.jsp">회원가입</a>

						</c:when>

						<c:otherwise>
							<a class="dropdown-item" href="userLogoutAction">로그아웃</a>
						</c:otherwise>
						</c:choose>
					</div>
				</li>
			</ul>
			
		
		</div>
	</nav>


	<section class="container mt-3" style="max-width:560px;">
		<div class="alert alert-warning mt-4" role="alert">
			이메일 주소 인증을 하셔야 이용 가능합니다. 인증 메일을 받지 못하셨나요?
		</div>
		<a href="evaluationEmailSendAction" class="btn btn-success">인증 메일 다시 받기</a>
		
	</section>

</body>
</html>