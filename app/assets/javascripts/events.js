$( document ).on('turbolinks:load', function(){

    attachListeners();
})

var attachListeners = function() {

    //Loads all comments through AJAX

    $("#load_comments").on("click", function(e){
        e.preventDefault();
        $.ajax({
            method: 'GET',
            url: this.href + ".json",
            //data: $(this).serialize()
        }).done(function(data){
            const $ol = $("#comments ol")
            $ol.html("") 
            data.forEach(function(comment){
                $ol.append(`<li> ${comment.user.username} says: <em>${comment.content}</em> </li>`);
            })
        })
        .error(function(error){
            alert("There was an error!")
        });
    })

    //Post a comment through AJAX

    $("#new_comment").on("submit", function(e){
        e.preventDefault();
        $.ajax({
            type: ($("input[name='_method']").val() || this.method),
            url: this.action + ".json",
            data: $(this).serialize(),
            success: function(data){
                const comment = new Comment(data); // creates a new object from object constructor
                $("#comments").append(comment.renderComment())
                $("#sub").removeAttr('disabled') //to clean comment box from the last comment
            }
        })
        .error(function(error){
            alert("There was an error!")
        });
    });

    // old way of creating an object
    // function Comment(attributes) {
    //     this.content = attributes["content"];
    //     this.user = attributes["user"];
    //     this.user.username = attributes["user"]["username"]
    // }
    
     //Sets a method on object prototype to save memory

    // Comment.prototype.renderComment = function() {
    //     const $ol = $("#comments ol");
    //     $ol.append("<li>"+ this.user.username + " says: " +  "<em>" + this.content + "</em> </li>");
    //     $("#comment_content").val("");
    // }

    //ES6 way of declaring an object using class constructor
    class Comment {
        constructor(attributes){
            this.content = attributes["content"];
            this.user = attributes["user"];
            this.user.username = attributes["user"]["username"]
        }
        //Sets a method on object prototype to save memory
        renderComment() {
            const $ol = $("#comments ol");
            $ol.append("<li>"+ this.user.username + " says: " +  "<em>" + this.content + "</em> </li>");
            $("#comment_content").val("");
        }
        
    }
    
    
    //Loads the next event page through AJAX

    $(".js-next").on("click", function() {
        const nextId = parseInt($(".js-next").attr("event_id")) + 1;
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

      //Loads the previous event page through AJAX

      $(".js-prev").on("click", function() {
        const prevId = parseInt($(".js-prev").attr("event_id")) - 1;
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

      //Loads the list of attendees through AJAX
      
      $("#load_attendees").on("click", function(e){
        e.preventDefault();
        
        $.ajax({
            method: 'GET',
            url: this.href + ".json",
            data: $(this).serialize()
        }).done(function(data){
                const $ul = $("#attendees ul")
                $ul.html("") 
                data.forEach(function(attendee){
                    $ul.append("<li>" + attendee.user.username + "</li>");
                })
        })
        .error(function(error){
            alert("There was an error!")
        });
    });
    
}









