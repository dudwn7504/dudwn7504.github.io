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
String id = (String)session.getAttribute("custid");
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<jsp:include page="header.jsp" />

<form class="qnaForm" name="qnaForm" action="">
	<h2>CS·문의 목록</h2>
	<table class="qna_tb" border="1">
		<thead>
			<tr>
				<th>글번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs;
			String qnum = null;
			String custid = null;
			String qtit = null;
			String wdate = null;
			
			try {
				con = DBcon.getConnection();
				String sql = "select qnum, custid, qtit, wdate from qna_tbl where custid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					qnum = rs.getString("qnum");
					custid = rs.getString("custid");
					qtit = rs.getString("qtit");
					wdate = rs.getString("wdate");
					%>
					<tr>
						<td><a href="qnaView.jsp?qnum=<%=qnum %>"><%=qnum %></a></td>
						<td><%=custid %></td>
						<td><%=qtit %></td>
						<td><%=wdate %></td>
					</tr>
					<%
				}
				if(rs.getRow() == 0) {
					%>
					<tr>
						<td colspan="4" class="qnaNon">등록된 문의글이 없습니다.</td>
					</tr>
					<%
				}
				
			} catch(Exception e) {
				System.out.println("DB Connection error : "+e);
			} finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(con!=null) con.close();
					System.out.println("문의 목록을 성공적으로 불러왔습니다.");
				} catch(Exception e) {
					System.out.println("DB Close error : "+e);
				}
			}
			%>
		</tbody>
	</table>
	<input type="button" value="홈으로" onclick="goHome()"/>
	<input type="button" value="문의하기" onclick="writeQna()"/>
</form>

<script>
function goHome() {
	location.href = "index.jsp";	
}

function writeQna() {
	location.href = "qnaWrite.jsp";
}
</script>

<jsp:include page="footer.jsp" />