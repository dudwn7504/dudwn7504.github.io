<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 액션태그의 경우 -->
<jsp:include page="header.jsp" flush="false"/>
<link rel='stylesheet' href='<c:url value="./css/main.css?after"/>'/>
<script>
	
</script>
<main id="content">
	<hr class="line"/>
	<figure class="vs">
		<ul class="img_box">
			<li class="item1">
				<a href="sub2.1"><img src="<c:url value="./img/bn1.jpg"/>" alt="배너1" class="bn_img" /></a>
			</li>
			<li class="item2">
				<a href="sub2.2"><img src="<c:url value="./img/bn2.jpg"/>" alt="배너2" class="bn_img" /></a>
			</li>
			<li class="item3">
				<a href="sub2.3"><img src="<c:url value="./img/bn3.jpg"/>" alt="배너3" class="bn_img" /></a>
			</li>
		</ul>
	</figure>
	<section class="page1" id="page1">
		<div class="page_fr">
		<p class="pro_txt">Alpha </p><span style="font-size:20px"> product</span>
			<ul class="pro">
				<li><a class="pro1" href="">
					<div class="pro_hover">
						<p class="pro_tit1">Poster Colors</p>
						<p class="pro_tit2">포스터칼라</p>
					</div>
					<img class="pro_img" src="<c:url value="./img/pro_1.jpg"/>" alt="제품1" />
				</a></li>
					
				<li><a class="pro2" href="">
					<div class="pro_hover">
						<p class="pro_tit1">Watercolor</p>
						<p class="pro_tit2">수채화</p>
					</div>
					<img class="pro_img" src="<c:url value="./img/pro_2.jpg"/>" alt="제품2" />
				</a></li>
				<li><a class="pro3" href="">
					<div class="pro_hover">
						<p class="pro_tit1">Acrylic Colors</p>
						<p class="pro_tit2">아크릴물감</p>
					</div>
					<img class="pro_img" src="<c:url value="./img/pro_3.jpg"/>" alt="제품3" />
				</a></li>
			</ul>
			<ul class="pro">
				<li><a class="pro4" href="">
					<div class="pro_hover">
						<p class="pro_tit1">Mediums</p>
						<p class="pro_tit2">보조제</p>
					</div>
					<img class="pro_img" src="<c:url value="./img/pro_4.jpg"/>" alt="제품4" />
				</a></li>
				<li><a class="pro5" href="">
					<div class="pro_hover">
						<p class="pro_tit1">Marker</p>
						<p class="pro_tit2">마커</p>
					</div>
					<img class="pro_img" src="<c:url value="./img/pro_5.jpg"/>" alt="제품5" />
				</a></li>
				<li><a class="pro6" href="">
					<div class="pro_hover">
						<p class="pro_tit1">Korean Colors</p>
						<p class="pro_tit2">한국화물감</p>
					</div>
					<img class="pro_img" src="<c:url value="./img/pro_6.jpg"/>" alt="제품6" />
				</a></li>
			</ul>
		</div>
	</section>
	<section class="page2" id="page2">
		<div class="page_fr">
			<ul>
			 <li class="fr_news">
			 	<span class="news_tit">Alpha</span><span> NEWS</span>
			 	<span class="plus_img"><img src="./img/plus.png" alt="+icon" /></span>
			 	<div class="news_img">
			 		<img src="./img/news.jpg" alt="2020AAF 알파아트페스티벌 수상자 발표" />
			 		<ul>
			 			<li class="news_txt">2020AAF 알파아트페스티벌 수상자 발표</li>
			 			<li class="news_date">2020-10-16</li>
			 		</ul>
			 	</div>
			 	<div class="news_lst">
				 	<ul>
				 		<li>
				 			<a class="lst_txt" href="">알파 채향 색구성 변경</a>
				 			<span class="lst_date">2020-09-02</span>
				 		</li>
				 		<li>
				 			<a class="lst_txt" href="">2020AAF 알파아트페스티벌 (기간연장)</a>
				 			<span class="lst_date">2020-06-29</span>
				 		</li>
				 	</ul>
			 	</div>
			 </li>
			 <li class="fr_datum">
			 	<img class="news_icon1" src="./img/news_icon_1.png" alt="자료실" />
			 	<p class="nmid_tit">MSDS 자료실</p>
			 	<div class="red_hr"></div>
			 	<p class="nmid_txt">
			 	Material Safety Data Sheet<br>
			 	(물질안전보건자료)
			 	</p>
			 </li>
			 <li class="fr_cs">
			 	<img class="news_icon2" src="./img/news_icon_2.png" alt="고객센터" />
			 	<p class="nmid_tit">고객센터</p>
			 	<div class="red_hr"></div>
			 	<p class="nmid_txt">
			 	궁금한 점이 있으시면 문의주세요.<br>
			 	Daily 08:30 ~ 17:30
			 	</p>
			 </li>
			 <li class="fr_notice">
			 	<img class="news_icon3" src="./img/news_icon_3.png" alt="소식" />
			 	<p class="nmid_tit">알파소식 받기</p>
			 	<div class="red_hr"></div>
			 	<p class="nmid_txt">
			 	여러분의 소중한 의견을 모아<br>
			 	더욱 좋은 제품으로 보답하겠습니다.
			 	</p>
			 </li>
			</ul>
		</div>
	</section>
</main>

<%-- <P>  The time on the server is ${serverTime}. </P> --%>
<jsp:include page="footer.jsp" flush="false"/>
<%-- <%@include file="footer.jsp" %> --%>

