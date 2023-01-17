<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판 관리페이지</title>
<link rel="stylesheet" href="./resources/css/adminPage/noticeControlPage_style.css">
</head>
<body>
	<div id="overlay"></div>
	<div class="noticeControlContainer">
		
		<div class="noticeControlTitle"> 
		<i class="fa-solid fa-circle"></i>
		<span class="titleBox">공지사항 관리</span>
		</div>
		<div class="viewAndAddBox">
			<span>게시물 수 : ${count} </span>
			<a href="updateNotice">
				<input type="button" value="공지사항 추가">
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
					<td>공지사항</td>
					<td>${n.notice_viewcnt}</td>
					<td>${n.notice_update}</td>
					<td>${n.notice_modifyDate}</td>
					<td><button>delete</button></td>
				</tr>
				</c:forEach>
				
				
			</tbody>
		</table>
	</div>	
	
</body>
</html>