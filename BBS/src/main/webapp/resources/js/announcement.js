
let tab1 = document.querySelector(".t1");
let tab2 = document.querySelector(".t2");
let tab3 = document.querySelector(".t3");
let td1 = document.querySelector(".td1");
let td2 = document.querySelector(".td2");
let td3 = document.querySelector(".td3");

tab1.addEventListener("click",function(){ //tab1을 누르면 다음 함수 실행

	tab1.classList.add("active");
	tab2.classList.remove("active");
	tab3.classList.remove("active");
	
	td1.classList.add("active");
	td2.classList.remove("active");
	td3.classList.remove("active");
	
	
});

tab2.addEventListener("click",function(){ //tab2을 누르면 다음 함수 실행

	tab2.classList.add("active");
	tab1.classList.remove("active");
	tab3.classList.remove("active");
	
	td2.classList.add("active");
	td1.classList.remove("active");
	td3.classList.remove("active");
	
});

tab3.addEventListener("click",function(){ //tab3을 누르면 다음 함수 실행
	
	tab3.classList.add("active");
	tab1.classList.remove("active");
	tab2.classList.remove("active");
	
	td3.classList.add("active");
	td1.classList.remove("active");
	td2.classList.remove("active");
});


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


