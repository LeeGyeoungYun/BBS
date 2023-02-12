
let search = document.querySelector(".searchBox");
search.addEventListener("click",function(){
	
	
	$(".searchBox").css("width","350px");
	$(".searchBox").css("text-align","right");
	$(".search").css("padding-left","25px");
	$(".fieldName").css("display","block");
	$(".fieldName").css("width","220px");
	$(".searchBox").css("display","flex");
	$(".ss").css("width","425px");
	$(".closeSearch").css("visibility","visible");	
	$(".search").css("display","none");
	
	$(".search_active").css("padding-left","25px");
	$(".search_active").css("display","block");
	
});

function closeSearch(){
	
	$(".searchBox").css("width","60px");
	$(".searchBox").css("text-align","center");
	$(".search").css("padding-left","0px");
	$(".fieldName").css("display","none");
	$(".fieldName").css("width","0px");
	$(".searchBox").css("display","");
	$(".ss").css("width","0px");
	$(".closeSearch").css("visibility","hidden");
	$(".search").css("display","block");
	$(".search_active").css("display","none");
	
	$(".fieldName").val(''); // 서치 바 닫으면 안에 값도 초기화
};

function searchInfo(){

	$(".submit").click();
	
}


function deleteConfirm(){ //삭제 아이콘과 취소 아이콘이 보이게끔 하는 함수

	$(".modify").css("pointer-events","none"); // <a>태그 비활성화
	$(".check").css("display","block");
	$(".trash").css("display","none");
	$(".deleteBox").css("display","block");
	$(".deleteCancle").css("display","block");
}

function cancle_deleteMemo(){ // 삭제하기를 취소하는 함수 혹시라도 삭제할꺼를 선택했더라도 이 함수가 실행되면 다 초기화됩니다.

	$(".modify").css("pointer-events","auto"); // <a>태그 활성화
	$(".check").css("display","none");
	$(".trash").css("display","block");
	$(".deleteBox").css("display","none");
	$(".deleteCancle").css("display","none");
	
	$(':checkbox:checked').prop('checked',false);
	
}

function deleteMemo(){ //선택된 메모 삭제하는 함수
	let selectArray = check(); // 체크함수 실행해서 리턴된값 변수에 담기
	//console.log(selectArray);
	
	if(selectArray.length==0){
		alert("삭제할 선택된 메모가 없습니다. 다시 확인해주세요.");
		return false;
	}
	
	let question = confirm("정말 삭제하시겠습니까?");
	if(question){
		
		//아작스 통신 -> 선택된 메모넘버를 컨트롤러에 보냄 split() 메소드이용해서 반복문으로 선택된 메모 db에서 삭제 성공후 아작스에서 
		//삭제 성공했다는 메세지와 함꼐 cancle_deleteMemo()메소드 실행해서 닫아주기
		//만약실패했다면 실패했고 다시 해달라는 문구출력 -> 실패한경우 세션아이디가 날라갔을경우 등등
		alert("삭제되었습니다.");
	}
}


function check(){
	let query = "input[name='check']:checked";
	let selectedEls = document.querySelectorAll(query);
	
	let result = '';
  	
  	selectedEls.forEach((el) => {
   		 result += el.dataset.noteNum + ',';
 	 });
	
	return result;	
}
