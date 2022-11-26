
function closeBox(){
	
	let myinfo = $(".myPlaceBox");
	myinfo.css("height","0px");
	myinfo.css("visibility","hidden");
	

}

function openBox(){

	let myinfo = $(".myPlaceBox");
	myinfo.css("height","300px");
	myinfo.css("visibility","visible");
	
}

$(".logout").click(function(){

	alert("눌려짐");
});