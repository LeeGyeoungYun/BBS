
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
	if(!question){
		return false;
	}
	
}