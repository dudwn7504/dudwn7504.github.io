$(document).ready(function(){
		//window, document, history, location, navigator, this, 그 밖에 사용자 정의 객체는 ""가 붙지 않는다.
		//$("선택자").메서드(인수);
		//$(객체).메서드(인수);
		//$("선택자").메서드(function() { 실행문장;});
		//$(객체).메서드(function() { 실행문장;});
		//$("선택자").메서드(인수).메서드().메서드();
		//$$(객체).메서드(인수).메서드().메서드();
	
		//var 변수명 = 초기값;	---- 변수정의
		//function 함수명(매개변수1, 매개변수2) { 실행문장; }  ---- 함수정의
		//var 함수명 = function() {실행문장; }  ---- 함수정의
		//함수명();	----- 함수호출
		var wd = parseInt($(window).width());	//전역변수
		function ani() {	//ani 함수 정의
			var cnt = 0;	//지역변수
		$(".img_box").not(":animated").animate({"margin-left":-1600+"px"}, 400, function(){
			$(".img_box li").eq(0).appendTo($(".img_box"));
			$(".img_box").css("margin-left", "0px");
		});
		/*
		 * $("선택자").not(":animated").animate({"css속성", "css값"}, 밀리초단위시간, fuction()
		 * { 애니메이션이끝나고할일; } );
		 */
	}
	//setInterval(function() { 해야할일; }, 밀리초단위주기시간);  -- 지정한 시간마다 주기적으로 실행
	//var 인터발변수 = 인터발선언문~~~~~;	--- 필요시 인터발 해제하기 위해 인터발변수가 필요함
	var intv = setInterval(function(){ 
		ani();	//함수 호출 
	}, 7000);
});
$(document).ready(function(){  });