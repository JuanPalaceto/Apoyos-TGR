function MostrarCumples() {  //aqui se crea la tabla
    $.ajax({
        type: 'POST',
        url: 'Inicio.aspx/Cumples',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("Error" + jqXHR.responseText);
        },
        success: function (tabla) {
            //Ubica donde va a comanezar a escribir lo que trajo con el sb
            $("#tabla").html(tabla.d); //nombre del id del div de la tabla
            //Inicia la tabla incluida
            //$("#datatablesSimple").DataTable();
            //Inicia la tabla son datatables de jquery            
            //new simpleDatatables.DataTable("#datatablesSimple");                                 
            new simpleDatatables.DataTable("#datatablesSimple");            
        }
    });
}