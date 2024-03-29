

function id_check(){
	
 	let id = $("#user_id").val();
 
 	$.ajax({
 		type: "POST",
 		url: "idCheck",
 		data: {"id":id},/*앞에 id는 컨트롤러에 넘길 데이터 이름, 뒤에 id는 view에서 받은 데이터 즉, 위에서 선언한 id변수*/
 		dataType: "json",
 		success : function(data){
 			alert(data.code);
 			let check = data.code;
 			
 			if(check.includes('가능')){
 				let message = confirm("선택하신 아이디를 사용하시겠습니까?");
 				if(message){
 					$("#user_id").prop("readonly",true);
 					$(".overlapBtn").prop("disabled",true);
 				}else{		
 					
 					$("#user_id").val(''); /* 아이디 input 값 초기화 */
 					$("#user_id").focus();
 				}
 				
 			}else{
 				$("#user_id").val('');
 				$("#user_id").focus();
 			}
 					
 		},error : function(){
 			alert("오류");
 		}
 	});/* 아작스 통신 끝*/
}


function register_check(){

	let idCheck = /^[a-z0-9]{4,12}$/; /*[a-z0-9]{4,12}는 4글자~12글자사이에는 영소문자나 숫자만이 들어올수있다.   정규식  문장의^는 시작을, $는 문장의 끝을의미*/
	let id = $("#user_id").val(); /*인풋창에 내가 적은 아이디 값을 jquery로 반환해 id 변수에 저장*/
	let nameCheck = /^[a-z|A-Z|0-9|가-힣|]{2,10}$/;
	let name= $("#user_nickname").val();
	let pwdCheck = RegExp(/^[a-zA-Z0-9]{6,20}$/); /*비밀번호 길이 6 ~ 20자로 제한*/
	let pwd = $("#user_pwd").val();
	let phoneCheck = /^[0-9]{10,11}$/;
	let phone = $("#user_phoneNum").val();
	
	let emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	let email = $("#user_email").val();	
	let pwdRepeat = $("#user_pwConfirm").val();
	
	if($.trim(id)== ''){
		
		$('.warning_Check').css({'display':'block'});
		$('#user_id').focus();
		return false;
	}
	
	if($.trim(id)!= ''){	
		$('.warning_Check').css({'display':'none'});
	}
	
	if(!idCheck.test(id)){
		alert("아이디 형식에 맞지 않습니다. 다시 입력해주세요.");
		$('#user_id').focus();
		return false;
	}
	
	if(!($(".overlapBtn").prop("disabled"))){ /*만약 아이디 중복체크를 안한 상태라면? 해야지만 회원가입이 가능함*/
		alert("아이디 중복확인 하세요");
		return false;
	}
	
	if(!nameCheck.test(name)){ /*별명 유효성 검사*/
		alert("별명 형식에 맞지 않습니다. 한글이나 영어로 10자 이내로 작성해주세요.");
		$("#user_nickname").focus();
		return false;
	}
	
	if(!emailCheck.test(email)){
		alert("이메일형식이 맞지않습니다. 다시 입력해주세요");
		$("#user_email").focus();
		return false;
	}
	
	if(!phoneCheck.test(phone)){
		alert("전화번호형식이 맞지않습니다. 다시 입력해주세요");
		$("#user_phoneNum").focus();
		return false;
	}
	
	if(!pwdCheck.test(pwd)){
		alert("비밀번호 형식에 맞지 않습니다. 다시 입력해주세요.");
		$('#user_pwd').focus();
		return false;
	}
	
	if(pwdRepeat != pwd){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	

	

};
	
	
