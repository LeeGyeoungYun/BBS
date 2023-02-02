<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/announcement_style.css">
<title>전체 공지사항</title>
</head>
<body class="batang">
	<input type="hidden" name="count" class="count" value="${count}">
	<input type="hidden" name="page" class="page" value="${page}">
	<div id="overlay"></div>
	
	<div class="noticeContainer">
		
		<ul class="noticeTab">
			<li class="tab t1 active"><a  href="allNotice">전체</a></li>
			<li class="tab t2"><a  href="announcement">공지사항</a></li>
			<li class="tab t3"><a  href="qna">QnA</a></li>
		</ul>
		
		<div class="tabDiv">
			<div class="td td1 active"> 
				<ul>
					<li class="noticeBox noticeTitle">
						<span>그룹명</span>
						<span>작성자</span>
						<span class="title">제목</span>
						<span>작성일</span>
					</li>
					<c:forEach var="a" items="${alist}">
					<a href="allNotice/Notice?nno=${a.nno}">
					<li class="noticeBox">
						<span class="kind">
							<c:if test="${a.notice_kind=='Notice'}">공지사항</c:if>
							<c:if test="${a.notice_kind=='QNA'}">QNA</c:if>
						</span>
						<span class="writer">관리자</span>
						<span class="title">${a.notice_title}</span>
						<span class="date">${a.notice_update}</span> 
					</li>
					</a>
					</c:forEach>
					
					
					
				</ul>
				 
				<div class="pageContainer">
					<a href="allNotice?page=${page-1}">
						<button class="goPage back">이전</button>
					</a>
					<span class="nowPage"> ${page} </span>
					<a href="allNotice?page=${page+1}">
						<button class="goPage next">다음</button>
					</a>
				</div>
				
			</div>
			<div class="td td2" > td2
			</div>
			<div class="td td3" > td3
			</div>	
		</div>
	</div>

	<script src="./resources/js/announcement.js"></script>
</body>
</html>