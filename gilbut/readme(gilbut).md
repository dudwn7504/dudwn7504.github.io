+ ### 프로젝트명 : 길벗출판사 
+ ### 주요 소재 : 출판사 
+ ### 개발언어 : HTML, CSS, jQuery, Javascript, JSP
+ ### 개발환경 : jdk1.8.0, Eclipse IDE(2020-03 (4.15.0)), Oracle Database 11g Express Edition Release 11.2.0.2.0, Apache Tomcat 9.0
* * *
+ ### 메인화면
![메인홈 ](./readme(gilbut)/home.png)
* * *
+ ### 로그인 화면
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
+ ### 회원가입 화면
![회원가입 화면](./readme(gilbut)/join.png)
+ ### MemberDAO(회원가입)
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
* * *
+ ### 메인화면(로그인)
![메인화면(로그인)](./readme(gilbut)/home(login).png)
* * *

+ ### 내(회원)정보 조회 화면
![내(회원)정보 조회 화면](./readme(gilbut)/myinfo.png)
+ #### MemberDAO(내(회원)정보 조회)
```
public MemberBean userInfo(String id) {
		MemberBean member = null;
		try {
			con = dataFactory.getConnection();
			String query = "select * from member where id=?";
			System.out.println(query+"가 실행됨.");
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberBean();
				member.setId(id);
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setAddress(rs.getString("address"));
				member.setPhone(rs.getString("phone"));
				member.setJoinDate(rs.getString("joindate"));
			}
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	
	}
```
* * *

+ ### 내(회원))정보 수정 화면
![내(회원)정보 수정 화면](./readme(gilbut)/myedit.png)
+ ### MemberDAO(내(회원)정보 수정)
```
public void updateMember(String pwd, String name, String email, String address, String phone, String id) {
		
		try {
			con = dataFactory.getConnection();
			String query = "update member set";
			query += " pwd=?, name=?, email=?, address=?, phone=? where id=?";
			System.out.println(query+"가 실행됨.");
			
			pstmt = con.prepareStatement(query);
			con.setAutoCommit(false);
			
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, address);
			pstmt.setString(5, phone);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
			con.commit();
			
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
```
* * *
+ ### 회원탈퇴 화면
![회원탈퇴 화면](./readme(gilbut)/delMember.png)
+ ### MemberDAO(회원탈퇴)
```
public void delMember(MemberBean memberBean) {
		try {
			con = dataFactory.getConnection();
			String id = memberBean.getId();
			String pwd = memberBean.getPwd();
			String query = "delete from member" + " where id=? and pwd=?";
			System.out.println("prepareStatememt:" + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
```
* * *

+ ### QnA(게시글)목록 화면
![QnA(게시글)목록 화면](./readme(gilbut)/qna.png)
+ ### QnaDAO(QnA목록)
```
public List<QnaBean> qnaList() {
		List<QnaBean> list = new ArrayList<QnaBean>();
		try {
			// connDB();
			con = dataFactory.getConnection();
			String query = "select * from qna ";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeDate = rs.getString("writeDate");
				QnaBean mb = new QnaBean();
				mb.setId(id);
				mb.setTitle(title);
				mb.setContent(content);
				mb.setWriteDate(writeDate);
				list.add(mb);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
```
* * *

+ ### QnA(게시글)작성 화면
![QnA(게시글)작성 화면](./readme(gilbut)/qnaWrite.png)
+ ### QnaDAO(QnA작성)
```
public void addQna(QnaBean qnaBean) {
		try {
			con = dataFactory.getConnection();
			String id = qnaBean.getId();
			String title = qnaBean.getTitle();
			String content = qnaBean.getContent();
			String writeDate = qnaBean.getWriteDate();
			String query = "insert into qna";
			query += " (id,title,content,writeDate)";
			query += " values(?,?,?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, writeDate);
			pstmt.executeUpdate();
			System.out.println("저장완료");
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
```
