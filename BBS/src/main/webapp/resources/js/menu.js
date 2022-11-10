
function menu_click(){
	
	$('.leftBar_menu').css({'visibility':'visible'});
	$('.leftBar_menu').css({'transform':'translateZ(0)'});
	$('.bodyContainer').css({'opacity':'0.7'});
	$('#overlay').css({'visibility':'visible'});
}

function menu_close(){
	$('.leftBar_menu').css({'visibility':'hidden'});
	$('.leftBar_menu').css({'transform':'translate3d(-100%,0,0)'});
	$('.bodyContainer').css({'opacity':'1'});
	$('#overlay').css({'visibility':'hidden'});
}

 $('#overlay').click(function() {menu_close()});