
function modalOn(){	//모달창 키기
	$(".modalChang").css("display","block");	
}

let modalOverlay = document.querySelector(".modal_overlay");
modalOverlay.addEventListener("click",function(){

	$(".modalChang").css("display","none");
});

let close = document.querySelector(".close");
close.addEventListener("click",function(){

	$(".modalChang").css("display","none");
});