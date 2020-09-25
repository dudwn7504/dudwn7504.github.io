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
<link rel="stylesheet" href="qnaShow.css" />
<meta charset="UTF-8">
<title>1:1문의</title>
</head>
<body>
<jsp:include page="header_login.jsp"/>
<%
String title = request.getParameter("title");
String content =request.getParameter("content");
String writeDate = request.getParameter("writeDate");

QnaBean q = new QnaBean(id, title, content, writeDate);
QnaDAO dao = new QnaDAO();
dao.addQna(q);
%>
	<h2>1:1문의</h2>
	<form action="" method="post">
		<table align="center">
			<tr>
				<td>작성자</td>
				<td><%=q.getId() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=q.getTitle() %></td>
			</tr>
			<tr>
				<td>문의내용</td>
				<td><%=q.getContent() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=q.getWriteDate() %></td>
			</tr>
		</table>
		<a href="qnaList.jsp"><input type="button" value="확인" /></a>
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>