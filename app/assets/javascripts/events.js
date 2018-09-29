// (function(){
//     $("#read_comments").click(function() {
//         debugger
//     }
// })



// // var comments = json.get 
// // comments.shift()

// // ul = document.querySelector("id")

// // .append(comments.map(function () {

// // }))
debugger

(function(){
    $(a."#read_comments").on('click', function(e){ 
       
          $.get(this.href).success(function(json){
            
            var $ol =  $("div.comments ol")
            
            $ol.html("")
            
            // iterate over each comment in json
            //with each comment data, append an td to the ol with the comment content
            json.forEach(function(comment){
                $ol.append("<li> + comment.content + </li>");
                alert("it worked")
            });
           
        });
       
    e.preventDefault();
  })
})


