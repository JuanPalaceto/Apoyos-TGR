window.onload = function () {
    MostrarAgenda();
}

function MostrarAgenda() {  //aqui se crea la tabla
    $.ajax({
        type: 'POST',
        url: 'Agenda.aspx/Contactos',
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
            new simpleDatatables.DataTable("#tablaContactos");
        }
    });
}

function GuardarContacto() {
    // Esta maravilla evita que se haga el submit, por lo que no refresca la página TuT 
    $('#form1').submit(function (e) {
        e.preventDefault();

        // Con esta línea me aseguro que todos lso campos estén llenos ;)
        // El botón que llame a esto debe ser de tipo submit, y quitarle que se envíe el form
        if ($("#form1")[0].checkValidity()) {                        
            var apPat = $("#apPaterno").val();
            var apMat = $("#apMaterno").val();
            var nombre = $("#nombre").val();            
            var cumpl = $("#fechaCump").val();            
            var direccion = $("#direccion").val();
            var telefono = $("#tel").val();
            var sector = $("#sector").val();
            var seccion = $("#seccion").val();
            var asociacion = $("#asociacion").val();           

            var obj = {};          
            obj.apPat = apPat;
            obj.apMat = apMat;
            obj.nombre = nombre;            
            obj.cumpl = cumpl;
            obj.direccion = direccion;
            obj.telefono = telefono;
            obj.sector = sector;
            obj.seccion = seccion;
            obj.asociacion = asociacion;   

            $.ajax({
                type: 'POST',
                url: 'Agenda.aspx/AgregarContacto',
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error" + jqXHR.responseText);
                },
                success: function (valor) {
                    var JsonD = $.parseJSON(valor.d)
                    if (JsonD.success == 1) {
                        $("#myModal").modal("show");
                        Limpiar();
                        MostrarAgenda();
                        // Esto creo que no es necesario, no lo pienso quitar igual
                        return;
                    } else
                        if (JsonD.success == 2) {
                            alert('Por favor, revise que los datos sean correctos');
                        }
                }
            }); 

            //ESTO ES PARA RESETEAR EL FORM, DE OTRA FORMA EL AJAX SE EJECUTA LAS VECES QUE SE HAYA NEGADO CUANDO HACÍA CLICK, Y AL FINAL SE EJECUTABA MUCHAS VECES CUADNO AL FIN SALIA DE LA VALIDACIOPN // POR ESTO BATALLÉ HORAS, CUANDO VEA ALGO DUPLICADO AL HACCER VALIDACIONES Y CANCELAR EL SUBMIT, ES ESTO!!!! Está apicado al form 
            document.getElementById('form1').reset();
        }
    });
};

function Limpiar() {    
    $("#apPaterno").val("");
    $("#apMaterno").val("");
    $("#nombre").val("");   
    $("#fechaCump").val("");
    $("#direccion").val("");
    $("#tel").val("");
    $("#sector").val("");
    $("#seccion").val("");
    $("#asociacion").val("");
};