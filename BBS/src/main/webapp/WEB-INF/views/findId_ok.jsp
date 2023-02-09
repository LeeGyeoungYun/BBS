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
	
	.findIdDiv{width:450px;height: 400px; padding:25px 10px; border:1px solid;}
	.findIdDiv span{display:inline-block;margin:10px 10px 0px;padding:5px 10px;background-color: #f6f6f7; width:410px; height: 45px; line-height: 45px;}
	.findIdDiv input{padding:10px;}
</style>
</head>
<body>
	<div class="findContainer">
		<div class="select">
			<a href="./id"><span class="findId active">아이디 찾기</span></a>
			<a href="./pwd"><span class="findPwd">비밀번호 찾기</span></a>
		</div>
		
		<div class="findIdDiv">
			<span>&nbsp ID  &nbsp&nbsp&nbsp<input type="text" class="phone" value="${id}" readonly>
		</div>
	</div>

</body>
</html>