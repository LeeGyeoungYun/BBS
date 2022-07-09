<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/login_page_style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
	<div class= "loginContainer">
		
		<div class ="photoBox">
			<i class="fa-solid fa-circle-user"></i>			
		</div>
		<form class="login_information">
			<div class="int_area">
				<i class="fa-solid fa-user"></i>
				<input type="text" name="id" id="id" autocomplete="off" required>
			</div>
			<div class="int_area">
				<i class="fa-solid fa-lock"></i>
				<input type="password" name="pw" id="pw" autocomplete="off" required>
			</div>
			
			<div class="answer">
				<a class="forget" href="#">forget password?</a>
				<a class="register" href="#">회원가입</a>
			</div>
			
			<div class="btn_area">
				<button type="submit">LOGIN</button>
			</div>
		</form>
	</div>
</body>
</html>