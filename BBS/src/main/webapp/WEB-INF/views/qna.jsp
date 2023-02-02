<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/announcement_style.css">
<title>QnA</title>
</head>
<body class="batang">
	<input type="hidden" name="count" class="count" value="${count}">
	<input type="hidden" name="page" class="page" value="${page}">
	<div id="overlay"></div>
	
	<div class="noticeContainer">
		
		<ul class="noticeTab">
			<li class="tab t1"><a  href="allNotice">전체</a></li>
			<li class="tab t2"><a  href="announcement">공지사항</a></li>
			<li class="tab t3 active"><a  href="qna">QnA</a></li>
		</ul>
		
		<div class="tabDiv">
			<div class="td td1"> </div>
			<div class="td td2" > td2
			</div>
			<div class="td td3 active">
				<ul>
					<li class="noticeBox noticeTitle">
						<span>그룹명</span>
						<span>작성자</span>
						<span class="title">제목</span>
						<span>작성일</span>
					</li>
					<c:forEach var="q" items="${qlist}">
					<li class="noticeBox">
						<span class="kind">QNA</span>
						<span class="writer">관리자</span>
						<span class="title">${q.notice_title}</span>
						<span class="date">${q.notice_update}</span> 
					</li>
					</c:forEach>
					
					
					
				</ul>
				 
				<div class="pageContainer">
					<a href="qna?page=${page-1}">
						<button class="goPage back">이전</button>
					</a>
					<span class="nowPage"> ${page} </span>
					<a href="qna?page=${page+1}">
						<button class="goPage next">다음</button>
					</a>
				</div>
			
			</div>	
		</div>
	</div>

	<script src="./resources/js/announcement.js"></script>
</body>
</html>