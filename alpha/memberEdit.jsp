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

<script>
function edit() {
	var edit = document.memInfoForm;
	var pw = edit.pw.value;
	var author = edit.author.value;
	var phone = edit.phone.value;
	var email = edit.email.value;
	var area = edit.area.value;
	
	if(pw == "" || pw.length == 0) {
		alert("변경할 패스워드를 입력해주세요.");
		edit.pw.focus();
	} else if(author == "" || author.length == 0) {
		alert("변경할 이름을 입력해주세요.");
		edit.author.focus();
	} else if(phone == "" || phone.length == 0) {
		alert("변경할 연락처를 입력해주세요.");
		edit.phone.focus();
	} else if(email == "" || email.length == 0) {
		alert("변경할 이메일을 입력해주세요.");
		edit.email.focus();
	} else if(area == "" || area.length == 0) {
		alert("변경할 거주지(주소)를 입력해주세요.");
		edit.area.focus();
	} else {
		edit.method="post";
      	edit.submit();
	}
}
</script>

<form id="memInfoForm"  name="memInfoForm" action="memberEditPro.jsp">
	<h2>내 정보수정</h2>
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
				<td><input type="text" name="pw" value="<%=pw%>"/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="author" value="<%=author%>"/></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="phone" value="<%=phone%>"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="<%=email%>"/></td>
			</tr>
			<tr>
				<th>거주지</th>
				<td><input type="text" name="area" value="<%=area%>"/></td>
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
	<input type="button" value="취소" onclick="back()"/>
	<input type="button" value="수정" onclick="edit()"/>
</form>

<script>
function back() {
	location.href = "memberInfo.jsp";
}
</script>

<jsp:include page="footer.jsp"/>