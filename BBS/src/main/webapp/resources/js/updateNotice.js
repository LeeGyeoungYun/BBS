
function check(element){

	const checkboxes = document.getElementsByName("notice_kind");
	
	checkboxes.forEach((a)=>{
		a.checked = false;
	})
	
	element.checked = true;
}

function formCheck(){
	
	let title = document.querySelector(".titlebox").value;
	
	if(title.trim().length == 0){
		alert("제목이 비어있습니다. 다시 확인해주세요.");
		document.querySelector(".titlebox").focus();
		return false;
	}
	
	
	return false;
}