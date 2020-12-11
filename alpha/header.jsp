<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>Home</title>
<link rel='stylesheet' href='<c:url value="./css/style1.css"/>'/>
<link rel='stylesheet' href='<c:url value="./css/alpha_join.css"/>'/>
<link rel='stylesheet' href='<c:url value="./css/alpha_login.css"/>'/>
<script src='<c:url value="./js/jquery.js" />'></script>
<script src='<c:url value="./js/banner.js" />'></script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String custid = (String)session.getAttribute("custid");
%>
<header class="header">
	<div class="back">
		<div class="hd">
			<a href="index.jsp" class="logo"></a>
			<input type="checkbox" id="ck1" class="ck"/>
			<label for="ck1" id="menu_btn" class="mob">
				<span class="bar1"></span>
				<span class="bar2"></span>
				<span class="bar3"></span>
			</label>
			<a href="/" id="home_btn" class="mob">
				<span class="home_bg"></span>
			</a>
			<div class="nav_fr" id="menu">
			<%
			if(custid == null) {
			%>
				<nav id="tnbb">
					<ul class="tnav">
						<li><a href="./login.jsp">로그인 &nbsp;&nbsp;|</a></li>
						<li><a href="./join.jsp">회원가입 &nbsp;&nbsp;|</a></li>
						<li><a href="map">오시는 길</a></li>
					</ul>
				</nav>
			<% 
			} else {
			%>
				<nav class="tnbl">
				<ul>
					<li><a href="qnaList.jsp">|&nbsp; CS·문의&nbsp; |</a></li>
					<li><a href="map">&nbsp;&nbsp;오시는 길&nbsp; |</a></li>
				</ul>
			</nav>
			<nav id="tnb">
				<ul class="tnav">
					<li><a href="">환영합니다 <%=custid %> 님 &nbsp;&nbsp;|</a></li>
					<li><a href="memberInfo.jsp">내정보조회·수정 &nbsp;&nbsp;|</a></li>
					<li><a href="logout.jsp">로그아웃 &nbsp;&nbsp;|</a></li>
				</ul>
			</nav>
			<%
			}
			%>
				<nav id="gnb">
					<ul class="nav">
						<li><a style="padding-bottom:5px;" href="/sub1">회사소개</a>
							<ul class="sub" style="height:150px;">
								<li><a href="">회사소개</a></li>
								<li><a href="">오시는 길</a></li>
								<li><a href="">연혁</a></li>
							</ul>
						</li>
						<li><a style="padding-bottom:5px;" href="/sub2">제품소개</a>
							<ul class="sub" style="height:400px;">
								<li><a href="">아크릴물감</a></li>
								<li><a href="">보조제</a></li>
								<li><a href="">포스터칼라</a></li>
								<li><a href="">수채화</a></li>
								<li><a href="">한국화물감</a></li>
								<li><a href="">마커</a></li>
								<li><a href="">염색물감</a></li>
								<li><a href="">기타화구</a></li>
							</ul>
						</li>
						<li style="width:200px;"><a style="padding-bottom:5px;" href="/sub3">서비스</a>
							<ul class="sub3" style="height:200px;">
								<li><a href="">온라인 상담 서비스</a></li>
								<li><a href="">원격 상담 서비스</a></li>
								<li><a href="">전화 상담 서비스</a></li>
								<li><a href="">문자 상담 서비스</a></li>
							</ul>
						</li>
						<li><a style="padding-bottom:5px;" href="/sub4">고객센터</a>
							<ul class="sub" style="height:150px;">
								<li><a href="">공지사항</a></li>
								<li><a href="">자주하는 질문</a></li>
								<li><a href="">제품후기</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</header>
