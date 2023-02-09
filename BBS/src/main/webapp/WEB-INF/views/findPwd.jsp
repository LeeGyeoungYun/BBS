<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
	
	.findPwdDiv{width:450px;height: 400px; padding:25px 10px; border:1px solid;}
	.findPwdDiv span{display:inline-block;margin:10px 10px 0px;padding:5px 10px;background-color: #f6f6f7; width:410px; height: 45px; line-height: 45px;}
	.findPwdDiv input{padding:10px;}
	.btnBox{ width:450px; height: 50px; text-align: center; margin-top:40px;}
	.submit,.submit2 ,.submit3{ width:100px; height: 40px; background-color: #66cc00; border:none; color:white;}
	.submit:hover,.submit2:hover ,.submit3:hover{cursor: pointer;background-color: #52a400;}
	.submit2 , .submit3{display:none;}
	
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
			<a href="./id"><span class="findId">아이디 찾기</span></a>
			<a href="./pwd"><span class="findPwd active">비밀번호 찾기</span></a>
		</div>
		
		<div class="findPwdDiv">
			<span>&nbsp&nbsp&nbsp ID &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" class="id" required></span>
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
				<input class="submit2" type="button" onclick="skipcheck()" value="다음">
				<a href="javascript:findPwd_goPost($('.id').val(),$('.phone').val(),$('.email').val())"><input class="submit3" type="button" value="다음"></a>
			</div>
		</div>
		
		
		
	</div>

	<script>
				
	function checkEmail(){		
		
		let id = $(".id").val();
		let email = $(".email").val();
		let phone = $(".phone").val();
		
		$.ajax({
			
			url:"emailCheck_ok",
			type:"post",
			data:{"id":id,"phone":phone, "email":email},
			dataType:"JSON",
			success: function(data){
				console.log(data.code);
				let msg = data.code;
				if(msg.includes("없는")){
					alert("아이디나 폰번호, 이메일중 일치하지않는 란이 있거나  없는 계정입니다.");
				}else{
					$("#hidden").css("display","block");
					document.querySelector(".id").readOnly=true;//아이디적는란 읽기전용으로 바꾸기
					document.querySelector(".phone").readOnly=true;//폰번호적는란 읽기전용으로 바꾸기
					document.querySelector(".email").readOnly=true;// 이메일적는란 읽기전용으로 바꾸기
					
					document.querySelector(".submit").style.display ="none"; //첫번째 다음으로가기 버튼
					document.querySelector(".submit2").style.display ="inline-block";// 인증 받기전까지 나타나는 다음가기 버튼
					document.querySelector(".submit3").style.display ="none"; //완전히 인증까지 받은후 나타나는 다음가기 버튼
				}
				
			},error : function(){
				console.log("오류");
			}
			
		});
		
	}// function checkEmail() end
	
	
	function skipcheck(){ // 아이디, 폰번호랑 이메일에 해당하는 계정이 있다면 이메일에 인증번호 인증하기전까지 경고문구 나오는 함수
		let id = document.querySelector(".id");
		let phone = document.querySelector(".phone");
		let email = document.querySelector(".email");
		let identi = document.querySelector(".identi");
		let identiBtn = document.querySelector(".identiBtn");
		let confirm = document.querySelector(".confirm");
	
			if(!(id.readOnly==true && phone.readOnly==true && email.readOnly==true && identi.readOnly==true && identiBtn.disabled==true && confirm.disabled==true)){
				alert("이메일 인증후 진행 가능합니다.")
			}
	}// skipcheck() end
	
	
			
	function emailCode(){
		
		let id = $(".id").val();
		let email = $(".email").val();
		let phone = $(".phone").val();
		
		if(id==null || id.trim() ==''){
			console.log("empty");
			alert("아이디가 올바르지 않거나 적지않았습니다. 다시확인해주세요.");
			return false;
		}
		
		if(email==null || email.trim() ==''){
			console.log("empty");
			alert("이메일이 올바르지 않거나 적지않았습니다. 다시확인해주세요.");
			return false;
		}
		
		//console.log(email);
		$.ajax({
				
				type:"post",
				url:"emailCode_ok",
				data:{"id":id ,"email":email, "phone":phone},
				dataType:"JSON",
				success:function(data){
					let msg = data.code;//성공 실패 여부 
					var code = data.index;//성공시 보내지는 인증번호
					
					if(msg.includes("성공")){ //만약 이메일에 인증번호를 보내는데 성공했다면?
						console.log("성공");
						alert("인증번호를 보냈습니다.");
						let btn = document.querySelector(".confirm");
						btn.disabled = false;
						
						btn.addEventListener("click",function(){
							//console.log("인증버튼이 눌려짐 코드번호는 다음과 같음"+code);
							
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
								document.querySelector(".identiBtn").disabled = true;
								document.querySelector(".submit").style.display ="none"; //첫번째 다음으로가기 버튼
								document.querySelector(".submit2").style.display ="none";// 인증 받기전까지 나타나는 다음가기 버튼
								document.querySelector(".submit3").style.display ="inline-block"; //완전히 인증까지 받은후 나타나는 다음가기 버튼
								
					
							}
				
							
						});
						
					}else{// 만약 이메일 보내는데 실패했다면?
						alert("휴대폰 번호나 이메일이 올바르지가 않습니다. 다시 확인해주세요.");
					}
				
			},error:function(){
				console.log("에러");
			}
		});
	}// function checkEmail() end
	
	
	function findPwd_goPost(id,phone,email){
		
		let f = document.createElement('form');
		
		let i =document.createElement('input');	
		i.setAttribute('type', 'hidden');
		i.setAttribute('name', 'id');
	    i.setAttribute('value', id);
		
		let p =document.createElement('input');	
		p.setAttribute('type', 'hidden');
		p.setAttribute('name', 'phone');
	    p.setAttribute('value', phone);
	    
	    let e = document.createElement('input');
	    e.setAttribute('type', 'hidden');
	    e.setAttribute('name', 'email');
	    e.setAttribute('value', email);
	    
	    f.appendChild(i); f.appendChild(p); f.appendChild(e); 
	    f.setAttribute('method','post');
	    f.setAttribute('action','${pageContext.request.contextPath}/find/pwd_goPost');
	    document.body.appendChild(f);
	    
	    f.submit();
	    
	}
		
	</script>
</body>
</html>