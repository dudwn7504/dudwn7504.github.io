<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin_header.css" />
<link rel="stylesheet" href="./css/admin_footer.css"/>
<link rel="stylesheet" href="./css/admin_content.css"/>
<title>관리자모드로 로그인중</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<%
	session.setAttribute("id", "admin");	//캡처할때는 이부분 지우기
%>
<%
	if (session.getAttribute("id") != "admin") {
%>
<script>
	alert("관리자로 하지 않았습니다. 현재 페이지는 관리자의 로그인이 필요합니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	$(document).ready(function(){
	var txt = $(".page_tit").text();
	alert("현재는 "+txt+" 화면입니다.");
	});
</script>
<%
	}
%>
</head>
<body>
	<header class="hd">
		<h2 class="tit"><a href="admin.jsp">길벗 관리자 화면</a></h2>
		<nav class="gnb">
			<ul>
				<li><a href="memberlist.jsp">회원관리</a></li>
				<li><a href="faqlist.jsp">FAQ관리</a></li>
				<li><a href=answerlist.jsp">1:1문의 관리</a></li>
				<li><a href="eventlist.jsp">이벤트·설문·모집관리</a></li>
				<li><a href="booklist.jsp">도서관리</a></li>
				<li><a href="eduvideolist.jsp">동영상강좌 관리</a></li>
			</ul>
			<div class="btn_fr">
				<a href="admin_logout.jsp" class="btn">관리자 로그아웃</a>
			</div>
		</nav>
	</header>
	<hr />