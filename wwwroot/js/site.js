function corazonClick(id) {
    $.ajax({
        type: 'POST',
        url: '/Home/ToggleFavorito',
        data: { idPubli: id },
        dataType: 'json',
        success: function (response) {
            if (response && response.contadorLikes !== undefined) {
                let updatedLikes = response.contadorLikes;
                let button = $('#like-button-' + id);
                let likeCount = button.find('span');

                likeCount.text(updatedLikes);

                if (button.html().includes("&#9825;")) {
                    button.html(button.html().replace("&#9825;", "&#9829;"));
                } else {
                    button.html(button.html().replace("&#9829;", "&#9825;"));
                }
            } else {
                console.error('Invalid server response:', response);
            }
        },
        error: function (error) {
            console.error('AJAX error:', error);
        }
    });
}