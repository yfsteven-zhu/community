
document.addEventListener("turbolinks:load", function(){
    var moretext = "more...";
    var lesstext = "less";

    var updatereadmore=document.getElementsByClassName("read-more");
    var updatearea = document.getElementsByClassName("update-content");
    var style= document.getElementsByClassName("expand-style");

    $(".read-more").click(function(){
        var $elem = $(this).parent().find(".update-content");
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


    for (var j=0;j<updatereadmore.length;j++){
        if (updatearea[j].scrollHeight <= 67){
            updatereadmore[j].style.display = "none";

            style[j].style.display = "none";
        }
    }



});