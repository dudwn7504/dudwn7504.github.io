+ ### 프로젝트명 : 알파색채
+ ### 주요 소재 : 알파색채 사이트
+ ### 개발기간 : 7일
+ ### 개발언어 : HTML, CSS, jQuery, Javascript, JSP
+ ### 개발환경 : jdk1.8.0, Eclipse IDE(2020-03 (4.15.0)), Oracle Database 11g Express Edition Release 11.2.0.2.0, Apache Tomcat 9.0
* * *

+ ### 메인화면
![메인화면](./readme(alpha)/home.png)
* * *

+ ### 로그인 화면
![로그인화면](./readme(alpha)/login.png)
+ ### 로그인 처리
```
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;
String dbPw = "";

String custid = request.getParameter("custid");
String pw = request.getParameter("pw");

try {
	con = DBcon.getConnection();
	String sql = "select pw from custom_tbl where custid=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custid"));
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		dbPw = rs.getString("pw");
		if(dbPw.equals(pw)) {
			System.out.println("로그인 성공!");
			session.setAttribute("custid", custid);
			%>
			<script>
			alert("환영합니다 <%=custid%>님!");
			location.href = "index.jsp";
			</script>
			<%
		} else {
			System.out.println("패스워드가 일치하지 않습니다.");
			%>
			<script>
			alert("패스워드가 일치하지 않습니다.");
			location.href = "login.jsp";
			</script>
			<%
		}
	} else {
		System.out.println("존재하는 아이디가 없습니다.");
		%>
		<script>
		alert("존재하는 아이디가 없습니다.");
		location.href = "login.jsp";
		</script>
		<%
	}
} catch(Exception e) {
	System.out.println("DB Connection error :"+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	} catch(Exception e) {
		System.out.println("DB Close error : "+e);
	}
}
%>
</body>
</html>
```
* * *

+ ### 회원가입 화면
![회원가입 화면](./readme(alpha)/join.png)

+ ### 아이디 중복체크 화면
![아이디 중복체크 화면](./readme(alpha)/idCheck.png)
+ ### 아이디 중복체크 코드
```
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
```

+ ### 회원가입 처리
```
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록처리</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;

try {
	con = DBcon.getConnection();
	String sql = "insert into custom_tbl values(?, ?, ?, ?, ?, ?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custid"));
	pstmt.setString(2, request.getParameter("pw"));
	pstmt.setString(3, request.getParameter("author"));
	pstmt.setString(4, request.getParameter("phone"));
	pstmt.setString(5, request.getParameter("email"));
	pstmt.setString(6, request.getParameter("area"));
	rs = pstmt.executeQuery();
} catch(Exception e) {
	System.out.println("DB Connection error : "+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
		%>
		<script>
		alert("회원등록이 정상적으로 이루어 졌습니다.")
		</script>
		<%
	} catch(Exception e) {
		System.out.println("DB Close error : "+e);
	}
}
%>
<script>
location.href = "login.jsp";
</script>
</body>
</html>
```
* * *

+ ### 내(회원)정보조회 화면
![내(회원)정보조회 화면](./readme(alpha)/myinfo.png)
+ ### 내(회원)정보조회 코드
```
<%
request.setCharacterEncoding("utf-8");
String custid = (String)session.getAttribute("custid");
%>

<jsp:include page="header.jsp"/>

<form id="memInfoForm"  name="memInfoForm" action="">
	<h2>나의 회원정보</h2>
	<table class="memInfoTb" border="1" >
		<tbody>
		<tr>
			<th>아이디</th>
			<td><%=custid %></td>
		</tr>
	<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	String pw;
	String author;
	String phone;
	String email;
	String area;
	
	try{
		con = DBcon.getConnection();
		String sql = "select pw, author, phone, email, area from custom_tbl where custid=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custid);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			pw = rs.getString("pw");
			author = rs.getString("author");
			phone = rs.getString("phone");
			email = rs.getString("email");
			area = rs.getString("area");
			%>
			<tr>
				<th>패스워드</th>
				<td><%=pw %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=author %></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%=phone %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=email %></td>
			</tr>
			<tr>
				<th>거주지</th>
				<td><%=area %></td>
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
			</tbody>
	</table>
	<input type="button" value="돌아가기" onclick="home()"/>
	<input type="button" value="회원정보수정" onclick="memEdit()"/>
	<input type="button" value="회원탈퇴" onclick="delMem()"/>
</form>

<script>
function home() {
	location.href = "index.jsp";
}

function memEdit() {
	location.href = "memberEdit.jsp";
}

function delMem() {
	location.href = "delMem.jsp";
}
</script>

<jsp:include page="footer.jsp"/>
```
* * *

+ ### 내(회원)정보수정 화면
![내(회원)정보 화면](./readme(alpha)/myedit.png)
+ ### 내(회원)정보수정 처리코드
```
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 처리</title>
<%
request.setCharacterEncoding("utf-8");
String custid = (String)session.getAttribute("custid");
%>
</head>
<body>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;


try {
	con = DBcon.getConnection();
	String sql = "update custom_tbl set";
	sql += " pw=?, author=?, phone=?, email=?, area=? where custid=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("pw"));
	pstmt.setString(2, request.getParameter("author"));
	pstmt.setString(3, request.getParameter("phone"));
	pstmt.setString(4, request.getParameter("email"));
	pstmt.setString(5, request.getParameter("area"));
	pstmt.setString(6, custid);
	rs = pstmt.executeQuery();
} catch(Exception e) {
	System.out.println("DB Connection error : "+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
		%>
		<script>
		alert("회원정보수정이 정상적으로 이루어졌습니다.");
		</script>
		<%
	} catch(Exception e) {
		System.out.println("DB Close error : "+e);
	}
}
%>
<script>
location.href = "memberInfo.jsp";
</script>
</body>
</html>
```
* * *

+ ### 회원탈퇴 화면
![회탈퇴 화면](./readme(alpha)/delMember.png)
+ ### 회원탈퇴 처리코드
```
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CS·문의 삭제 처리</title>
</head>
<body>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs;
String qnum;

try {
	con = DBcon.getConnection();
	String sql = "delete from qna_tbl where qnum=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("qnum"));
	rs = pstmt.executeQuery();
} catch(Exception e) {
	System.out.println("DB Connection error : "+e);
} finally {
	try {
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
		System.out.println("해당글의 삭제가 완료되었습니다.");
		%>
		<script>
		alert("해당글의 삭제가 완료되었습니다.");
		location.href = "qnaList.jsp";
		</script>
		<%
	} catch(Exception e) {
		System.out.println("DB Close error : "+e);
	}
}
%>
</body>
</html>
```
* * *

