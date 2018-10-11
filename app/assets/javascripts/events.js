$( document ).on('turbolinks:load', function(){

    attachListeners();
})

var attachListeners = function() {
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
            $(".eventHeader").html("Your are viewing " + data["name"]);
            $(".eventName").html("What: " + data["name"]);
            $(".eventTime").html("When: " + data["time"]);
            $(".eventLocation").html("Where: " + data["location"]);
            $(".eventDetails").html("Details: " + data["details"]);
            $(".eventLink").html("Further Info: " + data["url"]);
            $(".eventImage").html("Picture: " + data["image"]);
            $(".js-next").attr("event-id", data["id"]);
        });
        return false
      });


      $(".js-prev").on("click", function() {
        var prevId = parseInt($(".js-prev").attr("event_id")) - 1;
        $.get("/events/" + prevId + ".json", function(data) {
            $(".eventHeader").html("Your are viewing " + data["name"]);
            $(".eventName").html("What: " + data["name"]);
            $(".eventTime").html("When: " + data["time"]);
            $(".eventLocation").html("Where: " + data["location"]);
            $(".eventDetails").html("Details: " + data["details"]);
            $(".eventLink").html("Further Info: " + data["url"]);
            $(".eventImage").html("Picture: " + data["image"]);
          $(".js-prev").attr("event-id", data["id"]);
        });
        return false
      });


      $("#load_attendees").on("click", function(e){
        e.preventDefault();
        $.ajax({
            method: 'GET',
            url: this.href + ".json",
            data: $(this).serialize()
        }).done(function(data){
                var $ul = $("#attendees ul")
                $ul.html("") 
                data.forEach(function(attendee){
                    $ul.append("<li>" + attendee.user.username + "</li>");
                    //(`<li> ${attendee.user.username} </li>`) what is the difference btw interpolating and just giving attendee?
                })
            })
        });
    
}









