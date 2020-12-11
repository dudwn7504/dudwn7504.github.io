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
Date nowDate = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<jsp:include page="header.jsp"/>

<style>
input {
text-align: center;
}
</style>

<form name="qnaViewForm" class="qnaViewForm" action="qnaEditPro.jsp">
	<h2>CS·문의 수정</h2>
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
			<td><input name="qnum" type="text" style="width:20px;" value="<%=qnum %>" readonly/></td>
			<td><%=qtit %></td>
			<td>
				<span ><%=custid %></span>
				<span >(<%=author %>)</span>
			</td>
			<td><%=sf.format(nowDate) %></td>
		</tr>
		<tr class="qcon">
			<th>문의내용</th>
			<td colspan="4" ><textarea name="qcon" id="qcon" cols="50" rows="9"><%=qcon %></textarea></td>
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
	<input type="button" value="취소" onclick="editCancel()"/>
	<input type="button" value="수정하기" onclick="qnaEdit()"/>
</form>

<script>
function editCancel() {
	window.history.back();
}

function qnaEdit() {
	var qedit = document.qnaViewForm;
	var qcon = qedit.qcon.value;
	
	if(qcon == "" || qcon.length == 0) {
		alert("수정할 내용을 입력해주세요.");
		qcon.focus();
	} else {
		qedit.method="post";
		qedit.submit();
	}
}
</script>

<jsp:include page="footer.jsp" />