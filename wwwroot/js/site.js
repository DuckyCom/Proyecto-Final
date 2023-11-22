document.addEventListener('DOMContentLoaded', function() {
    var posts = [
        {
            imageUrl: 'post_pic.jpg',
            caption: 'This is a post caption',
            time: '12:34 PM'
        }
    ];

    var container = document.querySelector('.container');

    posts.forEach(function(post) {
        var postDiv = document.createElement('div');
        postDiv.className = 'post';

        var img = document.createElement('img');
        img.src = post.imageUrl;
        img.alt = 'Post Pic';

        var postInfoDiv = document.createElement('div');
        postInfoDiv.className = 'post-info';

        var caption = document.createElement('span');
        caption.textContent = post.caption;

        var time = document.createElement('span');
        time.textContent = post.time;

        postInfoDiv.appendChild(caption);
        postInfoDiv.appendChild(time);

        postDiv.appendChild(img);
        postDiv.appendChild(postInfoDiv);

        container.appendChild(postDiv);
    });
});