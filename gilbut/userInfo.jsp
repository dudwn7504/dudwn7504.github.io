<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*,gilbut.*"    
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="userInfo.css" />
<meta charset="UTF-8">
<title>회원정보 화면</title>
</head>
<body>
<jsp:include page="header_login.jsp"/>
<%
String id = (String) session.getAttribute("id");
MemberDAO dao = new MemberDAO();
MemberBean memberBean = dao.userInfo(id);
%>
	<h2>회원정보</h2>
	<form action="">
		<table align="center">
			<tr>
				<td>아이디</td>
				<td><%=memberBean.getId() %></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><%=memberBean.getPwd() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=memberBean.getName() %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%=memberBean.getEmail() %></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%=memberBean.getAddress() %></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><%=memberBean.getPhone() %></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><%=memberBean.getJoinDate() %></td>
			</tr>
		</table>
		<a href="userModify.jsp"><input type="button" value="회원정보수정"/></a>
		<a href="deleteMember.jsp"><input type="button" value="탈퇴하기"/></a>
		<a href="index_login.jsp"><input type="button" value="돌아가기"/></a>
	</form>
	<jsp:include page="footer.jsp"/>
</body>
</html>