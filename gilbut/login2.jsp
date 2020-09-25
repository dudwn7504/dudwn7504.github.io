<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,gilbut.*"
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
	<%  request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	session.setAttribute("id", id);
	session.setAttribute("pwd", pwd);
	
	MemberDAO dao = new MemberDAO();
	int check = dao.loginCheck(id, pwd);
	
	String msg = "";
	
	if(check == 1) {
		msg = "index_login.jsp";
	} else if(check == 0) {
		msg = "login.jsp?msg=0";
	} else {
		msg = "login.jsp?msg=-1";
	}
	response.sendRedirect(msg);
%>
</body>
</html>