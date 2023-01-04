<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${m.mno}번쨰 메모 : ${m.memo_title}</title>
<link rel="stylesheet" href="./resources/css/cmMemo_content_style.css"/>
<script src="./resources/js/jquery.js"></script>
</head>
<body>
	<div id="overlay"></div>
	<div class="memoContainer">
		
		<div class="memoBox"> <!-- 메모장 -->	
			<div class="writeSpace">
				<div class="titleBox">
					<input type="text" name="memo_title" id="memo_title" value="${m.memo_title}" placeholder="제목" disabled>
					<span>
						메모지 색: <select name="memo_color" disabled>
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
					<button type="button" class="edit img"><i class="fa-solid fa-image" alt="이미지 추가"></i></button>
					<input type="file" class="chooseImg" style="display:none;" accept=".jsp , .JPG, .jpeg, .png, .PNG" disabled>
					<select class="fontSize" >
						<option value="" selected="selected" disabled>글자크기</option>
						<option value="1">10px</option>
						<option value="2">13px</option>
						<option value="3">16px</option>
						<option value="4">18px</option>
						<option value="5">24px</option>
						<option value="6">32px</option>
						<option value="7">48px</option>
					</select>
				</div>
				<div id="memo_cont" name="memo_cont" contenteditable="false" >
					${m.memo_cont}
				</div>
			</div>
		</div>
		
		
		<div class="doguchang"> <!-- 도구창 -->
		
		<c:if test="${answer.equals('success')}">
			<a href="cmMemo?mno=${m.mno}&state=modify">
				<span class="dogu"><i class="fa-solid fa-pen-to-square" alt="편집"></i></span>
			</a>
			<a href="cmMemo?mno=${m.mno}&state=delete">
				<span class="dogu"><i class="fa-solid fa-trash"></i></span>
			</a>
			<div class="wall"></div>
		</c:if>
			<span class="dogu d_modal" onclick="modalOn()"><i class="fa-solid fa-circle-info" alt="더보기"></i></span>	
		</div>
		
	</div>
	
	
	<!-- 여기는 더보기 모달창 내용입니다. -->
	<div class="modalChang" style="display:none;">
		<div class="modal_overlay"></div>
		<div class="modal">
			<div class="closeBox">
				<span class="close"><i class="fa-sharp fa-solid fa-xmark"></i></span>
			</div>
			<div class="infoBox">
				<p>작성자 : ${m.user_id}</p><br>
				<p>조회수: ${m.memo_viewcnt}</p><br>
				<p>작성한 날짜 : ${m.memo_update}</p><br>
				<p>수정한 날짜 : ${m.memo_modifydate}</p><br>
			</div>
		</div>
	</div>
	
	
	<script src="./resources/js/cmMemo_content.js?ver=1"></script>
</body>
</html>