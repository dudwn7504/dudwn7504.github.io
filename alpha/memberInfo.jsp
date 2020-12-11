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
String custid = (String)session.getAttribute("custid");
%>

<jsp:include page="header.jsp"/>

<form id="memInfoForm"  name="memInfoForm" action="">
	<h2>나의 회원정보</h2>
	<table class="memInfoTb" border="1" >
		<tbody>
		<tr>
			<th>아이디</th>
			<td><%=custid %></td>
		</tr>
	<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	String pw;
	String author;
	String phone;
	String email;
	String area;
	
	try{
		con = DBcon.getConnection();
		String sql = "select pw, author, phone, email, area from custom_tbl where custid=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custid);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			pw = rs.getString("pw");
			author = rs.getString("author");
			phone = rs.getString("phone");
			email = rs.getString("email");
			area = rs.getString("area");
			%>
			<tr>
				<th>패스워드</th>
				<td><%=pw %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=author %></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%=phone %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=email %></td>
			</tr>
			<tr>
				<th>거주지</th>
				<td><%=area %></td>
			</tr>
			<%
		}
	} catch(Exception e) {
		System.out.println("DB Connection error : "+e);
	} finally {
		try {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close(); 
		} catch(Exception e) {
			System.out.println("DB Close error : "+e);
		}
	}
	%>
			</tbody>
	</table>
	<input type="button" value="돌아가기" onclick="home()"/>
	<input type="button" value="회원정보수정" onclick="memEdit()"/>
	<input type="button" value="회원탈퇴" onclick="delMem()"/>
</form>

<script>
function home() {
	location.href = "index.jsp";
}

function memEdit() {
	location.href = "memberEdit.jsp";
}

function delMem() {
	location.href = "delMem.jsp";
}
</script>

<jsp:include page="footer.jsp"/>