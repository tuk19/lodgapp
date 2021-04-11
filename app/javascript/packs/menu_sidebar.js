
jQuery(document).on("turbolinks:load", function(){
    $("#view_sidebar").on("click", (function(){
        $("#sidebar").css("display", "block");
    }))
})

// $(function(){
//     $("#view_sidebar").on("click", (function(){
//         $("#sidebar").addClass
//         $("#sidebar").css("display", "block");
//     }))
// })
