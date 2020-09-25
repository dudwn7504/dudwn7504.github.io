<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*,gilbut.*"
%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style>
	section {width:1280px; margin:0 auto;}
</style>
</head>
<body>
<jsp:include page="header_login.jsp"/>
<jsp:include page="content.jsp"/>
<jsp:include page="footer.jsp"/>
</body>
</html>