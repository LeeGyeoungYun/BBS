function register_check(){

	if($.trim($('#id').val())== ''){
		
		$('.warning_Check').css({'display':'block'});
		$('#id').focus();
		return false;
	}
};

function id_check(){
 	let id = $("#id").val();
 
 	$.ajax({
 		type: "POST",
 		url: "idCheck",
 		data: {"id":id},/*앞에 id는 컨트롤러에 넘길 데이터 이름, 뒤에 id는 view에서 받은 데이터 즉, 위에서 선언한 id변수*/
 		dataType: "json",
 		success : function(data){
 			alert(data.code);
 			let check = data.code;
 			
 			if(check.includes('가능')){
 				let message = confirm("선택하신 아이디를 사용하시겠습니까?");
 				if(message){
 					alert("선택함");
 				}else{
 					 var input = document.getElementById(id);
 					 input.value = null;
    			     
 					
 				}
 				
 			}else{
 				alert("  ");
 			}
 			
 			
 		},error : function(){
 			alert("오류");
 		}
 	});
}
	
	
