

function toggle(){
	
	if($(".ib1").disabled = true){
		$(".ib1").prop("disabled",false);
		$(".ib3").prop("disabled",false);
		$(".sub").prop("disabled",false);
		$(".nick").prop("readonly",false);
		
		
		$(".sub").css("color","#fff");
		$(".sub").css("background-color"," rgb(181,214,146)");
	
		$(".sub").hover(function(){
			$(this).css("background-color"," rgb(113,160,61)");
		},function(){
	 		$(this).css("background-color"," rgb(181,214,146)");
		})
	}
	
	else{
		console.log("1");
		$(".ib1").prop("disabled",true);
		$(".ib3").prop("disabled",true);
		$(".sub").prop("disabled",true);
		$(".nick").prop("readonly",true);
		
		
		
	}
	
}

