<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="header.jsp" %>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" href="resources/css/myinfo_style.css">

</head>
<body>

	<div class="bodyContainer">
	
		<div class="myinfoContainer">
			<div class="tmp">
				<div class="menuBar">
					<div class="menuBox b1">
						<i class="fa-solid fa-circle-user"></i>
					</div>
					<div class="menuBox b2">
						<i class="fa-solid fa-lock"></i>
					</div>
					<div class="menuBox b3"></div>
					<div class="menuBox b4"></div>
				</div>
				
				
				
				<div class="infoBar">
					<form class="infoBox i1" action="updateProfile_ok" method="post"> <!-- 내 프로필 공간 -->
						<div class="profileContainer">
						
							<div class="profileImage"></div>
							<div class="btnBox">
							<input type="button" class="infoBtn ib1" value="사진변경">
							<input type="button" class="infoBtn ib2" value="편집">
							<input type="button" class="infoBtn ib3" value="삭제">
							</div>
						</div>
						
						<div class="nicknameBox">
							<div class="question">
								<span>별 명</span>
							</div>
							<div class="nickname">
								<input type="text" name="user_nickname" value="${user_nickname}" class="nick">
							</div>
						</div>
						
						<div class="checkBox">
							<input class="sub" type="submit" value="적용">
							<input class="can" type="button" value="취소">
						</div>
					
					</form> <!-- 프로필 사진 공간 끝 -->	
					
					
										
				</div>
					
				</div>
			</div>
		</div>
	
</body>
</html>