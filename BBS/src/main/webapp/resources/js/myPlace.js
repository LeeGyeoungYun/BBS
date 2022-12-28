
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
};

function searchInfo(){

	$(".submit").click();
	
}


function deleteMemo(){

	$(".modify").css("pointer-events","none"); // <a>태그 비활성화
	$(".check").css("display","block");
	$(".trash").css("display","none");
	$(".deleteCancle").css("display","block");
}

function cancle_deleteMemo(){

	$(".modify").css("pointer-events","auto"); // <a>태그 활성화
	$(".check").css("display","none");
	$(".trash").css("display","block");
	$(".deleteCancle").css("display","none");
	
	$(':checkbox:checked').prop('checked',false);
	
}

