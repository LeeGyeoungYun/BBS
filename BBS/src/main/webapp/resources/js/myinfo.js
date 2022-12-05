

function unlock(){
	var status = $(".ib1").prop("disabled");
	
	if(status=true){
		$(".ib1").prop("disabled",false);
		$(".ib3").prop("disabled",false);
		$(".sub").prop("disabled",false);
		$(".nick").prop("readonly",false);
		
		
		$(".sub").css("color","#fff");
		$(".sub").css("background-color"," rgb(181,214,146)");
	
		$(".sub").hover(function(){
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
	
	let b1 = document.querySelector(".b1");
	b1.addEventListener("click",function(){
		
		$(".i1").css("display","block")
		$(".i2").css("display","none");
	});
	
	let b2 = document.querySelector(".b2");
	b2.addEventListener("click",function(){
		
		$(".i1").css("display","none")
		$(".i2").css("display","block");
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
	
	
	}//window.onload 끝



