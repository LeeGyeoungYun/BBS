<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/community_style.css">
<script src="resources/js/jquery.js"></script>
<title>정보공유 게시판</title>
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
			<form class="searchForm" action="community" method="get">
			<div class="ss">
				<span class="searchBox">
					<select name="field">
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						
					</select>
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
				<% if(id!=null){ %>
				<span class="trashBox myFile" onclick="myMemo()"><i class="fa-regular fa-file-lines"></i></span>
				<span class="trashBox deleteCancle" onclick="cancle_myMemo()"><i class="fa-sharp fa-solid fa-xmark"></i></span>
				<%} %>
			</div>
			
			
			<div class="imagebox im1"> <!-- 여긴 커뮤니티에 쓴 전체 글 목록을 보는 공간입니다. -->
				<!-- <img class="board"src="resources/images/note3.jpg"> -->
				<c:forEach var="c" items="${clist}">
					
					<div class="memoContainer">
					<input type="checkbox" class="check">
					<a class="modify" href="cmMemo?mno=${c.mno}&state=content">
					
					<c:if test="${c.memo_color=='yellow'}"> <!-- 종이색을 노란색으로 선택했을경우 -->
						
						<div class="post_it" style="background-image: url('./resources/images/yellowPost_it.png');">
							<div class="titleBox">${c.memo_title}</div>
						</div>
					</c:if>
										
					<c:if test="${c.memo_color=='blue'}"> <!-- 종이색을 파랑으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/bluePost_it.png'); ">
							<div class="titleBox">${c.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${c.memo_color=='lightGreen'}"> <!-- 종이색을 연두으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/lightGreenPost_it.png');">
							<div class="titleBox">${c.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${c.memo_color=='turquoise'}"> <!-- 종이색을 청록색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/turquoisePost_it.png');">
							<div class="titleBox">${c.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${c.memo_color=='orange'}"> <!-- 종이색을 오렌지색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/orangePost_it.png');">
							<div class="titleBox">${c.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${c.memo_color=='pink'}"> <!-- 종이색을 핑크색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/pinkPost_it.png');">
							<div class="titleBox">${c.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${c.memo_color=='violet'}"> <!-- 종이색을 보라색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/violetPost_it.png');">
							<div class="titleBox">${c.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${c.memo_color=='whiteBlue'}"> <!-- 종이색을 하늘색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/whiteBluePost_it.png');">
							<div class="titleBox">${c.memo_title}</div>
						</div>
					</c:if>
					
					</a>
					</div>
				</c:forEach>
				
			</div>
			
			<div class="imagebox im2" style="display:none;"> <!-- 여긴 커뮤니티에 쓴 내 글 목록만 보는 공간입니다. -->
				<!-- <img class="board"src="resources/images/note3.jpg"> -->
				<c:forEach var="m" items="${cm_mylist}">
					
					<div class="memoContainer">
					<input type="checkbox" class="check">
					<a class="modify" href="cmMemo?mno=${m.mno}&state=content">
					
					<c:if test="${m.memo_color=='yellow'}"> <!-- 종이색을 노란색으로 선택했을경우 -->
						
						<div class="post_it" style="background-image: url('./resources/images/yellowPost_it.png');">
							<div class="titleBox">${m.memo_title}</div>
						</div>
					</c:if>
										
					<c:if test="${m.memo_color=='blue'}"> <!-- 종이색을 파랑으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/bluePost_it.png'); ">
							<div class="titleBox">${m.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${m.memo_color=='lightGreen'}"> <!-- 종이색을 연두으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/lightGreenPost_it.png');">
							<div class="titleBox">${m.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${m.memo_color=='turquoise'}"> <!-- 종이색을 청록색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/turquoisePost_it.png');">
							<div class="titleBox">${m.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${m.memo_color=='orange'}"> <!-- 종이색을 오렌지색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/orangePost_it.png');">
							<div class="titleBox">${m.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${m.memo_color=='pink'}"> <!-- 종이색을 핑크색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/pinkPost_it.png');">
							<div class="titleBox">${m.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${m.memo_color=='violet'}"> <!-- 종이색을 보라색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/violetPost_it.png');">
							<div class="titleBox">${m.memo_title}</div>
						</div>
					</c:if>
					
					<c:if test="${m.memo_color=='whiteBlue'}"> <!-- 종이색을 하늘색으로 선택했을경우 -->
						<div class="post_it" style="background-image: url('./resources/images/whiteBluePost_it.png');">
							<div class="titleBox">${m.memo_title}</div>
						</div>
					</c:if>
					
					</a>
					</div>
				</c:forEach>
				
			</div>

		</div>
		
		<% if(id!=null){ %>
		<a href="community_cont">
			<div class="createNote"><i class="fa-solid fa-pen-to-square"></i></div>
		</a>
		<% }%>
		
	</div>
	<script src="resources/js/community.js?ver=1"></script>
</body>
</html>