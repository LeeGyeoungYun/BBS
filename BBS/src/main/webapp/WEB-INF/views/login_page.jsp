<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="resources/css/login_page_style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<script src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/login_page.js"></script>
</head>
<body>
	<div class= "loginContainer">
		
		<div class ="photoBox">
			<i class="fa-solid fa-circle-user"></i>			
		</div>
		<form class="login_information" method="post" action="login_ok">
			
			<c:if test="${param.errorCode == 1}"> <!-- 조건문이 만족되면 다음을 출력 -->
			<div class="WarningBox">
				<span><p>ID 혹은 비밀번호를 잘못 입력하셨거나 등록되지 않는 계정입니다.</p></span>
			</div>
			</c:if>
			<div class="int_area">
				<i class="fa-solid fa-user"></i>
				<input type="text" name="user_id" id="id" autocomplete="off" placeholder="ID" required>
			</div>
			
			<div class="int_area">
				<i class="fa-solid fa-lock"></i>
				<input type="password" name="user_pwd" id="pw" autocomplete="off" placeholder="Password" required>
			</div>
			
			<div class="answer">
				<a class="forget" href="#">forget password?</a>
				<a class="register" href="register">회원가입</a>
			</div>
			
			<div class="btn_area">
				<button type="submit">LOGIN</button>
			</div>
		</form>
	</div>
</body>
</html>