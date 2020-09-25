<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,gilbut.*"
    %>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="delMem.css" type="text/css"/>
<script>
function fn_delMember(){
   var delMember=document.delMemberForm;
   var pwd=delMember.pwd.value;
   if(pwd.length==0 ||pwd==""){
      alert("비밀번호를 입력해주세요.");
   } else {
	  delMemberForm.method="post";
//	  delMemberForm.action="join";
      delMemberForm.submit();
   } 
}
</script>
<meta charset="UTF-8">
<title>회원탈퇴 화면</title>
</head>
<body>
<jsp:include page="header_login.jsp"/>
	<h2>회원 탈퇴</h2>
	<form name="delMemberForm" action="delMem2.jsp" method="post">
		<table class="join_tb" align=center>
	  <tr>
		<td>탈퇴 아이디</td>
		<td><%=id %></td>
	  </tr>
	   <tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd"></td>
	  </tr> 
  </table>
		
		<input type="button" value="탈퇴하기" onclick="fn_delMember()" />
		<input type="reset" value="취소" />
		<input  type="hidden" name="command" value="delMember" />	
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>