<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="resources/css/register_style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<script src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/register.js"></script>
</head>
<body>
	<div class= "loginContainer">
		
		<div class ="photoBox">
			<i class="fa-solid fa-circle-user"></i>			
		</div>
		<form class="login_information" method="post" action="register_ok" onsubmit="return register_check();">
			<div class="int_box">
			<div class="int_area">
				<i class="fa-solid fa-user"></i>
				<input type="text" name="user_id" id="user_id" autocomplete="off" placeholder="ID" >
			</div>
				<div class="overlapBox">
				<input type="button" class="overlapBtn" value="중복 확인" onclick="id_check()">
				</div>
			</div>
			
			<span class="warning_Check"><p>아이디를 확인해주세요.</p></span>
			
			<div class="int_area">
				<i class="fa-solid fa-envelope"></i>
				<input type="text" name="user_email" id="user_email" autocomplete="off" placeholder="Email" required>
			</div>
			
			
			<div class="int_area">
				<i class="fa-solid fa-lock"></i>
				<input type="password" name="user_pwd" id="user_pwd" autocomplete="off" placeholder="Password" required>
			</div>
			
			<div class="int_area">
				<i class="fa-solid fa-lock"></i>
				<input type="password" name="user_pwConfirm" id="user_pwConfirm" autocomplete="off" placeholder="Pwd_Confirm" required>
			</div>
			
			
			
			<div class="btn_area">
				<button type="submit">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>