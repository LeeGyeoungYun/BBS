
window.onbeforeunload = function() { //혹시라도 작성중 뒤로가기나 다른 페이지로 이동할때 다시 물어보기
  	return "Are you sure you wish to leave this delightful page?";
}


function check(element){

	const checkboxes = document.getElementsByName("notice_kind");
	
	checkboxes.forEach((a)=>{
		a.checked = false;
	})
	
	element.checked = true;
}

function formCheck(){
	
	let title = document.querySelector(".titlebox").value;
	let content = document.querySelector(".notice_cont").value;
	
	if(title.trim().length == 0){
		alert("제목이 비어있습니다. 다시 확인해주세요.");
		document.querySelector(".titlebox").focus();
		return false;
	}
	
	if(content.trim().length == 0){
		alert("내용이 비어있습니다. 다시 확인해주세요.");
		document.querySelector(".notice_cont").focus();
		return false;
	}
	
	let question = confirm("저장하시겠습니까?");
	window.onbeforeunload= null; //이게 있어야 저장후 나가질때 나갈꺼냐고 안물어봄
	if(!question){
		return false;
	}
	
}