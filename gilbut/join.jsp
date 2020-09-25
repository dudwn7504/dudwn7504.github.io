<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.Date"
	import="java.text.SimpleDateFormat"    
%>
<%
	Date nowDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="gilbut_join.css" type="text/css"/>
<script>
function fn_sendMember(){
   var join=document.joinForm;
   var id=join.id.value;
   var pwd=join.pwd.value;
   var name=join.name.value;
   var phone=join.phone.value;
   var email=join.email.value;
   var address=join.address.value;
   if(id.length==0 ||id==""){
      alert("아이디를 입력해주세요.");
   } else if(pwd.length==0 ||pwd=="") {
      alert("비밀번호를 입력해주세요.");
   } else if(name.length==0 ||name=="") {
      alert("이름을 입력해주세요.");
   } else if(phone.length==0 ||phone=="") {
	  alert("연락처를 입력해주세요.");
   } else if(email.length==0 ||email=="") {
      alert("이메일을 입력해주세요.");
   } else if(address.length==0 ||address=="") {
	      alert("주소를 입력해주세요.");
   } else {
      joinForm.method="post";
//      joinForm.action="memList";
      joinForm.submit();
   } 
}
</script>

<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h2>회원가입</h2>
<form name="joinForm" class="join_form" method="post" action="memList.jsp">
  <table class="join_tb" align=center>
	  <tr>
		<td>아이디</td>
		<td><input type="text" name="id"> <input type="button" value="중복확인"/></td>
	  </tr>
	  <tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd"></td>
	  </tr>
	  <tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	  </tr>
	  <tr>
		<td>연락처</td>
		<td><input type="text" name="phone"></td>
	  </tr>
	    <tr>
		<td>이메일</td>
		<td><input type="text" name="email"></td>
	  </tr>
	  <tr>
		<td>주소</td>
		<td><input type="text" name="address"></td>
	  </tr>
	  <tr>
		<td>가입일</td>
		<td><input type="text" name="joinDate" value="<%=sf.format(nowDate) %>"/></td>
	  </tr>
  </table>
   <input type="button" value="가입하기" onclick="fn_sendMember()" />
   <input type="reset" value="다시입력"/>
   <!-- <input  type="hidden" name="command" value="addMember" /> -->
  </form>
<jsp:include page="footer.jsp"/>
</body>
</html>