document.addEventListener("turbolinks:load", function(){
    var intro= document.getElementById("introduction");
    var intro_form= document.getElementsByClassName("intro-control")[0];
    var intro_submit = document.getElementsByClassName("intro-control-submit")[0];
    var intro_cancel = document.getElementById("user_profile_cancel_btn");

    $('.edit-intro-btn').click(function(){
        intro.style.display="none";
        intro_form.style.display="block";
        intro_submit.style.display="block";
        intro_cancel.style.display="block";
    });

    $('#user_profile_cancel_btn').click(function(){
        intro.style.display="block";
        intro_form.style.display="none";
        intro_submit.style.display="none";
        intro_cancel.style.display="none";

    });

    var update = document.getElementsByClassName("update");


    for (var i = 0; i < update.length; i++){
        var reply = update[i].getElementsByClassName("updatereply");
        var count = 0;
        var childcount = 0;
        var index = 0;
        var parentComment = null;
        for (var j = 0; j < reply.length; j++){
            var content=$(".updatereply")[j];

            if ($(content).parent().parent().is(".update")){
                parentComment = $(content).attr('id');
                childcount = 0;
                index = 0;
                count++;
                if (count > 3){
                    document.getElementsByClassName("show_more_comment")[i].style.display="block";
                    reply[j].style.display = "none";
                }
            }


            if ($(content).parent().parent().is('#'+parentComment)){
                if (index === 0){
                    index = j;
                }
                childcount++;
                if (childcount > 0){
                    document.getElementsByClassName("show_more_reply")[index - 1].style.display="block";
                    reply[j].style.display = "none";

                }
            }

        }

    };

    $('.show_more_comment').click(function(){
        var $elem = $(this).parent().find('ul').find('.updatereply');


        for (var a=0;a<$elem.length;a++){
            var content = $elem[a];
            if ($(content).parent().parent().is(".update")){
                content.style.display="block";
            }
            //$elem[a].style.display="block";
        }
        $(this).hide();
    });

    $('.show_more_reply').click(function(){
        var $elem2 = $(this).parent().find('ul').find('.updatereply');


        for (var a=0;a<$elem2.length;a++) {
            var content2 = $elem2[a];
            content2.style.display = "block";
        }
        $(this).hide();
    });

    $('#setting_div').click(function(){

        var avatar= document.getElementById("change_avatar");
        var password = document.getElementById("change_password");

        if (avatar.style.display === "block"){
            avatar.style.display = "none";
            password.style.display = "none";
        }else{
            avatar.style.display="block";
            password.style.display="block";
        }

    });


});



function search_post_user(){
    var input, filter, ul, li, a, i;
    input = document.getElementById("user_post_search");
    filter = input.value.toUpperCase();
    ul = document.getElementsByClassName("user_body_posts_ul")[0];
    li = ul.getElementsByClassName("user_body_posts_li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByClassName("user_body_posts_title")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
};

function search_comments_user(){
    var input, filter, ul, li, a, i;
    input = document.getElementById("user_comments_search");
    filter = input.value.toUpperCase();
    ul = document.getElementsByClassName("user_body_comments_ul")[0];
    li = ul.getElementsByClassName("user_body_comments_li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByClassName("user_body_comments_content")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
};

function search_follow_user(){
    var input, filter, ul, li, a, i;
    input = document.getElementById("follow_user_search");
    filter = input.value.toUpperCase();
    ul = document.getElementsByClassName("follow_ul")[0];
    li = ul.getElementsByClassName("member_li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByClassName("member_name")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
};

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#img_prev')
                .attr('src', e.target.result)
                .height(150);
        };

        reader.readAsDataURL(input.files[0]);
    }
}