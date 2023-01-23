

let nextBtn = document.querySelector(".next");
let backBtn = document.querySelector(".back");

nextBtn.addEventListener("click",function(){
	let count = parseInt(document.querySelector(".count").value);
	let page = parseInt(document.querySelector(".page").value);
		
	page +=1;//다음으로 가는 이벤트가 실행되었기때문에 페이지가 +1 되서 아작스로 전송
	
	if(count<10){//만약에 부분레코드수가 10개 미만이라면 더 값이 없는것이므로 다음 버튼을 잠가야함.
		$(".next").prop("disabled",true);
	}else{
		$(".next").prop("disabled",false);
		$(".back").prop("disabled",false);
	}
	
	$.ajax({
		type:"POST",
		url:"paging",
		data:{"page":page},
		dataType:"json",
		success: function(){
			console.log("성공");
		
		},error: function(){
			console.log("오류");
		}
	
	
	});
	
	
	
});