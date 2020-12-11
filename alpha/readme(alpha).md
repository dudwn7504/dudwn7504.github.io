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
