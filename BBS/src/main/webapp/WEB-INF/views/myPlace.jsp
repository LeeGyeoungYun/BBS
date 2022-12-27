<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="header.jsp"%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/myPlace.css">
<script src="resources/js/jquery.js"></script>
<title>나의 메모장</title>
<style>
.imagebox {
	margin: 10px 0;
	border: 10px solid;
	width: 1024px;
	height: 576px;
	background-image: url("resources/images/note3.jpg");
	background-size: cover;
	overflow-y: scroll;
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 70px;
}
</style>
</head>
<body class="bodyContainer">
	<div id="overlay"></div>
	<div class="backgroud">
		<div class="noteContainer">
			
			<div class="noteBtn">
			<form class="searchForm" action="myPlace" method="get">
			<div class="ss">
				<span class="searchBox">
					<input type="text" class="fieldName" name="fieldName">
					<i class="fa-solid fa-magnifying-glass search"></i>
					<i class="fa-solid fa-magnifying-glass search_active" style="display:none" onclick="searchInfo()"></i>
					<input type="submit" class="submit" style="display:none">
				</span>
				<div class="closeSearch" onclick="closeSearch()">
					<i class="fa-sharp fa-solid fa-xmark"></i>			
				</div>
			</div>
			</form>
				
				<span class="trashBox"><i class="fa-solid fa-trash"></i></span>
			</div>
			<div class="imagebox">
				<!-- <img class="board"src="resources/images/note3.jpg"> -->
				<c:forEach var="m" items="${mlist}">
					${m.memo_title}
				</c:forEach>
				<div class="post_it"></div>
				<div class="post_it"></div>
				<div class="post_it"></div>
				<div class="post_it"></div>
				<div class="post_it"></div>
				<div class="post_it"></div>
				<div class="post_it"></div>

			</div>

		</div>
		
		<a href="myPlace_cont">
			<div class="createNote"><i class="fa-solid fa-pen-to-square"></i></div>
		</a>
		
	</div>
	<script src="resources/js/myPlace.js?ver=1"></script>
</body>
</html>