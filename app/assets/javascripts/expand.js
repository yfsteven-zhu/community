
document.addEventListener("turbolinks:load", function(){


    var postreadmore= document.getElementsByClassName("readmore");
    var postarea= document.getElementsByClassName("posttext");
    var style= document.getElementsByClassName("expand-style");


    for (var i=0;i<postreadmore.length;i++){
        if (postarea[i].offsetHeight <= 50){
            postreadmore[i].style.display = "none";

            style[i].style.display = "none";
        }
    }


});
