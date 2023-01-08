
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


