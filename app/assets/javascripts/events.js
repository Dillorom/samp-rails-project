$( document ).on('turbolinks:load', function() {
    $("#load_comments").on("click", function(e){
        e.preventDefault();
        //
        $.ajax({
            method: 'GET',
            url: this.href + ".json",
            data: $(this).serialize()
        }).done(function(data){
            
            
            var $ol = $("#comments ol")
            $ol.html("") 
            
            data.forEach(function(comment){
                //debugger
                
                $ol.append(`<li> ${comment.user.username} says: <em>${comment.content}</em> </li>`);
            })
            
        });
    })


    $("#new_comment").on("submit", function(e){
        e.preventDefault();
        $.ajax({
            type: ($("input[name='_method']").val() || this.method),
            url: this.href + ".json",
            data: $(this).serialize(),
            dataType: "json", 
            success: function(data){
                debugger
                $("#comments").val("");
                var $ol = $("#comments ol");
                data.forEach(function(comment){
                    //debugger
                    $ol.append(`<li> ${comment.user.username} says: <em>${comment.content}</em> </li>`);
                })
            }
        });
    });
})





