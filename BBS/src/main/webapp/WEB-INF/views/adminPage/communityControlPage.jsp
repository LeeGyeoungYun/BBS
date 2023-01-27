<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판 관리페이지</title>
<link rel="stylesheet" href="./resources/css/adminPage/communityControlPage_style.css">
</head>
<body>
	<input type="hidden" name="count" class="count" value="${count}">
	<input type="hidden" name="page" class="page" value="${page}">
	<div id="overlay"></div>
	<div class="cmControlContainer">
		
		<div class="cmControlTitle"> 
		<i class="fa-solid fa-circle"></i>
		<span class="titleBox">게시물 관리</span>
		</div>
		<div class="viewAndAddBox">
			<span>게시물 수 : ${totalCount} </span>
			<a href="community_cont">
				<input class="boardBtn" type="button" value="게시판 추가">
			</a>
		</div>
		<table>
			<thead>
				<tr>
					<th>게시물 번호</th>
					<th>작성자</th>
					<th>게시물 제목</th>
					<th>게시물 색상</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody>
		
				<c:forEach var="c" items="${clist}">
				<tr>
					<td>${c.mno}</td>
					<td>${c.user_id}</td>
					<td>${c.memo_title}</td>
					<td>${c.memo_color}</td>
					<td>${c.memo_viewcnt}</td>
					<td>${c.memo_update}</td>
					<td>${c.memo_modifydate}</td>
					<td>
						<a href="cmMemo?mno=${c.mno}&state=modify">
							<button class="boardBtn bb1">수정</button>
						</a>
						<a href="cmMemo?mno=${c.mno}&state=delete">
							<button class="boardBtn bb2">삭제</button>
						</a>
					</td>
				</tr>
				</c:forEach>
					
			</tbody>
		</table>
		
		<div class="pageContainer">
			<a href="cmControl?page=${page-1}">
				<button class="goPage back">이전</button>
			</a>
			<span class="nowPage"> ${page} </span>
			<a href="cmControl?page=${page+1}">
				<button class="goPage next">다음</button>
			</a>
		</div>
	</div>
	
	<script src="./resources/js/communityControlPage.js"></script>
</body>
</html>