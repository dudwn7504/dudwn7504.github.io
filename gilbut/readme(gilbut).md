+ ### 프로젝트명 : 길벗출판사 
+ ### 주요 소재 : 출판사 
+ ### 개발언어 : HTML, CSS, jQuery, Javascript, JSP
+ ### 개발환경 : jdk1.8.0, Eclipse IDE(2020-03 (4.15.0)), Oracle Database 11g Express Edition Release 11.2.0.2.0, Apache Tomcat 9.0
* * *
+ #### 메인화면
![메인홈 ](./readme(gilbut)/home.png)
* * *
+ #### 로그인 화면
![로그인 화면](./readme(gilbut)/login.png)
  + #### MemberDAO(로그인)
  ```
public int loginCheck(String id, String pwd) {
		String dbPw = "";
		int x = -1;
		
		try {
			con = dataFactory.getConnection();
			String query = "select pwd from member where id=?";
			System.out.println(query+"가 실행됨.");
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbPw = rs.getString("pwd");
				if(dbPw.equals(pwd)) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1;
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
  ```
* * *
+ #### 회원가입 화면
![회원가입 화면](./readme(gilbut)/join.png)
	+ #### MemberDAO(회원가입)
	```
	public void addMember(MemberBean memberBean) {
		try {
			con = dataFactory.getConnection();
			String id = memberBean.getId();
			String pwd = memberBean.getPwd();
			String name = memberBean.getName();
			String phone = memberBean.getPhone();
			String email = memberBean.getEmail();
			String address = memberBean.getAddress();
			String joinDate = memberBean.getJoinDate();
			String query = "insert into member";
			query += " (id,pwd,name,phone,email,address,joinDate)";
			query += " values(?,?,?,?,?,?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, phone);
			pstmt.setString(5, email);
			pstmt.setString(6, address);
			pstmt.setString(7, joinDate);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	```
