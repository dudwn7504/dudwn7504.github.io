<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="gilbut_login.css" />
<script>
function fn_loginCheck(){
	   var loginCheck=document.loginForm;
	   var id=loginCheck.id.value;
	   var pwd=loginCheck.pwd.value;
	   if(id.length==0 ||id==""){
	      alert("아이디를 입력해 주세요.");
	   } else if(pwd.length==0 ||pwd=="") {
	      alert("비밀번호를 입력해주세요.");
	   } else {
		  loginForm.method="post";
//		  delMemberForm.action="join";
	      loginForm.submit();
	   } 
	}
</script>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<h2>로그인</h2>
	<form name="loginForm" action="login2.jsp" method="post">
		<table class="join_tb" align=center>
	  <tr>
		<td>아이디</td>
		<td><input type="text" name="id"></td>
	  </tr>
	   <tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd"></td>
	  </tr> 
  </table>
  
  	<input type="submit" value="로그인" onclick="fn_loginCheck()"/>
  	<input type="reset" value="취소"/>
  	<input  type="hidden" name="command" value="loginCheck" />
	</form>

<%
	String msg = request.getParameter("msg");

	if(msg != null && msg.equals("0")) {
%>
		<h2>비밀번호를 확인해 주세요.</h2>
<%
	} else if(msg != null && msg.equals("-1")) {
%>
		<h2>아이디를 확인해 주세요.</h2>
<%
	}
%>
<jsp:include page="footer.jsp"/>
</body>
</html>