     
    //  function ani() {
    //     $(".ban").not(":animated").animate({"margin-left":"-1280px"},500, function(){
    //         $(".ban li").eq(0).appendTo(".ban");
    //         $(".ban").css("margin-left","0");
    //     });
    // }

    // var intv = setInterval(function(){ ani(); }, 4000);    


    // function move() {
    //     $(".tuto_vs_ban").not(":animated").animate({"margin-left":"-1280px"},500, function(){
    //         $(".tuto_vs_ban li").eq(0).appendTo(".tuto_vs_ban");
    //         $(".tuto_vs_ban").css("margin-left","0");
    //     });
    // }
    
    // var intv = setInterval(function(){ move(); }, 4000);
    



    $(document).ready(function(){   //좌우슬라이딩-초 좌슬라이딩 인터발
        let n = $(".ban_li").length;
        let wd = parseInt($(".ban li").width());
        let ra = wd*-1;
        console.log(wd);
        let itv = setInterval(function(){ lSlide(); }, 4000);
        $(".ban_right_btn").click(function(){
            clearInterval(itv);
            lSlide();
            itv = setInterval(function(){ lSlide(); }, 4000);
        });
        $(".ban_left_btn").click(function(){
            clearInterval(itv);
            rSlide();
            itv = setInterval(function(){ lSlide(); }, 4000);
        });
        function lSlide(){
            $(".ban").not(":animated").animate({"margin-left":+ra+"px"},500,
                function(){
                    $(".ban_li").eq(0).appendTo($(".ban"));
                    $(".ban").css("margin-left","0px");
                });
            
        }
        function rSlide(){
            $(".ban").css("margin-left",ra+"px");
            $(".ban_li").eq(n-1).prependTo($(".ban"));
            $(".ban").not(":animated").animate({"margin-left":"0px"}, 500);
        }
    });


    //튜토리얼배너
    $(document).ready(function(){   //좌우슬라이딩-초 좌슬라이딩 인터발
        let n = $(".tuto_ban_li").length;
        let wd = parseInt($(".tuto_vs_ban li").width());
        let ra = wd*-1;
        console.log(wd);
        let itv = setInterval(function(){ lSlide(); }, 4000);
        $(".tuto_ban_right_btn").click(function(){
            clearInterval(itv);
            lSlide();
            itv = setInterval(function(){ lSlide(); }, 4000);
        });
        $(".tuto_ban_left_btn").click(function(){
            clearInterval(itv);
            rSlide();
            itv = setInterval(function(){ lSlide(); }, 4000);
        });
        function lSlide(){
            $(".tuto_vs_ban").not(":animated").animate({"margin-left":+ra+"px"},500,
                function(){
                    $(".tuto_ban_li").eq(0).appendTo($(".tuto_vs_ban"));
                    $(".tuto_vs_ban").css("margin-left","0px");
                });
            
        }
        function rSlide(){
            $(".tuto_vs_ban").css("margin-left",ra+"px");
            $(".tuto_ban_li").eq(n-1).prependTo($(".tuto_vs_ban"));
            $(".tuto_vs_ban").not(":animated").animate({"margin-left":"0px"}, 500);
        }
    });
   