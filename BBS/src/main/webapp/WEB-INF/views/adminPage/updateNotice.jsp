<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 추가</title>
<link rel="stylesheet" href="./resources/css/adminPage/updateNotice_style.css">
<script src="./resources/js/jquery.js"></script>
</head>
<body>
	<div id="overlay"></div>
	<div class="updateNoticeContainer">
	<form method="post" action="updateNotice_ok" onsubmit="return formCheck();">
	<table>
		
		<tbody>
			<tr>
				<th>작성일</th>
				<td>2023-01-14</td>
				<th>작성자</th>
				<td>관리자</td>
			</tr>
			<tr>
				<th>공지유형</th>
					<td>
						<span class="spanbox"><input type="checkbox" name="notice_kind" value="an" checked="checked" onclick="check(this)"> 공지사항 </span>
						<span class="spanbox"><input type="checkbox" name="notice_kind" value="qna" onclick="check(this)"> QNA </span>
				
					</td>
			</tr>
			<tr>
				<th>제목</th>
				<td class="contentTd"><input type="text" name="notice_title" class="titlebox" placeholder="제목을 입력해주세요." autocomplete="off"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="contentTd">
					<textarea name="notice_cont" class="notice_cont"></textarea>
				</td>
			</tr>
			
		</tbody>
	
	</table>
	
	<div class="choiceBox">
		<input type="button" value="취소" class="choiceBtn cb1">
		<input type="submit" value="저장하기" class="choiceBtn cb2">
	</div>
	</form>
	</div>
	<script src="./resources/js/updateNotice.js"></script>
</body>
</html>