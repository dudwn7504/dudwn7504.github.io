<%@ page import="java.sql.PreparedStatement" %>
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CS·문의 삭제 처리</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;
String qnum;

try {
	con = DBcon.getConnection();
	String sql = "delete from qna_tbl where qnum=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("qnum"));
	rs = pstmt.executeQuery();
} catch(Exception e) {
	System.out.println("DB Connection error : "+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
		System.out.println("해당글의 삭제가 완료되었습니다.");
		%>
		<script>
		alert("해당글의 삭제가 완료되었습니다.");
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