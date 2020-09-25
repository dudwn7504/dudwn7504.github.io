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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 수정</title>
</head>
<body>
<%
String id = (String) session.getAttribute("id");
String title = (String) session.getAttribute("title");
String content = (String) session.getAttribute("content");
String writeDate = (String) session.getAttribute("writeDate");

QnaBean q = new QnaBean(id, title, content, writeDate);
QnaDAO dao = new QnaDAO();
dao.updateQna(q);
%>
<jsp:include page="header_login.jsp"/>
	<h2>1:1문의 수정</h2>
	<form name="writeForm" action="qnaShow2.jsp" method="post">
		<table align="center">
			<tr>
				<td>아이디</td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=title %></td>
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
		<a href=""><input type="button" value="작성하기" onclick="fn_sendQna()" /></a>
		<a href="qnaList.jsp"><input type="button" value="취소"/></a>
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>