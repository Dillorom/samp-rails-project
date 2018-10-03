$(function(){
    $("#load_comments").on("click", function(e){
        
        e.preventDefault();
    $.ajax({
        method: 'GET',
        url: this.href
    }).done(function(response){
        $("#comments").html(response)
    });

    
    })
})


$(function(){
    $("#new_comment").on("submit", function(e){
        e.preventDefault();
        ///error online 15 }
        $.ajax({
            type: ($("input[name='_method']").val() || this.method),
            url: this.action,
            data: $(this).serialize(), 
            success: function(response){
                debugger
                $("#comment_content").val("");
                var $ol = $("#comments ol")
                $ol.append(response);
                }
        });
        
        })
});


