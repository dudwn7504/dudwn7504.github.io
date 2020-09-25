<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,gilbut.*"
    %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="index.css" />
<meta charset="UTF-8">
<title>콘텐츠</title>
<style>
	section {width:1280px; margin:0 auto;}
</style>
</head>
<body>
	<section>
		<div class="tip">
			<h3 class="tip_h3">길벗·이지톡의 빠른 이용 팁</h3>
			<ul class="tip_tit">
				<li><a href="#">부록, MP3 등 자료 찾기</a></li>
				<li><a href="#">도서, 동영상 강좌 문의</a></li>
				<li><a href="#">로그인 후 이용 혜택</a></li>
				<li><a href="#">모바일 앱 설치</a></li>
			</ul>
		</div>
	</section>
	
	<div class="best_book">
		<div class="bn_box">
		<div class="book_image">
			<img class="main_book" src="./image/rn_view_BN002833.jpg" alt="책" />
		</div>
			
		<div class="bn_txt">
			<span class="bn_new">NEW</span><br />
			<span class="bn_tit">누구나 쉽게 이해할 수 있다!</span><br />
			<span class="bn_text">기초 수학에서 미분, 선형 대수학, 확률과 통계 핵심 내용까지! <br />가장 쉬운 인공지능 수학 입문서!
			</span>
		</div>
		</div>
	</div>
	
	<div class="bn_sec">
		<h2 class="bn_sec_tit">길벗이 추천하는 책과 콘텐츠</h2>
		<div class="con">
			<ul class="con_img">
				<li><img src="./image/con1.jpg" alt="사진1" /></li>
				<li><img src="./image/con2.jpg" alt="사진2" /></li>
				<li><img src="./image/con3.jpg" alt="사진3" /></li>
				<li>
					<div class="con_txt">
						<h2 class="con_txt_tit">교보문고X길벗출반사 여름 기획전!</h2>
						<p class="con_txt_text1">이벤트</p>
						<p class="con_txt_text2">슬기롭고 즐거운 국내여행을 계획해보세요!</p>
						<a class="con_txt_button" href="#">보기</a>
					</div>
				</li>
			</ul>
			<ul class="con_img">
				<li><img src="./image/con4.jpg" alt="사진4" /></li>
				<li><img src="./image/con5.jpg" alt="사진5" /></li>
				<li><img src="./image/con6.jpg" alt="사진6" /></li>
				<li>
					<div class="con_txt">
						<h2 class="con_txt_tit">Like him이 '(으)라이큼'으로 들릴까?</h2>
						<p class="con_txt_text1">동영상 강좌</p>
						<p class="con_txt_text2">17년간 대한민국의 영어 발음 교과서로<br />
						사랑받아온 미국 영어발음 무작정 따라하기를 동영상 강좌로도 만나보세요.</p>
						<a class="con_txt_button" href="#">보기</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="social">
		<div class="social_box">
			<h2 class="social_tit">소셜 미디어에서 만나는 길벗</h2>
			<ul class="social_img">
				<li><img src="./image/so1.jpg" alt="사진1" /><br />
					<p><a href="#">현직 번역가의 "문장의 완성도"를 높여준학습법</a></p>
				</li>
				<li><img src="./image/so2.jpg" alt="사진2" /><br />
					<p><a href="#">영어 면접 뽀개기 1탄!&#60;자기소개 편&#62;</a></p>
				</li>
				<li><img src="./image/so3.jpg" alt="사진3" /><br />
					<p><a href="#">심리상담가가말하는 '무기력에서 벗어나는 아주 간단한 행동'</a></p>
				</li>
				<li><img src="./image/so4.jpg" alt="사진4" /><br />
					<p><a href="#">저 지금 다이어트 중인데, 파스타 먹어도 괜찮을까요?ㅠㅠ</a></p>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="other">
		<h2 class="other_tit">다른 것을 찾고 계신가요?</h2>
		<ul class="other_icon">
			<li><a href=""><img src="./image/icon1.png" alt="아이콘1" /></a><br />
				<span>길벗 교과서</span>
			</li>
			<li><a href=""><img src="./image/icon2.png" alt="아이콘2" /></a><br />
				<span>저자 모집</span>
			</li>
			<li><a href=""><img src="./image/icon3.png" alt="아이콘3" /></a><br />
				<span>교수/강사 자료실</span>
			</li>
			<li><a href=""><img src="./image/icon4.png" alt="아이콘4" /></a><br />
				<span>견본도서 신청</span>
			</li>
			<li><a href=""><img src="./image/icon5.png" alt="아이콘5" /></a><br />
				<span>FAQ</span>
			</li>
			<li><a href=""><img src="./image/icon6.png" alt="아이콘6" /></a><br />
				<span>이벤트 / 설문 / 모집</span>
			</li>
		</ul>
	</div>
</body>
</html>