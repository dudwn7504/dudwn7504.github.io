//사이드메뉴바에서 메뉴클릭시 해당화면으로 이동
$(function() {    
    $(".menu li:eq(0)").click(function(){
    $("html,body").animate({ scrollTop: 1200* $(this).index() });
    });
    $(".menu li:eq(1)").click(function(){
        $("html,body").animate({ scrollTop: 755* $(this).index() });
    });
    $(".menu li:eq(2)").click(function(){
        $("html,body").animate({ scrollTop: 770* $(this).index() });
    });
    $(".menu li:eq(3)").click(function(){
        $("html,body").animate({ scrollTop: 860* $(this).index() });
    });
    $(".menu li:eq(4)").click(function(){
        $("html,body").animate({ scrollTop: 1115* $(this).index() });
    });
    // $(".menu li:last").click(function(){
    //     $("html,body").animate({ scrollTop: 1420* $(this).index() });
    // });
});

//사이드메뉴바에 해당화면에 해당하는 메뉴가 bold가 됨.
$(document).ready(function() {
    $(window).scroll(function() {
        var idx = $(document).scrollTop();
        var menu1 = $("#page1").height();
        var menu2 = menu1+$("#page2").height();
        var menu3 = menu2+$("#page3").height();
        var menu4 = menu3+$("#page4").height();
        var menu5 = menu4+$("#page5").height();

        if(idx < menu1) {
            $("#intro").addClass("on");
            $("#profile").removeClass("on");
            $("#myAbility").removeClass("on");
            $("#portfolio").removeClass("on");
            $("#contact").removeClass("on");
        } else if(idx < menu2) {
            $("#profile").addClass("on");
            $("#intro").removeClass("on");
            $("#myAbility").removeClass("on");
            $("#portfolio").removeClass("on");
            $("#contact").removeClass("on");
        } else if(idx < menu3) {
            $("#myAbility").addClass("on");
            $("#intro").removeClass("on");
            $("#profile").removeClass("on");
            $("#portfolio").removeClass("on");
            $("#contact").removeClass("on");
        } else if(idx < menu4) {
            $("#portfolio").addClass("on");
            $("#intro").removeClass("on");
            $("#profile").removeClass("on");
            $("#myAbility").removeClass("on");
            $("#contact").removeClass("on");
        } else if(idx < menu5) {
            $("#contact").addClass("on");
            $("#intro").removeClass("on");
            $("#profile").removeClass("on");
            $("#portfolio").removeClass("on");
            $("#myAbility").removeClass("on");
        } 
    });
});

//포트폴리오 해당항목 클릭시 작동하는 jquery
$(document).ready(function() {
    // $(".portpage_img").addClass("img_before");
    $(".img_tit:eq(0)").click(function() {
        $(this).animate({opacity:'0', marginLeft:'0px'},600);
        $(".portpage_img_box:eq(0)").animate({marginLeft:'0px',},600);
        $(".portpage_txt:eq(0)").delay(600).fadeIn(600);
    });
    $(".img_tit:eq(1)").click(function() {
        $(this).animate({opacity:'0', marginLeft:'0px'},600);
        $(".portpage_img_box:eq(1)").animate({marginLeft:'0px',},600);
        $(".portpage_txt:eq(1)").delay(600).fadeIn(600);
    });
    $(".img_tit:eq(2)").click(function() {
        $(this).animate({opacity:'0', marginLeft:'0px'},600);
        $(".portpage_img_box:eq(2)").animate({marginLeft:'0px',},600);
        $(".portpage_txt:eq(2)").delay(600).fadeIn(600);
    });
    $(".img_tit:eq(3)").click(function() {
        $(this).animate({opacity:'0', marginLeft:'0px'},600);
        $(".portpage_img_box:eq(3)").animate({marginLeft:'0px',},600);
        $(".portpage_txt:eq(3)").delay(600).fadeIn(600);
    });
});

//스킬파이 애니메이션
$(function() {
    $('.chart').kimsPieChart({
      scaleColor: "#ecf0f1",
      lineWidth: 20,
      lineCap: 'butt',
      barColor: '#1abc9c',
      trackColor: "#ecf0f1",
      size: 160,
      animate: 500
    });
  });
$(".chart").each(function(){
    let txt1 = $(this).attr("data-percent");
    $(this).html("<span>"+$(this).text()+"</span><span>"+txt1+"</span>");
    $(this).find("span").css("display", "block").css("text-align", "center");
    $(this).find("span").eq(0).css("padding-top", "33%");
});