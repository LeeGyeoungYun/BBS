<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="resources/css/register_style.css">
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
				<input type="text" name="id" id="id" autocomplete="off" placeholder="ID" required>
			</div>
			
			<div class="int_area">
				<i class="fa-solid fa-envelope"></i>
				<input type="text" name="email" id="email" autocomplete="off" placeholder="Email" required>
			</div>
			
			
			<div class="int_area">
				<i class="fa-solid fa-lock"></i>
				<input type="password" name="pw" id="pw" autocomplete="off" placeholder="Password" required>
			</div>
			
			<div class="int_area">
				<i class="fa-solid fa-lock"></i>
				<input type="password" name="pwConfirm" id="pwConfirm" autocomplete="off" placeholder="Pwd_Confirm" required>
			</div>
			
			
			
			<div class="btn_area">
				<button type="submit">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>