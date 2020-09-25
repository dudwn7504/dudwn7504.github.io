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
<%
String id = (String) session.getAttribute("id");
MemberDAO dao = new MemberDAO();
MemberBean memberBean = dao.userInfo(id);
%>
<jsp:include page="header_login.jsp"/>
	<h2>회원정보</h2>
	<form name="userModify" action="userModify2.jsp" method="post">
		<table align="center">
			<tr>
				<td>아이디</td>
				<td><%=memberBean.getId() %></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="text" name="pwd" value="<%=memberBean.getPwd() %>"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=memberBean.getName() %>"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=memberBean.getEmail() %>"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" value="<%=memberBean.getAddress() %>" /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone" value="<%=memberBean.getPhone() %>"/></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><%=memberBean.getJoinDate() %></td>
			</tr>
		</table>
		<input type="submit" value="확인" />
		<a href="userInfo.jsp"><input type="button" value="이전으로" /></a>
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>