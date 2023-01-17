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
	<div id="overlay"></div>
	<div class="cmControlContainer">
		
		<div class="cmControlTitle"> 
		<i class="fa-solid fa-circle"></i>
		<span class="titleBox">게시물 관리</span>
		</div>
		<div class="viewAndAddBox">
			<span>게시물 수 : </span>
			<input type="button" value="게시판 추가">
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
				<tr>
					<td>1</td>
					<td>asd</td>
					<td>title</td>
					<td>color</td>
					<td>1</td>
					<td>date</td>
					<td>date</td>
					<td><button>delete</button></td>
				</tr>
				
				<c:forEach var="c" items="${clist}">
					<td>${c.mno}</td>
					<td>asd</td>
					<td>title</td>
					<td>color</td>
					<td>1</td>
					<td>date</td>
					<td>date</td>
					<td>
						<button>수정</button>
						<button>삭제</button>
					</td>
				</c:forEach>
					
			</tbody>
		</table>
	</div>
</body>
</html>