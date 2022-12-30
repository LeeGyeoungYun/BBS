<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="header.jsp" %>
<head>
<meta charset="UTF-8">
<title>메모장</title>
<link rel="stylesheet" href="resources/css/myPlace_cont_style.css">
<script src="resources/js/jquery.js"></script>
</head>
<body>
	<div id="overlay"></div>
	<div class="memoContainer">
		<form class="editForm">
		<div class="memoBox"> <!-- 메모장 -->	
			<div class="writeSpace">
				<div class="titleBox">
					<input type="text" name="memo_title" id="memo_title" placeholder="제목">
					<span>
						메모지 색: <select name="memo_color">
							<option value="yellow" selected>기본(노랑)</option>
							<option value="blue">파랑</option>
							<option value="lightGreen">연두</option>
							<option value="turquoise">청록</option>
							<option value="orange">주황</option>
							<option value="pink">핑크</option>
							<option value="violet">보라</option>
							<option value="whiteBlue">하늘</option>
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
						<option value="1">10px</option>
						<option value="2">13px</option>
						<option value="3">16px</option>
						<option value="4">18px</option>
						<option value="5">24px</option>
						<option value="6">32px</option>
						<option value="7">48px</option>
					</select>
				</div>
				<div id="memo_cont" name="memo_cont" contenteditable="true" >
					
				</div>
			</div>
		</div>
		
		<div class="doguchang"> <!-- 도구창 -->
			
			<span class="dogu img2"><i class="fa-solid fa-image" alt="이미지 추가"></i></span>
			<span class="dogu save"><i class="fa-regular fa-square-check" alt="저장"></i></span>
		
		</div>
		</form>
	</div>
	
	<script src="resources/js/myPlace_cont.js"></script>
</body>
</html>