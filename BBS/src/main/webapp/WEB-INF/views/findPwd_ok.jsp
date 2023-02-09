<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기완료</title>
<style>
	.findContainer{
		width:450px; height: 500px;
		//border:1px solid;
	}
	
	.select{  width:400px;height: 100px;}
	.select a{color:black;}
	.select span{ font-size: 20px; font-weight: 500; display:inline-block; padding:30px; background-color: #E0E0E0;}
	.select span:hover, .select .active{cursor:pointer; background-color: #C0C0C0;}
	
	.findIdDiv{width:450px;height: 320px; padding:25px 10px; border:1px solid;}
	.findIdDiv span{display:inline-block;margin:10px 10px 0px;padding:5px 10px;background-color: #f6f6f7; width:410px; height: 45px; line-height: 45px;}
	.findIdDiv input{padding:10px;}
	
	.btnBox{ width:450px; height: 50px; text-align: center; margin-top:40px;}
	.submit{ width:100px; height: 40px; background-color: #66cc00; border:none; color:white;}
	.submit:hover{cursor: pointer;background-color: #52a400;}
	
</style>
</head>
<body>
	<div class="findContainer">
		<div class="select">
			<a href="./id"><span class="findId">아이디 찾기</span></a>
			<a href="./pwd"><span class="findPwd active">비밀번호 찾기</span></a>
		</div>
		
		<div class="findIdDiv">
			<span>&emsp;&nbsp; 비밀번호 &emsp;&emsp;&emsp; <input type="text" class="phone" required></span>
			<span>&emsp; 새 비밀번호 &emsp;&emsp; <input type="email" class="email" required></span>
			<span>&nbsp; 새 비밀번호 확인  &nbsp;&nbsp;<input type="email" class="email" required></span>
			
			<div class="btnBox">
				<input class="submit" type="button" onclick="pwdCheck()" value="다음">
			</div>
			
		</div>
		
		
	</div>
	
	<script>
		
	</script>

</body>
</html>