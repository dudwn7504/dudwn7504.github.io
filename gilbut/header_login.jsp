<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*,gilbut.*"
%>
<%
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="header.css" />
<meta charset="UTF-8">
<title>헤더</title>
</head>
<body>
	<wrap>
		<section class="hd_top_box">
			<div class="hd_top">
				<div class="hd_top_left">
					<ul>
						<li>|<a class="log" href="qnaList.jsp">1:1문의</a>|</li>
					</ul>
				</div>
				<div class="hd_top_right">
					<ul>
						<li><a class="log" href="#">환영합니다 <%=id %>님</a>|</li><li><a class="log" href="userInfo.jsp">내정보조회</a>|</li>
						<li><a class="log" href="index.jsp">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</section>
		
		<div class="hd_nav">
			<a class="go_home" href="index_login.jsp">길벗·이지톡</a>
			<ul class="menu_list">
				<li><a href="#" class="menu">도서</a></li>
				<li><a href="#" class="menu">추천</a></li>
				<li><a href="#" class="menu">북맵</a></li>
				<li><a href="#" class="menu">동영상 강좌</a></li>
				<li><a href="#" class="menu">고객센터</a></li>
			</ul>
		</div>
	</wrap>
</body>
</html>