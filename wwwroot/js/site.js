
function corazonClick(id) {

    $.ajax({
        type: 'POST',
        url: '/Home/ToggleFavorito',
        data: { idPubli : id},
        dataType: 'JSON',
        success: function (response) {

            let element = document.getElementById(id);
            if(element.innerHTML = "<h5>&#9825;</h5>")
            {
                element.innerHTML = "<h5>&#x1F497;</h5>"
            }

        }
    });
            
}