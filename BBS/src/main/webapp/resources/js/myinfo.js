

function unlock(){
	var status = $(".ib1").prop("disabled");
	
	if(status=true){
		$(".ib1").prop("disabled",false);
		$(".ib3").prop("disabled",false);
		$(".s1").prop("disabled",false);
		$(".nick").prop("readonly",false);
		
		
		$(".s1").css("color","#fff");
		$(".s1").css("background-color"," rgb(181,214,146)");
	
		$(".s1").hover(function(){
			$(this).css("background-color"," rgb(113,160,61)");
		},function(){
	 		$(this).css("background-color"," rgb(181,214,146)");
		})
		
	}
	
	
}

function apply(){
	
	const question = confirm("프로필 변경 사항을 저장하시겠습니까?");
	
	if(!question){
		return false;
	}
}

function edit(){ //여기는 유저정보 편집하는 함수버튼입니다.
	
	let email = document.querySelector("#user_email");
	let phone = document.querySelector("#user_phoneNum");
	let pwd = document.querySelector("#user_pwd");
	let pwdConfirm = document.querySelector("#user_pwConfirm");
	let s2 = document.querySelector(".s2");
	
	email.readOnly =false;
	phone.readOnly =false;
	pwd.readOnly =false;
	pwdConfirm.readOnly =false;
	s2.disabled = false;
	
	$(".s2").css("color","#fff");
		$(".s2").css("background-color"," rgb(181,214,146)");
	
		$(".s2").hover(function(){
			$(this).css("background-color"," rgb(113,160,61)");
		},function(){
	 		$(this).css("background-color"," rgb(181,214,146)");
		});
	
	
}


function apply2(){
	
	let emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	let email = $("#user_email").val();	
	let phoneCheck = /^[0-9]{10,11}$/;
	let phone = $("#user_phoneNum").val();
	let pwdCheck = RegExp(/^[a-zA-Z0-9]{6,20}$/); /*비밀번호 길이 6 ~ 20자로 제한*/
	let pwd = $("#user_pwd").val();
	let pwdRepeat = $("#user_pwConfirm").val();
	
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
	
	if(pwd!='' || pwdRepeat!=''){   //비밀번호하고 비밀번호 확인란에 값을 적었을 경우
		
		if(pwdRepeat != pwd){           // 값을 적었지만 비밀번호와 비밀번호 확인란의 값이 일치하지 않을 경우
		alert("비밀번호가 일치하지 않습니다.");
		$("#user_pwd").focus();
		return false;
		}else{						    // 값이 일치하지만 비밀번호 형식에 어긋난 경우
			
			if(!pwdCheck.test(pwd)){
				alert("비밀번호 형식에 맞지 않습니다. 다시입력해주세요.");
				$("#user_pwd").focus();
				return false;
			}
		
		}//else end
		
		
	}//if end
	
	
	
	
	let question = confirm("프로필 변경 사항을 저장하시겠습니까?");
	
	if(!question){
		return false;
	}
	
	
	
}//apply2() end

	
function modal_close(){   //모달창 취소버튼 클릭시
	$("#modal_pwd").val('');
	$(".modal").css("visibility","hidden");
	$('#overlay2').css({'visibility':'hidden'});

}//modal_close() end
	
function modal_open(){	  //모달창 여는버튼 클릭시

	$(".modal").css("visibility","visible");
	$('#overlay2').css({'visibility':'visible'});
	
	let close = document.querySelector("#overlay2");
	close.addEventListener("click",function(){
		modal_close();
	});
}	
	
	
	
	
	window.onload = function(){
	
	let cancle = document.querySelector(".can");
	cancle.addEventListener("click",function(){
		
		let answer = confirm("취소하시겠습니까?");
		if(answer){
			location.reload();
		}else{
			return false;
		}	
	});
	
	let cancle2 = document.querySelector(".c2");
	cancle2.addEventListener("click",function(){
		
		let answer = confirm("취소하시겠습니까?");
		if(answer){
			location.reload();
		}else{
			return false;
		}	
	});
	
	let b1 = document.querySelector(".b1");
	b1.addEventListener("click",function(){
		
		$(".i1").css("display","block")
		$(".i2").css("display","none");
		$(".i3").css("display","none");
	});
	
	let b2 = document.querySelector(".b2");
	b2.addEventListener("click",function(){
		
		$(".i1").css("display","none")
		$(".i2").css("display","block");
		$(".i3").css("display","none");
	});
	
	let b3 = document.querySelector(".b3");
	b3.addEventListener("click",function(){
		
		$(".i1").css("display","none")
		$(".i2").css("display","none");
		$(".i3").css("display","block");
	});
	
	
	
	let ib1 = document.querySelector(".ib1");
	ib1.addEventListener("click", function(){
		
		document.querySelector(".chooseFile").click();
		$(".chooseFile").change(function(){ //값이 변경되었으면 함수발생
   			
   			let file = document.querySelector(".chooseFile").files[0]; //input=file에서 선택한 사진을 변수로잡음
   			let image = document.querySelector(".proImg");// <img>태그를 변수로잡음
   			let reader = new FileReader();//파일리더기 변수 설정
   			
   			reader.addEventListener("load",function(){//리더기가 로드 된다면? 즉 실행한다면 다음 실행
   				image.src= reader.result;
   			},false);
   			
   			if(file){
   				reader.readAsDataURL(file);
   			}
		
		
	});	//사진변경 버튼을 누르면 input file이 실행되어 보여지게 함
	
	}); // ib1.addEventListener end
	
	
	let ib3 = document.querySelector(".ib3");
	ib3.addEventListener("click",function(){
		let message = confirm("삭제하시겠습니까?");
		if(message){
			let image = document.querySelector(".proImg").src;
			
			$.ajax({
				type:"post",
				url:"deleteProfile",
				data: {"image":image},
				dataType:"json",
				success : function(data){					
					let msg = data.code;
					alert(msg);
					
					if(msg.includes('삭제')){
						document.querySelector(".proImg").src ='./resources/uploadUserProfile'; //비동기식으로 새로고침없이 UI상에 프로필사진내림
					}
					
				
				},error : function(){
 					alert("오류");
 				}
						
			});//아직스 통신끝
			
		}else{
			alert("삭제 ㄴㄴ.");
		}
	}); // ib3.addEventListener end
	
	
	// 회원탈퇴버튼 눌렀을때
	let modalBtn = document.querySelector(".modalBtn");
	modalBtn.addEventListener("click",function(){
		let modalpwd = $("#modal_pwd").val();
		
		$.ajax({
			type:"post",
			url:"deleteUser_request",
			data :{"pwd":modalpwd},
			dataType:"json",
			success:function(data){
				let msg = data.code;
				if(msg.includes("일치")){ //비밀번호가 일치하다면?
					
					let choice = confirm("회원탈퇴시 개인정보가 모두 말소됩니다. 정말 탈퇴하시겠습니까?");
					if(choice){//예를 누른다면?
					
						$.ajax({
							type: "get",
							url:"deleteUser_ok",
							data: {"choiceRequest":choice},
							dataType: "json",
							success : function(data){
								console.log("탈퇴");
								location='/BBS/withdrawal';
							},error : function(){
								alert("오류");
							}
						
						});
					
					}else{//취소를 누른다면?
						
						modal_close();
					}
					
					
				}else{ //비밀번호가 일치하지 않다면?
					alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
					$("#modal_pwd").val('');
					$("#modal_pwd").focus();
				}
				
			},error:function(){
				alert("전송이 실패하였습니다.");
			}
		
		});
		
	});// modalBtn.addEventListener end
	
	
	}//window.onload 끝



