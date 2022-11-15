<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
 <script src="resources/js/jquery.js"></script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>

	<div class="Bar">
	
		<div class="home">
			<h1 class="logo">
				<a href="#"><i class="fa-solid fa-house-chimney"></i></a>
			</h1>
		</div>
		
		
		<div class="leftBar" onclick="menu_click()"><!-- 왼쪽 메뉴 -->
				<span class="icon"><i class="fa-regular fa-bars"></i></span>
				<span>메뉴</span>
		</div>
			

		<div class="rightBar"><!-- 오른쪽 로그인겸 회원가입 -->
			<div class="loginBox">
				<a href="login" class="loginBtn">
					로그인 
				</a>
			</div>
			<div class="space">|</div>
			<div class="registerBox">
				<a href="register" class="registerBtn">
					회원가입
				</a>
			</div>
		</div>
		
		<div class="leftBar_menu">
			
			<div class="cancleBox">
				<span class="cancle" onclick="menu_close()"><i class="fa-sharp fa-solid fa-xmark"></i></span>
			</div>
			
			<div class="">
			</div>
		
		</div>
		
	</div>
	<script type="text/javascript" src="resources/js/menu.js"></script>
</html>