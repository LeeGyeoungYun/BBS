<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이페이지는 테스트2입니다.</title>
<style type="text/css">
	.a{
		margin: 40px 0 0 40px;
		width: 300px; height: 300px; border: 1px solid black;
	}
	.b{
		margin: 40px 0 0 40px;
		padding: 15px;
		width: 150px;
		
	}
	
	.ff{
		margin: 40px 0 0 40px;
		width:300px;
		height: 300px;
		border: 5px solid;
	}
	
</style>

<script type="text/javascript">



</script>
</head>
<body>
	<div class="a">
		<form action="prac_ok" method="post" enctype="multypart/form-data">
		<input type="text" name="abc" class="b" autocomplete="off">
		<input type="password" name="passwd" class="b" autocomplete="off">
		<input type="text" value="${dab}" class="b">
		<input type="submit">
		</form>
	</div>
	
	<div class="ff">
		<a href="https://www.naver.com">네이버로 간다간다 쑝간다.</a>
		<a href="./">뿅!</a>
	</div>
	
</body>
</html>