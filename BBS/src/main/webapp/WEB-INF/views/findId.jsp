<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	.findContainer{
		width:450px; height: 500px;
		//border:1px solid;
	}
	
	.select{  width:400px;height: 100px;}
	.select span{ font-size: 20px; font-weight: 500; display:inline-block; padding:30px; background-color: #E0E0E0;}
	.select span:hover, .select .active{cursor:pointer; background-color: #C0C0C0;}
	
	.findIdDiv{width:450px;height: 400px; padding:25px 10px; border:1px solid;}
	.findIdDiv span{display:inline-block;margin:10px 10px 0px;padding:5px 10px;background-color: #f6f6f7; width:410px; height: 45px; line-height: 45px;}
	.findIdDiv input{padding:10px;}
	.btnBox{ width:450px; height: 50px; text-align: center; margin-top:40px;}
	.submit{ width:100px; height: 40px; background-color: #66cc00; border:none; color:white;}
	.submit:hover{cursor: pointer;background-color: #52a400;}
	
	.findPwdDiv{width:450px;height: 400px; padding:25px 10px; border:1px solid; display:none;}
</style>
</head>
<body>
	<div class="findContainer">
		<div class="select">
			<span class="findId active" onclick="checkIdBtn()">아이디 찾기</span>
			<span class="findPwd" onclick="checkPwdBtn()">비밀번호 찾기</span>
		</div>
		
		<div class="findIdDiv">
			<span>Phone  &nbsp<input type="text" class="name" required>&nbsp&nbsp <b style="font-size: 5px;">* 숫자로만 입력해주세요.</b></span>
			<span>Email  &nbsp&nbsp<input type="email" class="email" required></span>
			<div class="btnBox">
				<button class="submit">인증하기</button>
			</div>
		</div>
		
		<div class="findPwdDiv">
		
		</div>
	</div>

	<script>
		let findId = document.querySelector(".findId");
		let findPwd = document.querySelector(".findPwd");
		let findIdDiv = document.querySelector(".findIdDiv");
		let findPwdDiv = document.querySelector(".findPwdDiv");
		
		
		function checkIdBtn(){
			findPwd.classList.remove("active");
			findId.classList.add("active");
			findIdDiv.style.display = 'block';
			findPwdDiv.style.display = 'none';
		}
		
		function checkPwdBtn(){
			findId.classList.remove("active");
			findPwd.classList.add("active");
			findPwdDiv.style.display = 'block';
			findIdDiv.style.display = 'none';
		}
		
		
	</script>
</body>
</html>