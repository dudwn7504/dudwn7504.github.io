<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,gilbut.*"
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = (String) session.getAttribute("id");
	String pwd = request.getParameter("pwd");

	MemberBean m = new MemberBean(id,pwd);
	MemberDAO dao = new MemberDAO();
	dao.delMember(m);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 확인</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<h2 align=center>회원탈퇴</h2>
	<form align="center" action="">
	<h3 align=center>탈퇴가 성공적으로 처리되었습니다.</h3>
	<a href="memList2.jsp"><input type="button" value="확인"/></a>
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>