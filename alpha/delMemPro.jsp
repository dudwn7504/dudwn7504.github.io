<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="alpha.DBcon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
request.setCharacterEncoding("utf-8");
String custid = (String)session.getAttribute("custid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴처리</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;
try {
	con = DBcon.getConnection();
	String sql = "delete from custom_tbl where custid=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, custid);
	rs = pstmt.executeQuery();
} catch(Exception e) {
	System.out.println("DB Connection error : "+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
		System.out.println("회원탈퇴가 성공적으로 이루어졌습니다.");
		%>
		<script>
		alert("회원탈퇴가 성공적으로 이루어졌습니다.");
		location.href = "sessionDelete.jsp";
		</script>
		<%
	} catch(Exception e) {
		System.out.println("DB Close error : "+e);
	}
}
%>
</body>
</html>