<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>
 <script src="resources/js/jquery.js"></script>
 <script src="resources/js/header.js"></script>
 <% 
 	Object obj_id= session.getAttribute("id");
 	String id = (String)obj_id;
 	Object obj_nick= session.getAttribute("nick");
 	String nick = (String)obj_nick;
 %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>

	<div class="Bar">
	
		<div class="home">
			<h1 class="logo">
				<a href="/BBS/"><i class="fa-solid fa-house-chimney"></i></a>
			</h1>
		</div>
		
		
		<div class="leftBar" onclick="menu_click()"><!-- 왼쪽 메뉴 -->
				<span class="icon"><i class="fa-solid fa-bars"></i></span>
				<span>메뉴</span>
		</div>
			

		<div class="rightBar"><!-- 오른쪽 로그인겸 회원가입 -->
		<% if(nick == null){%>
			<div class="loginBox">
				<a href="login" class="loginBtn">
					로그인 
				</a>
			</div>
			<div class="space">|</div>
			<div class="registerBox">
				<a href="register" class="registerBtn">
					회원가입
				</a>
			</div>
			<%}else{ %>
			
			<div  style="padding : 9.5px 0; margin-right: 10px;">
			<div class="welcome" style="border-radius: 23px; border: 2px solid #17191d; width: 120px; height: 47px; line-height: 45px; padding: 0 10px; 
			" onclick="openBox()"> 
				<span style="font:18px bold;font-weight: 600;"><%=nick%> &nbsp;</span>
				<i class="fa-solid fa-caret-down"></i>
			</div>
			</div>
			<%} %>
		</div>
		
		<div class="myPlaceBox">
			<div class="h_closeBox" onclick="closeBox()">
				<i class="fa-solid fa-caret-up"></i>
			</div>
				<div class="profileBox">
				<c:if test="${!empty ulist}">
				<c:forEach var="u" items="${ulist}">
				<c:choose>
					<c:when test="${u.user_profile == null}">
						<div class="profile"><div class="myImage"><img src="" ></div></div>
					</c:when>
					<c:otherwise>
						<div class="profile"><div class="myImage"><img src="./resources/uploadUserProfile${u.user_profile}" ></div></div>
					</c:otherwise>					
				</c:choose>
				</c:forEach>
				</c:if>
					<div class="goto">
						<div class="myinfoBox">
						<a href="myinfo"><button class="myinfo"  onclick="closeBox()">내정보</button></a>
						</div>
						<div class="logoutBox">
						<a href="logout"><button class="logout" onclick="closeBox()">로그아웃</button></a>
						</div>
					</div>
			
				
			</div>
			
			
		</div>
		
		<div class="leftBar_menu">
			
			<div class="cancleBox">
				<span class="cancle" onclick="menu_close()"><i class="fa-sharp fa-solid fa-xmark"></i></span>
			</div>
			
			<%if(id==null){ %>
			<div class="menuContainer">
				<ul>
					<li><a href="community">정보공유</a></li>
					<li><a href="announcement">공지사항</a></li>
					<li><a href="qna">QNA</a></li>
				</ul>
			</div>
			<div class="spaceDiv"></div>
			<%}else{ %>
			
			<% if(id.equals("admin")) {%>
			<div class="communityControll">
				<ul>
					<li><a href="cmControl">커뮤니티 게시판 관리</a></li>
					<li><a href="noticeControl">공지사항 게시판</a></li>
					<li><a href="#">QNA 게시판</a></li>
				</ul>
			</div>
			<div class="spaceDiv"></div>
			<div class="memberControll">
				<ul>
					<li><a href="#">회원 관리</a></li>
					
				</ul>
			</div>
			<%}else{ %>
			<div class="menuContainer">
				<ul>
					<li><a href="community">정보공유</a></li>
					<li><a href="announcement">공지사항</a></li>
					<li><a href="qna">QNA</a></li>
				</ul>
			</div>
			<div class="spaceDiv"></div>
			
			<div class="mypage">
				<ul>
					<li><a href="myPlace">나의 메모장</a></li>
					<li><a href="myinfo">내정보</a></li>
				</ul>
			</div>
			<%}} %>
		</div>
		
	</div>
	<script type="text/javascript" src="resources/js/menu.js"></script>
</html>