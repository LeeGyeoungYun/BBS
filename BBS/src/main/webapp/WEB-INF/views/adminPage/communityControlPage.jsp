<%@ page contentType="text/html; charset=UTF-8"%>
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
		
		<div class="cmControlTitle"> 게시물 관리
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
				
				
			</tbody>
		</table>
	</div>
</body>
</html>