<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="alpha.DBcon" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
request.setCharacterEncoding("utf-8");
String qnum = request.getParameter("qnum");
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>

<jsp:include page="header.jsp"/>

<form name="qnaViewForm" class="qnaViewForm" action="">
	<h2>CS·문의 내용</h2>
	<table class="qnaView_tb" border="1">
		<tr>
			<th rowspan="2"></th>
			<th>글번호</th>
			<th>제목</th>
			<th>아이디(이름)</th>
			<th>작성일자</th>
		</tr>
		<%
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		String custid, author, qtit, qcon = null;
		Date wdate = null;
		
		try {
			con = DBcon.getConnection();
			String sql = "select * from qna_tbl where qnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				custid = rs.getString("custid");
				qtit = rs.getString("qtit");
				author = rs.getString("author");
				wdate = rs.getDate("wdate");
				qcon = rs.getString("qcon");
		%>
		<tr>
			<td><%=qnum %></td>
			<td><%=qtit %></td>
			<td><%=custid %>(<%=author %>)</td>
			<td><%=wdate %></td>
		</tr>
		<tr class="qcon">
			<th>문의내용</th>
			<td colspan="4" ><%=qcon %></td>
		</tr>
		<%
			}
		} catch(Exception e) {
			System.out.println("DB Connection error : "+e);
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch(Exception e) {
				System.out.println("DB Close error : "+e);
			}
		}
		%>
	</table>
	<input type="button" value="목록으로" onclick="goQnaList()"/>
	<input type="button" value="수정하기" onclick="qnaEdit()"/>
	<input type="button" value="삭제하기" onclick="qnaDelete()"/>
</form>

<script>
function goQnaList() {
	location.href = "qnaList.jsp";
}

function qnaEdit() {
	location.href = "qnaEdit.jsp?qnum=<%=qnum%>";
}

function qnaDelete() {
	location.href = "qnaDeletePro.jsp?qnum=<%=qnum%>";
}
</script>

<jsp:include page="footer.jsp" />