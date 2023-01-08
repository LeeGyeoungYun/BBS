<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/announcement_style.css">
<title>공지사항</title>
</head>
<body class="batang">
	<div id="overlay"></div>
	
	<div class="noticeContainer">
		
		<ul class="noticeTab">
			<li class="tab t1"><a  href="#all">전체</a></li>
			<li class="tab t2 active"><a  href="#notice">공지사항</a></li>
			<li class="tab t3"><a  href="#qna">QnA</a></li>
		</ul>
		
		<div class="tabDiv">
			<div class="td td1"> td1
			</div>
			<div class="td td2 active" > td2
			</div>
			<div class="td td3" > td3
			</div>	
		</div>
	</div>

	<script src="./resources/js/announcement.js"></script>
</body>
</html>