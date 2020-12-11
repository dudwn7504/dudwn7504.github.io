<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.Date"
	import="java.text.SimpleDateFormat"    
%>
<%
	Date nowDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>

<%-- <link rel='stylesheet' href='<c:url value="/resources/css/alpha_join.css"/>'/> --%>
<script>
function fn_sendMember(){
   var join=document.joinForm;
   var custid=join.custid.value;
   var pw=join.pw.value;
   var author=join.author.value;
   var phone=join.phone.value;
   var email=join.email.value;
   var area=join.area.value;
   var passon=join.passon;
   
   if(passon.value!="ok") {
	  alert("아이디 중복확인을 해주세요.");
	  join.custid.focus();
   } else if(custid.length==0 ||custid==""){
      alert("아이디를 입력해주세요.");
      join.custid.focus();
   } else if(pw.length==0 ||pw=="") {
      alert("비밀번호를 입력해주세요.");
      join.pw.focus();
   } else if(author.length==0 ||author=="") {
      alert("이름을 입력해주세요.");
      join.author.focus();
   } else if(phone.length==0 ||phone=="") {
	  alert("연락처를 입력해주세요.");
	  join.phone.focus();
   } else if(email.length==0 ||email=="") {
      alert("이메일을 입력해주세요.");
      join.email.focus();
   } else if(area.length==0 ||area=="") {
      alert("거주지를 입력해주세요.");
      join.area.focus();
   } else {
      joinForm.method="post";
//      joinForm.action="memList";
      joinForm.submit();
   } 
}

function id_confirm() {
	var join = document.joinForm;
	var custid = join.custid.value;
	if(custid == "" || custid.length == 0) {
		alert("아이디를 입력해주세요");
		join.custid.focus();
	} else {
		window.name = "parentForm";
		window.open("idCheck.jsp?custid="+custid, "아이디 중복확인", "width=500, height=350, top=200, left=600, scrollbars=no, resizable=no");
	}
}
</script>

<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="./header.jsp"/>
<div class="join_box">
<h2>회원가입</h2>
<form name="joinForm" class="join_form" method="post" action="joinPro.jsp">
  <table class="join_tb" align="center">
	  <tr>
		<th>아이디</th>
		<td><input type="text" name="custid"> <input type="button" value="중복확인" onclick="id_confirm()"/></td>
	  </tr>
	  <tr>
		<th>비밀번호</th>
		<td><input type="password" name="pw"></td>
	  </tr>
	  <tr>
		<th>이름</th>
		<td><input type="text" name="author"></td>
	  </tr>
	  <tr>
		<th>연락처</th>
		<td><input type="text" name="phone"></td>
	  </tr>
	    <tr>
		<th>이메일</th>
		<td><input type="text" name="email"></td>
	  </tr>
	  <tr>
		<th>주소(거주지)</th>
		<td><input type="text" name="area"></td>
	  </tr>
	  <tr>
	  	<td colspan="2">
	   	  <input type="button" value="가입하기" onclick="fn_sendMember()" />
	      <input type="reset" value="다시입력"/>
	    </td>
	  </tr>
  </table>
   <input type="hidden" name="passon" id="passon"/>
   <!-- <input  type="hidden" name="command" value="addMember" /> -->
 </form>
 </div>
<jsp:include page="./footer.jsp"/>
