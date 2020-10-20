<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="admin_header.jsp"/>
<main class="content">
	<figure class="vs">
		<section class="page" id="page1">
		<img src="./img/main1.jpg" class="main_img" style="display:block" width="1280px" height="350px" margin="0 auto" alt="" />
			<h2 class="page_tit">관리자 페이지 메인</h2>
			<nav class="menu">
				<ul>
					<li><a href="memberlist.jsp">회원관리</a></li>
					<li><a href="faqlist.jsp">FAQ관리</a></li>
					<li><a href=answerlist.jsp">1:1문의 관리</a></li>
					<li><a href="eventlist.jsp">이벤트·설문·모집관리</a></li>
					<li><a href="booklist.jsp">도서관리</a></li>
					<li><a href="eduvideolist.jsp">동영상강좌 관리</a></li>
					<li><a href="company_edit.jsp">회사정보 수정</a></li>
					<li><a href="admin_edit.jsp">관리자정보</a></li>
					<li><a href="protocol_edit.jsp">회원약관 수정</a></li>
					<li><a href="privacy_edit.jsp">개인정보처리방침 수정</a></li>
				</ul>
			</nav>
		</section>
	</figure>
</main>
<jsp:include page="admin_footer.jsp"/>
