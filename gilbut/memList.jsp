<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,gilbut.*"
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String joinDate = request.getParameter("joinDate");

	
	MemberBean m = new MemberBean(id, pwd, name, phone, email, address, joinDate);
	MemberDAO dao = new MemberDAO();
	dao.addMember(m);
	List membersList = dao.listMembers();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록창</title>
  <style>
  wrap {display:none;}
  .tit { text-align:center; padding-top:50px; }
  .tb { display:table; width:900px; margin:10px auto; border-spacing:0; }
  .tb td { text-align:center; line-height:2; border-bottom:1px solid #333; 
  border-spacing:0; }
  .tb th { background:#99ccff; line-height:2; border-spacing:0; }
  .tb .col1 { width: 7%; }
  .tb .col2 { width: 10%; }
  .tb .col3 { width: 7%; }
  .tb .col4 { width: 11%; }
  .tb .col5 { width: 5%; }
  </style>
</head>
<body>
	<wrap>
	<h2 class="tit">회원목록</h2>
	<table class="tb">
		<thead>
			<tr>
				<th class="col1">아이디</th>
				<th class="col2">비밀번호</th>
				<th class="col3">이름</th>
				<th class="col4">연락처</th>
				<th class="col5">이메일</th>
				<th class="col6">주소</th>
				<th class="col7">가입일</th>
			</tr>
		</thead>
		<tbody>
			<% if(membersList.size() == 0) { %>
			<tr>
		      <td colspan="5">
		        <p style="text-align:center; font-size:9pt;">
		        	<strong><span>등록된 회원이  없습니다.</span></strong>
		        </p>
		      </td>
		  </tr>
		  <%
			} else {
				for(int i=0;i<membersList.size();i++) {
					MemberBean bean = (MemberBean) membersList.get(i);
		  %>
			  <tr>
			  	<td><%=bean.getId() %></td>
			  	<td><%=bean.getPwd() %></td>
			  	<td><%=bean.getName() %></td>
			  	<td><%=bean.getPhone() %></td>
			  	<td><%=bean.getEmail() %></td>
			  	<td><%=bean.getAddress() %></td>
			  	<td><%=bean.getJoinDate() %></td>
			  </tr>
			<%
				}
			}
			%>
		</tbody>
	</table>
	</wrap>
	<jsp:include page="join2.jsp"/>
</body>
</html>