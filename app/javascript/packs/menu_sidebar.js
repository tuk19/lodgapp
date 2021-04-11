
jQuery(document).on("turbolinks:load", function(){
    $("#view_sidebar").on("click", (function(){
        var $sidebar = $("#sidebar");
        var p1_element = document.getElementById("sidebar");
        if($sidebar.hasClass("opened")){
            $sidebar.css("display", "none");
            $sidebar.removeClass("opened");
        }else{
            $sidebar.css("display", "block");
            $sidebar.addClass("opened");
        }
        // console.log(p1_element.classList.contains("opened"));
    }))
})

// $(function(){
//     $("#view_sidebar").on("click", (function(){
//         $("#sidebar").addClass
//         $("#sidebar").css("display", "block");
//     }))
// })
