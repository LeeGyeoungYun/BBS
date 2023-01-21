<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${m.mno} 번쨰 메모 수정하기 </title>
<link rel="stylesheet" href="./resources/css/cmMemo_modify_style.css"/>
</head>
<body>
	<div id="overlay"></div>
	<div class="memoContainer">
		<form class="editForm">
		<div class="memoBox"> <!-- 메모장 -->	
			<div class="writeSpace">
				<div class="titleBox">
					<input type="text" name="memo_title" id="memo_title" value="${m.memo_title}" placeholder="제목" autocomplete="off">
					<span>
						메모지 색: <select name="memo_color">
							<option value="yellow" <c:if test="${m.memo_color=='yellow'}">${'selected'}</c:if>>기본(노랑)</option>
							<option value="blue" <c:if test="${m.memo_color=='blue'}">${'selected'}</c:if>>파랑</option>
							<option value="lightGreen" <c:if test="${m.memo_color=='lightGreen'}">${'selected'}</c:if>>연두</option>
							<option value="turquoise" <c:if test="${m.memo_color=='turquoise'}">${'selected'}</c:if>>청록</option>
							<option value="orange" <c:if test="${m.memo_color=='orange'}">${'selected'}</c:if>>주황</option>
							<option value="pink" <c:if test="${m.memo_color=='pink'}">${'selected'}</c:if>>핑크</option>
							<option value="violet" <c:if test="${m.memo_color=='violet'}">${'selected'}</c:if>>보라</option>
							<option value="whiteBlue" <c:if test="${m.memo_color=='whiteBlue'}">${'selected'}</c:if>>하늘</option>
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
					<button type="button" class="edit m_img"><i class="fa-solid fa-image" alt="이미지 추가"></i></button>
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
					${m.memo_cont}
				</div>
			</div>
		</div>
		
		<div class="doguchang"> <!-- 도구창 -->
			
			<span class="dogu m_img2"><i class="fa-solid fa-image" alt="이미지 추가"></i></span>
			<span class="dogu save"><i class="fa-regular fa-square-check" alt="저장"></i></span>
					
		</div>
		</form>
		
		<script src="resources/js/cmMemo_modify.js?ver=1"></script>
	</div>
	
</body>
</html>