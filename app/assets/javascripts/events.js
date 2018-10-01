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

$(function(){
    $("#new_comment").on("submit", function(e){
        ///error online 15 }
        $.ajax({
            type: ($("input[name='_method']").val() || this.method),
            url: this.action,
            data: $(this).serialize();, 
            success: function(response){
                $("#comment_content").val("");
                var $ol = $("#comments ol")
                $ol.append(response);
                }
        });
        e.preventDefault();
        })
});


