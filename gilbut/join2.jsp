<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,gilbut.*"
    %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입을 축하합니다.</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<form action="" align="center">
		<h3><%=id %> 님 회원가입을 축하합니다!</h3>
		<p>로그인을 해주세요</p>
		<a href="login.jsp"><input type="button" value="로그인하기" /></a>
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>