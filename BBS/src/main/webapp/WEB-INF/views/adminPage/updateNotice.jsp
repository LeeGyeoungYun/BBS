<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 추가</title>
<link rel="stylesheet" href="./resources/css/adminPage/updateNotice_style.css">
</head>
<body>
	<div id="overlay"></div>
	<div class="updateNoticeContainer">
	
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
						<span class="spanbox"><input type="checkbox" class="checkType c1"> 공지사항 </span>
						<span class="spanbox"><input type="checkbox" class="checkType c2"> QNA </span>
				
					</td>
			</tr>
		</tbody>
	
	</table>
	
	</div>
</body>
</html>