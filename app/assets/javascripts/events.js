$(function(){
    $("#load_comments").on("click", function(e){
        e.preventDefault();
        
        $.ajax({
            method: 'GET',
            url: this.href + ".json"
        }).done(function(response){
            
            var $ol = $("div.comments ol")
            $ol.html("") 
            
            response.forEach(function(comment){
                //debugger
                 
                $ol.append("<li>" + comment.content + "</li>");
            })
            
        });
    })
})


$(function(){
    $("#new_comment").on("submit", function(e){
        e.preventDefault();
        
        $.ajax({
            type: ($("input[name='_method']").val() || this.method),
            url: this.action + ".json",
            data: $(this).serialize(),
            dataType: "json", 
            success: function(response){
                debugger
                $("#comments").val("");
                var $ol = $("#comments ol");
                response.forEach(function(comment){
                    $ol.append("<li>" + "user.username says:" + comment.content + "</li>");
                })
                
            })
        });
              
    });
})


