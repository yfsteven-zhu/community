document.addEventListener("turbolinks:load", function(){

    var post = document.getElementsByClassName("posttext");
    for (var i=0; i< post.length;i++){
        var img_list = post[i].getElementsByTagName("img");
        var width_setting = 0;

        for (var j = 0; j < img_list.length ;j++){
            var picture = post[i].getElementsByTagName("img")[j];
            document.getElementsByClassName("picture_slide")[i].appendChild(picture);
            picture.width = 20;
            width_setting += picture.width;
            if (width_setting >= 552){
                document.getElementsByClassName("picture_slide")[i].removeChild(picture);
                j = img_list.length;
            }
        }
    }



});