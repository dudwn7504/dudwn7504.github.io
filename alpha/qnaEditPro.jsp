<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="alpha.DBcon" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
request.setCharacterEncoding("utf-8");
Date nowDate = new Date();
SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CS·문의 수정 처리</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;
String qnum = request.getParameter("qnum");
String wdate = fm.format(nowDate);
try {
	con = DBcon.getConnection();
	String sql = "update qna_tbl set";
	sql += " qcon=?, wdate=? where qnum=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("qcon"));
	pstmt.setString(2, wdate);
	pstmt.setString(3, qnum);
	rs = pstmt.executeQuery();
	
} catch(Exception e) {
	System.out.println("DB Connection error : "+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
		System.out.println("CS·문의 수정처리가 성공적으로 이루어졌습니다.");
		%>
		<script>
		alert("CS·문의 수정처리가 성공적으로 이루어졌습니다.");
		location.href = "qnaView.jsp?qnum=<%=qnum%>";
		</script>
		<%
	} catch(Exception e) {
		System.out.println("DB Close error : "+e);
	}
}
%>
</body>
</html>