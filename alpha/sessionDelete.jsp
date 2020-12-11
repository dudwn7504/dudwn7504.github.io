<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션삭제</title>
</head>
<body>
<%
session.invalidate();
%>
<script>
location.href = "index.jsp";
</script>
</body>
</html>