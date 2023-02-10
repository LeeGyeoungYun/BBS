<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기완료</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
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
	.findIdDiv input{padding:10px; width:130px;}
	.noticeBox{margin-top: 20px;padding-left:20px;}
	.notice{font-size: 7px; color:red;}
	
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
			<span>&emsp;&nbsp; 비밀번호 &emsp;&emsp;&emsp; <input type="password" class="password" required></span>
			
			<div class="noticeBox">
				<b class="notice">* 새 비밀번호는 특수문자없이 최소 6글자 ~ 최대 14글자 이내로 설정해주세요.</b>
			</div>
			
			<span>&emsp; 새 비밀번호 &emsp;&emsp; <input type="password" class="newPassword" required></span>
			<span>&nbsp; 새 비밀번호 확인  &nbsp;&nbsp;<input type="password" class="confirmPwd" required></span>
			
			<div class="btnBox">
				<input class="submit" type="button" onclick="pwdCheck()" value="다음">
			</div>
			
		</div>
		
		
	</div>
	
	<script>
		function pwdCheck(){
			
			var id = '${id}';
			var pwd = '${pwd}'; //jstl을 사용하면 컨트롤러에 단에서 보낸 값을 jsp에서 input을 만들고 히든에 값을 숨긴담에 가져올 필요없이
								//바로 가져올 수 있다. 대신 jsp에 jstl을 선언해야지만 사용가능
			
			let password = document.querySelector(".password").value; // 위 pwd는 db상에 명시되어있는 실제 비밀번호이고 password 변수는 재확인용 비밀번호이다. 즉, 두개가 일치해야 됨.
			let newPassword = document.querySelector(".newPassword").value; // 새로운 비밀번호 변수이다.
			let confirmPwd = document.querySelector(".confirmPwd").value; // 새로운 비밀번호 재확인 변수이다.
			let newPasswordReg = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,14}$/;  //리터럴 방식의 정규식
			
			if(password.length==0 || newPassword.length ==0 || confirmPwd.length ==0){
				alert("비어있는란이 있습니다. 다시 확인해주세요.");
				return false;
			}
				
			if(password != pwd){
				alert("비밀번호가 일치하지 않습니다.");
				document.querySelector(".password").focus();
				return false;
			}
			
			if(newPassword != confirmPwd){
				alert("새 비밀번호와 새 비밀번호 확인란이 일치하지 않습니다.");
				document.querySelector(".newPassword").focus();
				return false;
			}
			
			if(!newPasswordReg.test(newPassword)){
				alert("새 비밀번호 형식이 올바르지 않습니다. 다시 입력해주세요.");
				return false;
			}
			
			$.ajax({
				
				url:"${pageContext.request.contextPath}/find/updatePwd_ok",
				type:"POST",
				data:{"id":id,"newPassword":newPassword},
				dataType:"JSON",
				success:function(){
					console.log("성공");
					
				},error:function(){
					console.log("에러");
				}
			});
			
		}
	</script>

</body>
</html>