$( document ).on('turbolinks:load', function(){
    $("#load_comments").on("click", function(e){
        e.preventDefault();
        $.ajax({
            method: 'GET',
            url: this.href + ".json",
            data: $(this).serialize()
        }).done(function(data){
            var $ol = $("#comments ol")
            $ol.html("") 
            data.forEach(function(comment){
                $ol.append(`<li> ${comment.user.username} says: <em>${comment.content}</em> </li>`);
            })
        });
    })


    $("#new_comment").on("submit", function(e){
        e.preventDefault();
        $.ajax({
            type: ($("input[name='_method']").val() || this.method),
            url: this.action + ".json",
            data: $(this).serialize(),
            success: function(data){
                var $ol = $("#comments ol");
                $ol.append(`<li> ${data.user.username} says: <em>${data.content}</em> </li>`);
                $("#comment_content").val("");
            }
        });
    });


    $(".js-next").on("click", function() {
        var nextId = parseInt($(".js-next").attr("event_id")) + 1;
        $.get("/events/" + nextId + ".json", function(data) {
          $(".eventName").html("What: " + data["name"]);
          $(".eventTime").html("When: " + data["time"]);
          $(".eventLocation").html("Where: " + data["location"]);
          $(".eventDetails").html("Details: " + data["details"]);
          $(".eventLink").html("Further Info: " + data["url"]);
          $(".eventImage").html("Image: " + data["image"]);
          $(".js-next").attr("event-id", data["id"]);
        });
        return false
      });
})





//   $(".js-previous").on("click", function() {
//     $(".editLink").html('');
//     var nextId = parseInt($(".js-next").attr("review-id")) - 1;
//     $.get("/reviews/" + nextId + ".json", function(data) {

//       $(".movieTitle").html("Movie Title: " + data["movie"]["title"]);
//       $(".reviewTitle").html("Review Title: " + data["title"]);
//       $(".reviewContent").html("Review Content: " + data["content"]);
//       $(".reviewRating").html("Rating: " + data["rating"]);
//       // re-set the id to current on the link
//       $(".js-next").attr("review-id", data["id"]);
//     });
//     return false
//   });



