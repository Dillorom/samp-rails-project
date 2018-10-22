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
            data.attending_events.sort(function(a, b) {
                var nameA = a.name.toUpperCase(); // ignore upper and lowercase
                var nameB = b.name.toUpperCase(); // ignore upper and lowercase
                if (nameA < nameB) {
                  return -1;
                }
                if (nameA > nameB) {
                  return 1;
                }
                return 0;
              });
            data.attending_events.forEach(function(event){
                $ul.append(`<li> ${event.name} </li> `)
                //need to give links to events <a href=${events/event.id}>
            })
        })
    })
}


