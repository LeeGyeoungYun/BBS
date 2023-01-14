<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판 관리페이지</title>
<link rel="stylesheet" href="./resources/css/adminPage/noticeControlPage_style.css">
</head>
<body>
	<div id="overlay"></div>
	<div class="noticeControlContainer">
		
		<div class="noticeControlTitle"> 
		<i class="fa-solid fa-circle"></i>
		<span class="titleBox">공지사항 관리</span>
		</div>
		<div class="viewAndAddBox">
			<span>게시물 수 : </span>
			<a href="updateNotice">
				<input type="button" value="게시판 추가">
			</a>
		</div>
		<table>
			<thead>
				<tr>
					<th>게시물 번호</th>
					<th>작성자</th>
					<th>게시물 제목</th>
					<th>게시물 분류</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>관리자</td>
					<td>title</td>
					<td>공지사항</td>
					<td>1</td>
					<td>date</td>
					<td>date</td>
					<td><button>delete</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>관리자</td>
					<td>title</td>
					<td>공지사항</td>
					<td>1</td>
					<td>date</td>
					<td>date</td>
					<td><button>delete</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>관리자</td>
					<td>title</td>
					<td>공지사항</td>
					<td>1</td>
					<td>date</td>
					<td>date</td>
					<td><button>delete</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>관리자</td>
					<td>title</td>
					<td>공지사항</td>
					<td>1</td>
					<td>date</td>
					<td>date</td>
					<td><button>delete</button></td>
				</tr>
				<tr>
					<td>1</td>
					<td>관리자</td>
					<td>titleㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ</td>
					<td>공지사항</td>
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