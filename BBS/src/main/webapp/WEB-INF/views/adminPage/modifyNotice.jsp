<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${no.nno}번째 공지사항 수정</title>
<link rel="stylesheet" href="./resources/css/adminPage/updateNotice_style.css">
<script src="./resources/js/jquery.js"></script>
</head>
<body>
	<div id="overlay"></div>
	<div class="updateNoticeContainer">
	<form method="post" action="modifyNotice_ok" onsubmit="return formCheck();">
	<table>
		<input type="hidden" name="nno" value="${no.nno}">
		<tbody>
			<tr>
				<th>작성일</th>
				<td>${no.notice_update}</td>
				<th>작성자</th>
				<td>관리자</td>
			</tr>
			<tr>
				<th>공지유형</th>
					<td>
						<span class="spanbox"><input type="checkbox" name="notice_kind" value="an" <c:if test="${no.notice_kind=='Notice'}">checked="checked"</c:if> onclick="check(this)"> 공지사항 </span>
						<span class="spanbox"><input type="checkbox" name="notice_kind" value="qna" <c:if test="${no.notice_kind=='QNA'}">checked="checked"</c:if> onclick="check(this)"> QNA </span>
				
					</td>
			</tr>
			<tr>
				<th>제목</th>
				<td class="contentTd"><input type="text" name="notice_title" class="titlebox" value="${no.notice_title}" autocomplete="off"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="contentTd">
					<textarea name="notice_cont" class="notice_cont">${no.notice_cont}</textarea>
				</td>
			</tr>
			
		</tbody>
	
	</table>
	
	<div class="choiceBox">
		<input type="button" value="취소" class="choiceBtn cb1">
		<input type="submit" value="수정하기" class="choiceBtn cb2">
	</div>
	</form>
	</div>
	<script src="./resources/js/updateNotice.js"></script>
</body>
</html>