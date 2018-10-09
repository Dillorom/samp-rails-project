$(function(){
    $("#load_comments").on("click", function(e){
        e.preventDefault();
        
        $.ajax({
            method: 'GET',
            url: this.href + ".json",
            data: $(this).serialize()
        }).done(function(data){
            
            var $ol = $("div.comments ol")
            $ol.html("") 
            
            data.forEach(function(comment){
                debugger
                 
                $ol.append("<li>" + "comment.username says: " + comment.content + "</li>");
            })
            
        });
    })
})


// $(function(){
//     $("#new_comment").on("submit", function(e){
//         e.preventDefault();
        
//         $.ajax({
//             type: ($("input[name='_method']").val() || this.method),
//             url: this.action + ".json",
//             data: $(this).serialize(),
//             dataType: "json", 
//             success: function(data){
//                 debugger
//                 $("#comments").val("");
//                 var $ol = $("#comments ol");
//                 data.forEach(function(comment){
//                     $ol.append("<li>" + "username says:" + comment.content + "</li>");
//                 })
                
//             })
//         });
              
//     });
// })


