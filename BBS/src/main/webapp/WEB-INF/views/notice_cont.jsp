<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${no.nno}번째 공지사항&QNA 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice_cont_style.css">

</head>
<body>
	<div id="overlay"></div>
	<div class="updateNoticeContainer">
	
	<table>
		<input type="hidden" name="nno" value="${no.nno}"><!-- 현재 게시물번호를 컨트롤러에 보내기 위한 것 -->
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
					<th>조회수</th>
					<td>${no.notice_viewcnt}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td class="contentTd"><input type="text" name="notice_title" class="titlebox" value="${no.notice_title}" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="contentTd">
					<textarea name="notice_cont" class="notice_cont" readonly>${no.notice_cont}</textarea>
				</td>
			</tr>
			
		</tbody>
	
	</table>
	

	</div>
	
</body>
</html>