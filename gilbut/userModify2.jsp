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
<title>회원정보수정</title>
</head>
<body>
<jsp:include page="header_login.jsp"/>
<%
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address");
String phone = request.getParameter("phone");

String id = (String) session.getAttribute("id");
MemberDAO dao = new MemberDAO();
dao.updateMember(pwd, name, email, address, phone, id);
MemberBean memberBean = new MemberBean(pwd, name, email, address, phone);
%>
	<h2>회원정보</h2>
	<form name="userModify2" action="userInfo.jsp" method="post">
		<table align="center">
			<tr>
				<td>아이디</td>
				<td><%=id %></td>
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
		<input type="submit" value="확인" />
		<a href="userModify.jsp"><input type="button" value="이전으로" /></a>
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>