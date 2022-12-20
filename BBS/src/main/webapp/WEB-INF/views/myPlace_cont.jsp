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
		<form class="editForm" onsubmit="return a();">
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
					<button type="button" class="edit Bold"><i class="fa-solid fa-bold"></i></button>
					<button type="button" class="edit Italic"><i class="fa-solid fa-italic"></i></button>
					<button type="button" class="edit Underline"><i class="fa-solid fa-underline"></i></button>
					<button type="button" class="edit Strikethrough"><i class="fa-solid fa-strikethrough"></i></button>
					<button type="button" class="edit alignLeft"><i class="fa-solid fa-align-left"></i></button>
					<button type="button" class="edit alignCenter"><i class="fa-solid fa-align-center"></i></button>
					<button type="button" class="edit alignRight"><i class="fa-solid fa-align-right"></i></button>
					<button type="button" class="edit alignJustify"><i class="fa-solid fa-align-justify"></i></button>
					<button type="button" class="edit img"><i class="fa-solid fa-image" alt="이미지 추가"></i></button>
					<input type="file" class="chooseImg" style="display:none;" accept=".jsp , .JPG, .jpeg, .png, .PNG">
					<select class="fontSize" >
						<option value="" selected="selected">글자크기</option>
						<option value="10">10px</option>
						<option value="12">12px</option>
						<option value="14">14px</option>
						<option value="16">16px</option>
						<option value="18">18px</option>
						<option value="20">20px</option>
						<option value="25">25px</option>
						<option value="30">30px</option>
					</select>
				</div>
				<div id="memo_cont" name="memo_cont" contenteditable="true" >
					
				</div>
			</div>
		</div>
		
		<div class="doguchang"> <!-- 도구창 -->
			<span class="dogu"><i class="fa-solid fa-pen-to-square" alt="편집"></i></span>
			<span class="dogu"><i class="fa-solid fa-trash"></i></span>
			<div class="wall"></div>
			<span class="dogu img2"><i class="fa-solid fa-image" alt="이미지 추가"></i></span>
			<span class="dogu save"><i class="fa-regular fa-square-check" alt="저장"></i></span>
			<span class="dogu"><i class="fa-solid fa-circle-info" alt="더보기"></i></span>
			<button type="submit" class="gogo"></button>
		</div>
		</form>
	</div>
	
	<script src="resources/js/myPlace_cont.js"></script>
</body>
</html>