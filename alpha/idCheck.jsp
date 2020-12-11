<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="alpha.DBcon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<style>
p {
	text-align: center;
}
.tit {
	
	text-align: center;
	margin-top: 100px;
}
</style>
</head>
<body>
<form id="checkForm" name="checkForm">
		<h2 class="tit">아이디 중복확인</h2>
		<p>
			<input type="text" id="custid" name="custid" value="<%=request.getParameter("custid")%>"/>
			<input type="button" value="중복확인" onclick="checkId()"/>
		</p>
		<p>
			<input type="button" value="취소" onclick="self.close()"/>
			<input type="button" value="사용하기" onclick="useId()"/>
		</p>
	</form>
	<script>
	<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String data;
	boolean idck = false;
	%>
	
	function checkId() {
		var chk = document.checkForm;
		var custid = chk.custid.value;
		if(custid == "" || custid.length == 0) {
			alert("사용할 아이디를 입력해주세요.");
		} else {
			location.href = "idCheck.jsp?custid="+custid;
		}
	}
	<%
	String custid = request.getParameter("custid");
	try {
		con = DBcon.getConnection();
		String sql = "select custid from custom_tbl where custid=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custid);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			data = rs.getString("custid");
			idck = true;
		}
		
		if(idck) {
			System.out.println("이미 존재하는 아이디입니다.");
			%>
			alert("이미 존재하는 아이디입니다.");
			<%
		} else {
			System.out.println("사용가능한 아이디입니다.");
			%>
			alert("사용가능한 아이디입니다.");
			<%
		}
	} catch(Exception e) {
		System.out.println("DB Connection error : "+e);
		%>
		alert("DB연결에 문제가 생겨 아이디 중복확인을 할 수가 없습니다.");
		<%
	} finally {
		try {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch(Exception e) {
			System.out.println("DB Close error : "+e);
		}
	}
	%>
	
	function useId() {
		var chk = document.checkForm;
		var custid = chk.custid.value;
		if(<%=idck%> == true) {
			alert("사용할 수 없는 아이디입니다.");
		} else if (custid == "" || custid.length == 0) {
			alert("사용하실 아이디를 입력하고 중복확인을 해주세요.");
		} else {
			opener.document.joinForm.passon.value="ok";
			opener.document.joinForm.custid.value = document.checkForm.custid.value;
			self.close();
		}
	}
	</script>
</body>
</html>