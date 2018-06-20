
document.addEventListener("turbolinks:load", function(){
    var moretext = "...read more";
    var lesstext = "read less";

    var tag= document.getElementsByClassName("read-more");
    var area= document.getElementsByClassName("text");

    $(".read-more").click(function(){
        var $elem = $(this).parent().find(".text-body");
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
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
    });

    for (var i=0;i<5;i++){
        if (area[i].offsetHeight <= 150){
            tag[i].style.display = "none";
        }
    }




});
