


	let nextBtn = document.querySelector(".next");
	let backBtn = document.querySelector(".back");
	let count = parseInt(document.querySelector(".count").value); //현재 페이지의 게시물 수를 표현
	let urlparam = window.location.search; //추가된 파라미터값을 뽑음
	let page = urlparam.split('=')[1]; // 파라미터 값을 받아와 지금 현재페이지를 변수에 넣음
	
	if(urlparam==''|| page =='1' ){
		$(".back").prop("disabled",true);		
	}
	
	if(count<10){//만약에 부분레코드수가 10개 미만이라면 더 값이 없는것이므로 다음 버튼을 잠가야함.
		$(".next").prop("disabled",true);
	}


