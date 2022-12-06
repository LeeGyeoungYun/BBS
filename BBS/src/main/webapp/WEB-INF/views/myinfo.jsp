<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link rel="stylesheet" href="resources/css/myinfo_style.css?ver=1">
<script src="resources/js/myinfo.js?ver=1"></script>

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
					<form class="infoBox i1" action="updateProfile_ok" method="post" onsubmit="return apply();" enctype="multipart/form-data"> <!-- 내 프로필 공간 -->
						<div class="profileContainer">
						<c:if test="${!empty ulist}">
						<c:forEach var="u" items="${ulist}">
						<c:choose>
							<c:when test="${u.user_profile ==null} ">
							<div class="profileImage"><img src="" class="proImg"></div>
							</c:when>
							<c:otherwise>
							<div class="profileImage"><img src="./resources/uploadUserProfile${u.user_profile}" class="proImg"></div>
							</c:otherwise>
						</c:choose>
																	
							<div class="btnBox">
							<input type="button" class="infoBtn ib1"  disabled="disabled" value="사진변경">
							<input type="file" name="user_profile" class="chooseFile" accept=".jpg, .jpeg, .png, .JPG" style="display:none;">
							<input type="button" class="infoBtn ib2" value="편집" onclick="unlock()">
							<input type="button" class="infoBtn ib3"  disabled="disabled" value="삭제">
							</div>
						</div>
						
						<div class="nicknameBox">
							<div class="question">
								<span>별 명</span>
							</div>
							<div class="nickname">
								<input type="text" name="user_nickname" value="${u.user_nickname}" class="nick" readonly>
							</div>
						</div>
						</c:forEach>
					</c:if>
						
						<div class="checkBox">
							<input class="sub" type="submit" value="적용"  disabled>
							<input class="can" type="button" value="취소">
						</div>
					
					</form> <!-- 프로필 사진 공간 끝 -->

					<form class="infoBox i2" action="updateInfo_ok" method="post">
						<div class="int_box">
						
						<div class="int_area">
							<p>회원정보</p>
						</div>
						
						<div class="int_area">
							<i class="fa-solid fa-envelope"></i> 
							<input type="text" name="user_email" id="user_email" autocomplete="off" placeholder="Email" required>
						</div>

						<div class="int_area">
							<i class="fa-solid fa-lock"></i> 
							<input type="password" name="user_pwd" id="user_pwd" autocomplete="off" placeholder="Password" required>
						</div>

						<div class="int_area">
							<i class="fa-solid fa-lock"></i> 
							<input type="password" name="user_pwConfirm" id="user_pwConfirm" autocomplete="off" placeholder="Pwd_Confirm" required>
						</div>
						</div>
					</form>

				</div>
					
				</div>
			</div>
		</div>
		
	
</body>
</html>