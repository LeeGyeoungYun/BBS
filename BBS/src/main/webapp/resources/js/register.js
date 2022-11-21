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
 		data: {"id":id},
 		datatype: "json",
 		success : function(data){
 			alert(data);
 		},error : function(){
 			alert("오류");
 		}
 	});
}
	
	
