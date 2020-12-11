<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="alpha.DBcon" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CS·문의 등록 처리</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;

String custid, qtit, author, qcon, wdate;

try {
	con = DBcon.getConnection();
	String sql = "insert into qna_tbl values(qna_seq.nextval, ?, ?, ?, ?, ?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custid"));
	pstmt.setString(2, request.getParameter("author"));
	pstmt.setString(3, request.getParameter("qtit"));
	pstmt.setString(4, request.getParameter("qcon"));
	pstmt.setString(5, request.getParameter("wdate"));
	rs = pstmt.executeQuery();
} catch(Exception e) {
	System.out.println("DB Connection error : "+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
		System.out.println("문의글이 정상적으로 등록되었습니다.");
		%>
		<script>
		alert("문의글이 정상적으로 작성되었습니다.");
		location.href = "qnaList.jsp";
		</script>
		<%
	} catch(Exception e) {
		System.out.println("DB Close error : "+e);
	}
}
%>
</body>
</html>