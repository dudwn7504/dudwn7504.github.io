<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*,gilbut.*"
	import="java.util.Date"
	import="java.text.SimpleDateFormat"       
%>
<%
	request.setCharacterEncoding("utf-8");
	Date nowDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="qnaWrite.css" />
<script>
function fn_sendQna(){
	   var write=document.writeForm;
	   var id=write.id.value;
	   var title=write.title.value;
	   var content=write.content.value;
	   if(title.length==0 ||title==""){
	      alert("제목을 입력해주세요.");
	   } else if(content.length==0 ||content=="") {
	      alert("문의내용을 입력해주세요.");
	   } else {
	      writeForm.method="post";
//	      joinForm.action="memList";
	      writeForm.submit();
	   } 
	}
</script>
<meta charset="UTF-8">
<title>1:1문의</title>
</head>
<body>
<jsp:include page="header_login.jsp"/>
	<h2>1:1문의하기</h2>
	<form name="writeForm" action="qnaShow2.jsp" method="post">
		<table align="center">
			<tr>
				<td>아이디</td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr>
				<td>문의내용</td>
				<td><textarea name="content" id="" cols="30" rows="10" ></textarea></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="text" name="writeDate" value="<%=sf.format(nowDate) %>"/></td>
			</tr>
		</table>
		<input type="button" value="작성하기" onclick="fn_sendQna()" />
		<a href="qnaList.jsp"><input type="button" value="취소"/></a>
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>