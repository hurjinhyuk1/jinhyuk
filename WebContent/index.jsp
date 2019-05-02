<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>KPU Lecture</title>
<link rel="stylesheet" href="css/newdesign.css" type="text/css"></link>


<script>

var loginSuccess = ${loginSuccess};

if(loginSuccess!=null && loginSuccess==false){
	alert('로그인 실패');
}

</script>


</head>
<body>
<div class="login-page">

  <div class="form">

    

    <form class="login-form" method="post" action="/controller?key=login">
      <input type="text" name="userID" placeholder="username"/>
      <input type="password" name="userPassword" placeholder="password"/>
      <button type="submit">login</button>
      <p class="message">Not registered? <a href="userJoin.jsp">Create an account</a></p>
    </form>
    
  </div>
</div>
</body>


</html>