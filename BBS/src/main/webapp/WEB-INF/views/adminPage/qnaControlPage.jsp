<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA게시판 관리페이지</title>
<link rel="stylesheet" href="./resources/css/adminPage/noticeControlPage_style.css">
</head>
<body>
	<input type="hidden" name="count" class="count" value="${count}">
	<input type="hidden" name="page" class="page" value="${page}">
	
	<div id="overlay"></div>
	<div class="noticeControlContainer">
		
		<div class="noticeControlTitle"> 
		<i class="fa-solid fa-circle"></i>
		<span class="titleBox">QNA 관리</span>
		</div>
		<div class="viewAndAddBox">
			<span>게시물 수 : ${count} </span>
			<a href="updateNotice?kind=QNA">
				<input class="boardBtn" type="button" value="질의응답 추가">
			</a>
		</div>
		<table>
			<thead>
				<tr>
					<th>게시물 번호</th>
					<th>작성자</th>
					<th>게시물 제목</th>
					<th>게시물 분류</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach var="n" items="${nlist}">
				<tr>
					<td>${n.nno}</td>
					<td>관리자</td>
					<td>${n.notice_title}</td>
					<td>QNA</td>
					<td>${n.notice_viewcnt}</td>
					<td>${n.notice_update}</td>
					<td>${n.notice_modifyDate}</td>
					<td>
						<a class="go" href="notice?nno=${n.nno}&state=modify">
							<button class="boardBtn bb1" onclick="idcheck()">수정</button>
						</a>
						<a class="go" href="notice?nno=${n.nno}&state=delete">
							<button class="boardBtn bb2" onclick="idcheck()">삭제</button>
						</a>
					</td>
					
				</tr>
				</c:forEach>
				
				
			</tbody>
		</table>
		
		<div class="pageContainer">
			<a href="qnaControl?page=${page-1}">
				<button class="goPage back">이전</button>
			</a>
			<span class="nowPage"> ${page} </span>
			<a href="qnaControl?page=${page+1}">
				<button class="goPage next">다음</button>
			</a>
		</div>
	</div>
	
	<script src="./resources/js/noticeControlPage.js"></script>	
</body>
</html>