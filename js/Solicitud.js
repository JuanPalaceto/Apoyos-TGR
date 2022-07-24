function Guardar() { 
    // Esta maravilla evita que se haga el submit, por lo que no refresca la página TuT 
    $('#form1').submit(function (e) {
        e.preventDefault();

        // Con esta línea me aseguro que todos lso campos estén llenos ;)
        // El botón que llame a esto debe ser de tipo submit, y quitarle que se envíe el form
        if ($("#form1")[0].checkValidity()) {
            var result = document.querySelector('input[name="beneficiario"]:checked').value;
            var result2 = document.querySelector('input[name="solicitud"]:checked').value;       
            var result3 = document.querySelector('input[name="apoyo"]:checked').value;
           
            var apPat = $("#apPaterno").val();
            var apMat = $("#apMaterno").val();
            var nombre = $("#nombre").val();
            var cumpl = $("#fechaCump").val();
            var curp = $("#curp").val();
            var claveEl = $("#claveEl").val();
            var seccion = $("#seccion").val();
            var direccion = $("#direccion").val();
            var cp = $("#cp").val();   
            var estatus = 0;

            var apPatBen = $("#apPaternoBen").val();
            var apMatBen = $("#apMaternoBen").val();
            var nombreBen = $("#nombreBen").val();
            var cumplBen = $("#fechaCumpBen").val();
            var curpBen = $("#curpBen").val();
            var claveElBen = $("#claveElBen").val();
            var seccionBen = $("#seccionBen").val();
            var direccionBen = $("#direccionBen").val();
            var cpBen = $("#cpBen").val(); 
            var estatusBen = 0;

            var fecha = $("#fechaRegistro").val();
            var numPer = $("#numPerSolApoy").val();
            var apoyo = "";
            var montoSol = $("#montoSol").val();
            var montoProp = $("#montoProp").val();
            var gestion = $("#gestion").val();
            var estado = 0;
            var desc = "";

            if (result2 == "si" && result == "si") {
                estatus = 1;
                estatusBen = 1;
                estado = 1;
            } else if (result2 == "si" && result == "no") {
                estatus = 0;
                estatusBen = 1;
                estado = 1;
            } else {
                estatus = 0;
                estatusBen = 0;
                estado = 0;
                desc = $("#solicitudDesc").val();
            }

            if (result3 == "1") {
                apoyo = "Salud";
            } else if (result3 == "2") {
                apoyo = "Educación";
            } else if (result3 == "3") {
                apoyo = "Alimentación";
            } else if (result3 == "4") {
                apoyo = "Deporte";
            } else {
                apoyo = $("#otro").val();
            }

            var obj = {};
            obj.apPat = apPat;
            obj.apMat = apMat;
            obj.nombre = nombre;
            obj.cumpl = cumpl;
            obj.curp = curp;
            obj.claveEl = claveEl;
            obj.seccion = seccion;
            obj.direccion = direccion;
            obj.cp = cp;
            obj.estatus = estatus;

            obj.apPatBen = apPatBen;
            obj.apMatBen = apMatBen;
            obj.nombreBen = nombreBen;
            obj.cumplBen = cumplBen;
            obj.curpBen = curpBen;
            obj.claveElBen = claveElBen;
            obj.seccionBen = seccionBen;
            obj.direccionBen = direccionBen;
            obj.cpBen = cpBen;
            obj.estatusBen = estatusBen;

            obj.fecha = fecha;
            obj.numPer = numPer;
            obj.apoyo = apoyo;
            obj.montoSol = montoSol;
            obj.montoProp = montoProp;
            obj.gestion = gestion;
            obj.estado = estado;
            obj.desc = desc;

            $.ajax({
                type: 'POST',
                url: 'Inicio.aspx/AgregarSolicitud',
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
                        MostrarCumples();
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
    obtenFecha();
    $("#numPerSolApoy").val("1");
    $("#apPaterno").val("") ;
    $("#apMaterno").val("");
    $("#nombre").val("");
    $("#fechaCump").val("");
    $("#curp").val("");
    $("#claveEl").val("");
    $("#seccion").val("");
    $("#direccion").val("");
    $("#cp").val(""); 
    $("#otro").val(""); 
    $("#otro").prop("disabled", true);

    $("#radioSalud").prop("checked", true);
    $("#radioSiBen").prop("checked", false);
    $("#radioNoBen").prop("checked", false);

    $("#apPaternoBen").val("");
    $("#apMaternoBen").val("");
    $("#nombreBen").val("");
    $("#fechaCumpBen").val("");
    $("#curpBen").val("");
    $("#claveElBen").val("");
    $("#seccionBen").val("");
    $("#direccionBen").val("");
    $("#cpBen").val("");
    $("#montoSol").val("");
    $("#gestion").val("");
    $("#montoProp").val("");

    $("#radioSiSol").prop("checked", true);
    $("#solicitudDesc").val(""); 
    $("#solicitudDesc").prop("disabled", true);
};

// Esto sirve para obtener la fecha de hoy
function obtenFecha() {
    var date = new Date();

    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();

    if (month < 10) month = "0" + month;
    if (day < 10) day = "0" + day;

    var today = year + "-" + month + "-" + day;


    document.getElementById('fechaRegistro').value = today;
};

window.onload = function () {
    // Esto asigna llama la función que asigna la fecha de hoy
    obtenFecha();
}