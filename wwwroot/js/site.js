
function loadFeed() {
   
    var posts = $.getJSON("/api/posts");
  
    
    posts.done(function(data) {
  
      $("#feed").empty();
  
  
      data.forEach(function(post) {
  
        var postElement = $("<div class='post'></div>");
  
  
        postElement.append($("<img src='" + post.image + "' alt='" + post.title + "' />"));
  
     
        postElement.append($("<h3>" + post.title + "</h3>"));
  
        postElement.append($("<p>" + post.description + "</p>"));

        $("#feed").append(postElement);
      });
    });
  }
  
 
  loadFeed();
  