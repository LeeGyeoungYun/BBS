<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
	
	.findIdDiv{width:450px;height: 400px; padding:25px 10px; border:1px solid;}
	.findIdDiv span{display:inline-block;margin:10px 10px 0px;padding:5px 10px;background-color: #f6f6f7; width:410px; height: 45px; line-height: 45px;}
	.findIdDiv input{padding:10px;}
	.btnBox{ width:450px; height: 50px; text-align: center; margin-top:40px;}
	.submit{ width:100px; height: 40px; background-color: #66cc00; border:none; color:white;}
	.submit:hover{cursor: pointer;background-color: #52a400;}
	
	#hidden{display:none;}
	.identi{width:50px;}
	.identiBtn{font-size: 10px; margin-left:5px;}
	.confirm{font-size: 10px; margin-left:15px;}
	#hidden b{margin-left:10px;}

</style>
</head>
<body>
	<div class="findContainer">
		<div class="select">
			<a href="./id"><span class="findId active" onclick="checkIdBtn()">아이디 찾기</span></a>
			<a href="./pwd"><span class="findPwd" onclick="checkPwdBtn()">비밀번호 찾기</span></a>
		</div>
		
		<div class="findIdDiv">
			<span>&nbsp Phone  &nbsp&nbsp&nbsp<input type="text" class="phone" required>&nbsp&nbsp <b style="font-size: 5px;">* 숫자로만 입력해주세요.</b></span>
			<span>&nbsp Email  &nbsp&nbsp&nbsp&nbsp<input type="email" class="email" required></span>
			<span id="hidden">
				Email 인증 <input type="text" class="identi" autocomplete="none">
				<input type="button" value="인증번호 보내기" class="identiBtn" onclick="emailCode()">
				<input type="button" value="확인" class="confirm" disabled>
				<b style="font-size: 5px; color:red;" class="misMatch"> * 인증 미완료</b>
				<b style="font-size: 5px; color:green; display:none;"class="match"> * 인증 완료</b>
			</span>
			<div class="btnBox">
				<input class="submit" type="button" onclick="checkEmail()" value="다음">
			</div>
		</div>
		
		
	</div>

	<script>
		
		let submit = document.getElementsByClassName("submit");		
		
		function checkEmail(){		
		
			let email = $(".email").val();
			let phone = $(".phone").val();
			
			$.ajax({
				
				url:"emailCheck_ok",
				type:"post",
				data:{"phone":phone, "email":email},
				dataType:"JSON",
				success: function(data){
					console.log(data.code);
					let msg = data.code;
					if(msg.includes("없는")){
						alert("폰번호와 이메일이 일치하지않거나 없는 계정입니다.");
					}else{
						$("#hidden").css("display","block");
					}
					
				},error : function(){
					console.log("오류");
				}
				
			});
			
		}// function checkEmail() end
				
		function emailCode(){
			
			let email = $(".email").val();
			let phone = $(".phone").val();
			
			if(email==null || email.trim() ==''){
				console.log("empty");
				alert("이메일이 올바르지 않거나 적지않았습니다. 다시확인해주세요.");
				return false;
			}
			
			console.log(email);
			$.ajax({
				
				type:"post",
				url:"emailCode_ok",
				data:{"email":email, "phone":phone},
				dataType:"JSON",
				success:function(data){
					let msg = data.code;//성공 실패 여부 
					var code = data.index;//성공시 보내지는 인증번호
					
					if(msg.includes("성공")){
						console.log("성공");
						alert("인증번호를 보냈습니다.");
						let btn = document.querySelector(".confirm");
						btn.disabled = false;
						
						btn.addEventListener("click",function(){
							console.log("인증버튼이 눌려짐 코드번호는 다음과 같음"+code);
							
							if($(".identi").val()==null || $(".identi").val().trim()==''){
								alert("인증번호란이 비어있습니다. 다시 확인해주세요.");
								return false;
							}
							
							if($(".identi").val()!=code){
								alert("인증번호가 다릅니다. 다시 확인해주세요.");
								return false;
							}else{
								alert("인증이 완료되었습니다.");
								btn.disabled = true;
								document.querySelector(".misMatch").style.display = "none"; // 인증 미완료문구 지우고
								document.querySelector(".match").style.display = "inline-block"; //인증 완료문구 보이게
								document.querySelector(".identi").readOnly=true; //인증번호 적는란 다시 건들지 못하게 보기전용으로 바꿈
								
								
							}
							
							
							
							
						});
						
					}
					
				},error:function(){
					console.log("에러");
				}
			});
		}// function checkEmail() end
		
		
		
			
		
		
		
	</script>
</body>
</html>