<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="header.jsp" %>
<head>
<meta charset="UTF-8">
<title>메모장</title>
<link rel="stylesheet" href="resources/css/myPlace_cont_style.css">
</head>
<body>
	<div id="overlay"></div>
	<div class="memoContainer">
		<form class="editForm" method="post" action="update_memo_ok" onsubmit="return a();" >
		<div class="memoBox"> <!-- 메모장 -->	
			<div class="writeSpace">
				<div class="titleBox">
					<input type="text" name="memo_title" id="memo_title" placeholder="제목">
					<span>
						메모지 색: <select>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select>
					
					</span>
				</div>
				
				<div class="editBtn">
					<span class="edit Bold"><i class="fa-solid fa-bold"></i></span>
					<span class="edit Bold"><i class="fa-solid fa-bold"></i></span>
					<span class="edit Bold"><i class="fa-solid fa-bold"></i></span>
					<span class="edit Bold"><i class="fa-solid fa-bold"></i></span>
				</div>
				<div id="memo_cont" name="memo_cont" contenteditable="true" >
					
				</div>
			</div>
		</div>
		
		<div class="doguchang"> <!-- 도구창 -->
			<span class="dogu"><i class="fa-solid fa-pen-to-square" alt="편집"></i></span>
			<span class="dogu"><i class="fa-solid fa-trash"></i></span>
			<div class="wall"></div>
			<span class="dogu"><i class="fa-solid fa-image" alt="이미지 추가"></i></span>
			<span class="dogu"><i class="fa-regular fa-square-check" alt="저장"></i></span>
			<span class="dogu"><i class="fa-solid fa-circle-info" alt="더보기"></i></span>
		</div>
		</form>
	</div>
	
	<script src="resources/js/myPlace_cont.js"></script>
</body>
</html>