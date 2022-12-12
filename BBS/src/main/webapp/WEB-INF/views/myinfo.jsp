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
	<div id="overlay"></div>
	<div id="overlay2"></div>
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
					<div class="menuBox b3">
						<i class="fa-solid fa-user-gear"></i>
					</div>		
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
							<div class="profileImage"><img src="./resources/uploadUserProfile${u.user_profile}" class="proImg" name="andante"></div>
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
							<input class="sub s1" type="submit" value="적용"  disabled>
							<input class="can c1" type="button" value="취소">
						</div>
					
					</form> <!-- 프로필 사진 공간 끝 -->

					<form class="infoBox i2" action="updateInfo_ok" method="post" onsubmit="return apply2();">
						<div class="int_box">
						
						<div class="titleBox">
							<p>회원정보</p>
						</div>
						
						<div class="doguBox">
							<span class="edit" onclick="edit()"><i class="fa-solid fa-pen-to-square"></i></span>		
						</div>
						
						<c:if test="${!empty ulist}">
						<c:forEach var="u" items="${ulist}">
											
						<div class="int_area">
							<i class="fa-solid fa-envelope"></i> 
							<input type="text" name="user_email" id="user_email" value="${u.user_email}" autocomplete="off" placeholder="Email" readonly>
						</div>
						
						<div class="int_area">
							<i class="fa-solid fa-mobile-screen"></i>
							<input type="text" name="user_phoneNum" id="user_phoneNum"  value="${u.user_phoneNum}" autocomplete="off" placeholder="Phone" readonly>
						</div>
						</c:forEach>
						</c:if>

						<div class="int_area">
							<i class="fa-solid fa-lock"></i> 
							<input type="password" name="user_pwd" id="user_pwd" autocomplete="off" placeholder="Password" readonly>
						</div>

						<div class="int_area">
							<i class="fa-solid fa-lock"></i> 
							<input type="password" name="user_pwConfirm" id="user_pwConfirm" autocomplete="off" placeholder="Pwd_Confirm" readonly>
						</div>
						</div>
						
						<div class="checkBox">
							<input class="sub s2" type="submit" value="적용"  disabled>
							<input class="can c2" type="button" value="취소">
						</div>
					</form>
					
					<div class="infoBox i3">
						<div class="int_box">
						
						<div class="titleBox tb3">
							<p>내정보관리</p>
						</div>
						
						<div class="nicknameBox n3">
							<div class="question q3">
								<span>내가 쓴 글</span>
							</div>
							<div class="nickname nn3">
								<a href="myPlace" class="goMypage">나의 메모장 이동</a>
							</div>
						</div>
						
						<div class="nicknameBox n3">
							<div class="question q3">
								<span>회원탈퇴</span>
							</div>
							<div class="nickname nn3">
								<input type="button" class="withdrawal" value="회원 탈퇴하기" onclick="modal_open()">
							</div>
						</div>
						
						</div>
					</div>
				</div>
					
				</div>
			</div>
			
			<div class="modal">
				<div class="contents">
					<h2>회원 탈퇴</h2>
					<span class="cancleModal" onclick="modal_close()"><i class="fa-sharp fa-solid fa-xmark"></i></span>
				</div>
				<div class="warnningBox">
					<p>회원탈퇴시 개인정보가 모두 말소됩니다. 탈퇴하시겠습니까?</p>
				</div>
				<div class="modalInputBox">
				<div class="inputContainer">
					<span>비밀번호 확인</span>
					<input type="password" name="user_pwd" id="modal_pwd">
					<button class="modalBtn">확인</button>
				</div>
				</div>
			
			</div>
			
			
		</div>
		
	
</body>
</html>