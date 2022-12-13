
let search = document.querySelector(".searchBox");
search.addEventListener("click",function(){
	
	
	$(".searchBox").css("width","350px");
	$(".searchBox").css("text-align","right");
	$(".search").css("padding-left","25px");
	$(".findBox").css("display","block");
	$(".findBox").css("width","220px");
	$(".searchBox").css("display","flex");
	$(".ss").css("width","425px");
	$(".closeSearch").css("visibility","visible");
	
});

function closeSearch(){
	
	$(".searchBox").css("width","60px");
	$(".searchBox").css("text-align","center");
	$(".search").css("padding-left","0px");
	$(".findBox").css("display","none");
	$(".findBox").css("width","0px");
	$(".searchBox").css("display","");
	$(".ss").css("width","0px");
	$(".closeSearch").css("visibility","hidden");
};