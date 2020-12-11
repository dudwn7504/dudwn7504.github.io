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
<title>로그인 처리</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;
String dbPw = "";

String custid = request.getParameter("custid");
String pw = request.getParameter("pw");

try {
	con = DBcon.getConnection();
	String sql = "select pw from custom_tbl where custid=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custid"));
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		dbPw = rs.getString("pw");
		if(dbPw.equals(pw)) {
			System.out.println("로그인 성공!");
			session.setAttribute("custid", custid);
			%>
			<script>
			alert("환영합니다 <%=custid%>님!");
			location.href = "index.jsp";
			</script>
			<%
		} else {
			System.out.println("패스워드가 일치하지 않습니다.");
			%>
			<script>
			alert("패스워드가 일치하지 않습니다.");
			location.href = "login.jsp";
			</script>
			<%
		}
	} else {
		System.out.println("존재하는 아이디가 없습니다.");
		%>
		<script>
		alert("존재하는 아이디가 없습니다.");
		location.href = "login.jsp";
		</script>
		<%
	}
} catch(Exception e) {
	System.out.println("DB Connection error :"+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	} catch(Exception e) {
		System.out.println("DB Close error : "+e);
	}
}
%>
</body>
</html>