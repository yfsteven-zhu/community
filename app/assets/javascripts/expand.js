
document.addEventListener("turbolinks:load", function(){
    var moretext = "...read more";
    var lesstext = "read less";

    var tag= document.getElementsByClassName("read-more");
    var area= document.getElementsByClassName("posttext");
    var style= document.getElementsByClassName("expand-style");

    $(".read-more").click(function(){
        var $elem = $(this).parent().find(".text-body");
        var $hide_style = $(this).parent().find(".expand-style");
        var hide =$hide_style[0];
        hide.style.display="none";
        if($elem.hasClass("short"))
        {
            $elem.removeClass("short").addClass("full");
        }
        else
        {
            $elem.removeClass("full").addClass("short");
        }
        if($(this).hasClass("less")){
            $(this).removeClass("less");
            $(this).html(moretext);
            hide.style.display="block";
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
    });

    for (var i=0;i<5;i++){
        if (area[i].offsetHeight <= 150){
            tag[i].style.display = "none";

            style[i].style.display = "none";
        }
    }




});
