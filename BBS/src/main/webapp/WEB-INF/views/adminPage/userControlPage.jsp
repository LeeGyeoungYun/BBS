<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 관리페이지</title>
<link rel="stylesheet" href="./resources/css/adminPage/userControlPage_style.css">
</head>
<body>
	<input type="hidden" name="count" class="count" value="${count}">
	<input type="hidden" name="page" class="page" value="${page}">
	
	<div id="overlay"></div>
	<div class="noticeControlContainer">
		
		<div class="noticeControlTitle"> 
		<i class="fa-solid fa-circle"></i>
		<span class="titleBox">유저 관리</span>
		</div>
		<div class="viewAndAddBox">
			<span>유저 수 : ${totalCount} </span>
		</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>휴대폰 번호</th>
					<th>이메일</th>
					<th>게시물 수</th>
					<th>생성일</th>
					<th>수정일</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach var="u" items="${ctlist}">
				
				<tr>
				
					<th>${u.num}</th>
					<th>${u.user_id}</th>
					<th>${u.user_nickname}</th>
					<th>${u.user_phoneNum}</th>
					<th>${u.user_email}</th>
					<th>${u.post}</th>
					<th>${u.user_joinDate}</th>
					<th>${u.user_modifyDate}</th>
					<th>
					<input type="hidden" class="userId" value="${u.user_id}">					
					<c:if test="${!u.user_id.equals('admin')}">
						<button data-user-id="${u.user_id}" type="button" class="boardBtn bb2" onclick="aa(this)">회원탈퇴</button>
					</c:if>					
					</th>
				
				</tr>
			
				</c:forEach>
				
				
			</tbody>
		</table>
		
		<div class="pageContainer">
			<a href="userControl?page=${page-1}">
				<button class="goPage back">이전</button>
			</a>
			<span class="nowPage"> ${page} </span>
			<a href="userControl?page=${page+1}">
				<button class="goPage next">다음</button>
			</a>
		</div>
	</div>
	
	<script src="resources/js/userControlPage.js"></script>
</body>
</html>