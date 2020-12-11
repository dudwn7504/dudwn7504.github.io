<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	session.getAttribute("custid");
%>

<script>
function fn_loginCheck(){
	   var loginCheck=document.loginForm;
	   var custid=loginCheck.custid.value;
	   var pw=loginCheck.pw.value;
	   if(custid.length==0 ||custid==""){
	      alert("아이디를 입력해 주세요.");
	   } else if(pw.length==0 ||pw=="") {
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
<%-- <link rel='stylesheet' href='<c:url value="/resources/css/alpha_login.css"/>'/> --%>
	<jsp:include page="./header.jsp"/>
	<div class="login_form">
		<h2>로그인</h2>
		<form name="loginForm" action="loginPro.jsp">
			<table class="join_tb">
			  <tr>
				<th>아이디</th>
				<td class="login_td"><input type="text" name="custid"></td>
			  </tr>
			   <tr>
				<th>비밀번호</th>
				<td class="login_td"><input type="password" name="pw"></td>
			  </tr> 
		  </table>
	  
	  	<input type="submit" value="로그인" onclick="fn_loginCheck()"/>
	  	<input type="reset" value="취소"/>
	  	<input  type="hidden" name="command" value="loginCheck" />
		</form>
	</div>
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
<jsp:include page="./footer.jsp"/>
