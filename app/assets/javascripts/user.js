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
            const $ul = $("#attending_events ul") 
            $ul.html("") 
            const new_data = data.attending_events.map(function(event){
                return event.name})
            const sorted_data = new_data.sort();
            sorted_data.forEach(function(event){
                $ul.append(`<li> ${event} </li> `)
            })
        })
    })
}