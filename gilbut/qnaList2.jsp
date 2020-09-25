<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,gilbut.*"
    %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writeDate = request.getParameter("writeDate");

	
	QnaBean q = new QnaBean(id, title, content, writeDate);
	QnaDAO dao = new QnaDAO();
	dao.delQnaAll(q);
	List qnaList = dao.qnaList();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="qnaList.css" />
<meta charset="UTF-8">
<title>1:1문의</title>
	<style>
		a {color:#000000;}
	  .tit { text-align:center; padding-top:50px; }
	  .tb { display:table; width:900px; margin:10px auto; border-spacing:0; margin-bottom:50px; margin-top:40px;}
	  .tb td { text-align:center; line-height:2; border-bottom:1px solid #333; 
	  border-spacing:0; }
	  .tb th { background:#99ccff; line-height:2; border-spacing:0; }
	  .tb .col1 { width: 15%; }
	  .tb .col2 { width: 30%; }
	  .tb .col3 { width: 40%; }
	  .tb .col4 { width: 15%; }
 	</style>
</head>
<body>
<jsp:include page="header_login.jsp"/>
	<h2 class="tit">나의 1:1문의목록</h2>
	<form action="qnaList2.jsp">
	<table class="tb">
		<thead>
			<tr>
				<th class="col1">작성자</th>
				<th class="col2">제목</th>
				<th class="col3">내용</th>
				<th class="col4">작성일</th>
			</tr>
		</thead>
		<tbody>
			<% if(qnaList.size() == 0) { %>
			<tr>
		      <td colspan="4">
		        <p style="text-align:center; font-size:9pt;">
		        	<strong><span>등록된 문의글이 없습니다.</span></strong>
		        </p>
		      </td>
		  </tr>
		  <%
			} else {
				for(int i=0;i<qnaList.size();i++) {
					QnaBean bean = (QnaBean) qnaList.get(i);
		  %>
			  <tr>
			  	<td><%=bean.getId() %></td>
			  	<td><a class="lst" href="qnaShow.jsp"><%=bean.getTitle() %></a></td>
			  	<td><a class="lst" href="qnaShow.jsp" name="content"><%=bean.getContent() %></a></td>
			  	<td><%=bean.getWriteDate() %></td>
			  </tr>
			<%
				}
			}
			%>
		</tbody>
	</table>
	<div align="center">
		<a href="qnaWrite.jsp"><input type="button" value="문의하기"/></a>
		<input type="submit" value="모두삭제" />
	</div>
	</form>
<jsp:include page="footer.jsp"/>
</body>
</html>