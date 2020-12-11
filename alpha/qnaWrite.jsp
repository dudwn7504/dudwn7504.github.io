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
String custid = (String)session.getAttribute("custid");
Date nowDate = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<jsp:include page="header.jsp"/>

<style>
input {
text-align: center;
}
</style>

<form name="qnaViewForm" class="qnaViewForm" action="qnaWritePro.jsp">
	<h2>CS·문의하기</h2>
	<table class="qnaView_tb" border="1">
		<tr>
			<th rowspan="2"></th>
			<th>제목</th>
			<th>아이디(이름)</th>
			<th>작성일자</th>
		</tr>
		<tr>
			<td><input name="qtit" type="text" /></td>
			<td>
				<input name="custid" type="text" value="<%=custid %>" style="width:100px;" readonly/>
		<%
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		String author = null;
		
		try {
			con = DBcon.getConnection();
			String sql = "select * from custom_tbl where custid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				author = rs.getString("author");
		%>
		
				<input name="author" type="text" value="<%=author %>" style="width:100px;" readonly/>
			
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
		</td>
			<td><input name="wdate" type="text" value="<%=sf.format(nowDate) %>" readonly/></td>
		</tr>
		<tr class="qcon">
			<th>문의내용</th>
			<td colspan="4" ><textarea name="qcon" id="qcon" cols="50" rows="9"></textarea></td>
		</tr>
	</table>
	<input type="button" value="취소" onclick="editCancel()"/>
	<input type="button" value="등록하기" onclick="qnaWrite()"/>
</form>

<script>
function editCancel() {
	window.history.back();
}

function qnaWrite() {
	var qwrite = document.qnaViewForm;
	var qtit = qwrite.qtit.value;
	var qcon = qwrite.qcon.value;
	
	if(qtit == "" || qtit.length == 0) {
		alert("제목을 입력해주세요.");
		qtit.focus();
	} else if(qcon =="" || qcon.length == 0) {
		alert("문의하실 내용을 입력해주세요.");
		qcon.focus();
	} else {
		qwrite.method="post";
		qwrite.submit();
	}
}
</script>

<jsp:include page="footer.jsp" />