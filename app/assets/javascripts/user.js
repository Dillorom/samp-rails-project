$( document ).on('turbolinks:load', function(){

    attachUserListeners();
})

var attachUserListeners = function() {

    $("#load_rsvps").on("click", function(e){
        e.preventDefault();
        $.ajax({
            method: "GET",
            url: this.href + ".json"
        }).done(function(data){
            //debugger    
            })
    })
}