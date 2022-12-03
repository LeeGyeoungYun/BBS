

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
		
	
	}//window.onload 끝



