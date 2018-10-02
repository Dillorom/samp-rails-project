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




