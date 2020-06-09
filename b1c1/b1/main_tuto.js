function ani() {
    $(".tuto_vs_ban").not(":animated").animate({"margin-left":"-1280px"},500, function(){
        $(".tuto_vs_ban li").eq(0).appendTo(".tuto_vs_ban");
        $(".tuto_vs_ban").css("margin-left","0");
    });
}

var intv = setInterval(function(){ ani(); }, 4000);


