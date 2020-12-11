<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
request.setCharacterEncoding("utf-8");
String custid = (String)session.getAttribute("custid");
%>

<style>

</style>

<jsp:include page="header.jsp" />


<form class="delMemForm" name="delMemForm" action="delMemPro.jsp">
	<h2>회원탈퇴</h2>
	<h3 style="margin:30px 0";><%=custid %>님! 정말 탈퇴하시겠습니까?</h3>
	<input type="button" value="취소" onclick="cancel()"/>
	<input type="submit" value="탈퇴하기" />
</form>

<script>
function cancel() {
	location.href = "memberInfo.jsp";
}
</script>

<jsp:include page="footer.jsp" />