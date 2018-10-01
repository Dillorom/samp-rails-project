
(function(){
   debugger
   $("#load_comments").on("click", function(e){
    debugger
    $.ajax({
      method: "GET",
      url: this.href
    }).success(function(response){
      $("div.comments").html(response)
    }).error(function(notNeeded){
      alert("we broke!!!!")
    });
    $.get(this.href).success(function(json){
      var $ol = $("div.comments ol")
      $ol.html("") 
      json.forEach(function(comment){
        $ol.append("<li>" + comment.content + "</li>");
      })
    })
    e.preventDefault();
  })
})



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