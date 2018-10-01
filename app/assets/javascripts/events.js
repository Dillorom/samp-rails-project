$(function(){
    $("#load_comments").on("click", function(e){
    $.ajax({
        method: 'GET',
        url: this.href
    }).done(function(response){
        $("#comments").html(response)
    });
    e.preventDefault();
    })
})





// $(function(){
//     //debugger
//    $("#load_comments").on("click", function(e){
//         e.preventDefault();
        
//        $.get(this.href, function(data){
//         var $ol = $("div.comments ol")
//         $ol.html("")
         
//         data.forEach(function(comment){
//         $ol.append("<li>" + comment.content + "</li>");
//       }).error(function(notNeeded){
//           alert("Error")
//         });
//     })
    
//        })
    
//   })



// $(function(){
//   $("#new_comment").on("submit", function(e){
//     $.ajax({
//       type: ($("input[name='_method']").val() || this.method),
//       url: this.action,
//       data: $(this).serialize();,
//       success: function(response){
//         $("#comment_content").val("");
//         var $ol = $("div.comments ol")
//         $ol.append(response);
//       }
//     });

//     e.preventDefault();
//   })
// });