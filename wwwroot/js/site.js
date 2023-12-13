function corazonClick(id, contadorDeLikes) {
    $.ajax({
        type: 'POST',
        url: '/Home/ToggleFavorito',
        data: { idPubli: id },
        dataType: 'json',
        success: function (response) {
            if (response && response.ContadorLikes !== undefined) {
                let updatedLikes = response.ContadorLikes;
                let element = document.getElementById(id);
        
                if (element !== null) {
                    let contadorElement = element.closest('div').querySelector('p');
                    contadorElement.innerHTML = "Likes: " + updatedLikes;
        
                    if (element.innerHTML === "<h5>&#9825;</h5>") {
                        element.innerHTML = "<h5>&#9829;</h5>";
                    } else {
                        element.innerHTML = "<h5>&#9825;</h5>";
                    }
                } else {
                    console.error('Elemento no encontrado con el ID:', id);
                }
            } else {
                console.error('Respuesta de servidor no válida:', response);
            }
        }
        
    });
}

