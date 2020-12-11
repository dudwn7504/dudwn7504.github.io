<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="alpha.DBcon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 처리</title>
<%
request.setCharacterEncoding("utf-8");
String custid = (String)session.getAttribute("custid");
%>
</head>
<body>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;


try {
	con = DBcon.getConnection();
	String sql = "update custom_tbl set";
	sql += " pw=?, author=?, phone=?, email=?, area=? where custid=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("pw"));
	pstmt.setString(2, request.getParameter("author"));
	pstmt.setString(3, request.getParameter("phone"));
	pstmt.setString(4, request.getParameter("email"));
	pstmt.setString(5, request.getParameter("area"));
	pstmt.setString(6, custid);
	rs = pstmt.executeQuery();
} catch(Exception e) {
	System.out.println("DB Connection error : "+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
		%>
		<script>
		alert("회원정보수정이 정상적으로 이루어졌습니다.");
		</script>
		<%
	} catch(Exception e) {
		System.out.println("DB Close error : "+e);
	}
}
%>
<script>
location.href = "memberInfo.jsp";
</script>
</body>
</html>