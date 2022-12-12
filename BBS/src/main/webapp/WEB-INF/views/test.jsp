<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<title> 헤헷 </title>
<style> 

.abc{
	width:400px; height: 300px; display:block; border: 2px solid;
	background-image: url("../resources/images/scatch.jpg");
	background-size: cover;
	 background-repeat : no-repeat;
}

.aa{
	width:50px; height: 50px; background-color: red;
}

</style>
<script>
	function aaa(){
		
		var preview = document.querySelector("img");
		var file = document.querySelector(".abd").files[0];
		var reader = new FileReader();
		
		reader.addEventListener('load', function(){
			preview.src = reader.result;
		},false);
		
		if(file){
			reader.readAsDataURL(file);
		}
	}
</script>
</head>
<body>
 <p> 안냥? </p>
 <div class="abc">
 	<input type="file" class="abd" id="ab" onchange="aaa()"><img src="" height="200" alt="미리보기">
 	<br><br><br><br>
 	<span>테스트 : <input type="text" class="memo" id="memo" alt="memo" name="memo" value="ㅎㅎ"></span>
 </div>
</body>
</html>