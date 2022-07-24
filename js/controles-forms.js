// CONTROLES DEL FORMULARIO
// Esto hace que cuando se seleccione un radio especifico habilité el input text y cuando no se deshabilite
// Agregar onchange="tipoApoyo()" en cada radio
function tipoApoyo() {
    let result = document.querySelector('input[name="apoyo"]:checked').value;
    if (result == "otro") {
        document.getElementById("otro").removeAttribute('disabled');
    }
    else {
        document.getElementById("otro").setAttribute('disabled', true);
        document.getElementById("otro").value = "";
    }
};

function estadoSolicitud() {
    let result = document.querySelector('input[name="solicitud"]:checked').value;
    if (result == "no") {
        document.getElementById("solicitudDesc").removeAttribute('disabled');
    }
    else {
        document.getElementById("solicitudDesc").setAttribute('disabled', true);
        document.getElementById("solicitudDesc").value = "";
    }
};

function datosBeneficiario() {
    let result = document.querySelector('input[name="beneficiario"]:checked').value;
    let nombre = document.getElementById("nombre").value;
    let apPaterno = document.getElementById("apPaterno").value;
    let apMaterno = document.getElementById("apMaterno").value;
    let cump = document.getElementById("fechaCump").value;
    let curp = document.getElementById("curp").value;
    let clave = document.getElementById("claveEl").value;
    let seccion = document.getElementById("seccion").value;
    let direccion = document.getElementById("direccion").value;
    let cp = document.getElementById("cp").value;

    if (result == "si") {        
        document.getElementById("apPaternoBen").setAttribute('disabled', true);
        document.getElementById("apMaternoBen").setAttribute('disabled', true);
        document.getElementById("nombreBen").setAttribute('disabled', true);
        document.getElementById("fechaCumpBen").setAttribute('disabled', true);
        document.getElementById("curpBen").setAttribute('disabled', true);
        document.getElementById("claveElBen").setAttribute('disabled', true);
        document.getElementById("seccionBen").setAttribute('disabled', true);
        document.getElementById("direccionBen").setAttribute('disabled', true);
        document.getElementById("cpBen").setAttribute('disabled', true);
        document.getElementById("apPaternoBen").value = apPaterno;
        document.getElementById("apMaternoBen").value = apMaterno;
        document.getElementById("nombreBen").value = nombre;
        document.getElementById("fechaCumpBen").value = cump;
        document.getElementById("curpBen").value = curp;
        document.getElementById("claveElBen").value = clave;
        document.getElementById("seccionBen").value = seccion;
        document.getElementById("direccionBen").value = direccion;
        document.getElementById("cpBen").value = cp;
    }
    else {
        document.getElementById("apPaternoBen").removeAttribute('disabled');
        document.getElementById("apMaternoBen").removeAttribute('disabled');
        document.getElementById("nombreBen").removeAttribute('disabled');
        document.getElementById("fechaCumpBen").removeAttribute('disabled');
        document.getElementById("curpBen").removeAttribute('disabled');
        document.getElementById("claveElBen").removeAttribute('disabled');
        document.getElementById("seccionBen").removeAttribute('disabled');
        document.getElementById("direccionBen").removeAttribute('disabled');               
        document.getElementById("cpBen").removeAttribute('disabled');               
        document.getElementById("apPaternoBen").value = "";
        document.getElementById("apMaternoBen").value = "";
        document.getElementById("nombreBen").value = "";
        document.getElementById("fechaCumpBen").value = "";
        document.getElementById("curpBen").value = "";
        document.getElementById("claveElBen").value = "";
        document.getElementById("seccionBen").value = "";
        document.getElementById("direccionBen").value = "";
        document.getElementById("cpBen").value = "";
    }
};

// Con estos válido que cada que cambie el texto de los datos del solicitante, también se actualicen los del benificiario, en caso de ser el mismo
document.querySelector('input[id="apPaterno"]').addEventListener("change", function () {
    var estadoBen = document.querySelector('input[name="beneficiario"]:checked').value;

    if (estadoBen == "si") {
        datosBeneficiario();
    }
});
document.querySelector('input[id="apMaterno"]').addEventListener("change", function () {
    var estadoBen = document.querySelector('input[name="beneficiario"]:checked').value;

    if (estadoBen == "si") {
        datosBeneficiario();
    }
});
document.querySelector('input[id="nombre"]').addEventListener("change", function () {
    var estadoBen = document.querySelector('input[name="beneficiario"]:checked').value;

    if (estadoBen == "si") {
        datosBeneficiario();
    }
});
document.querySelector('input[id="fechaCump"]').addEventListener("change", function () {
    var estadoBen = document.querySelector('input[name="beneficiario"]:checked').value;

    if (estadoBen == "si") {
        datosBeneficiario();
    }
});
document.querySelector('input[id="curp"]').addEventListener("change", function () {
    var estadoBen = document.querySelector('input[name="beneficiario"]:checked').value;

    if (estadoBen == "si") {
        datosBeneficiario();
    }
});
document.querySelector('input[id="claveEl"]').addEventListener("change", function () {
    var estadoBen = document.querySelector('input[name="beneficiario"]:checked').value;

    if (estadoBen == "si") {
        datosBeneficiario();
    }
});
document.querySelector('input[id="seccion"]').addEventListener("change", function () {
    var estadoBen = document.querySelector('input[name="beneficiario"]:checked').value;

    if (estadoBen == "si") {
        datosBeneficiario();
    }
});
document.querySelector('input[id="direccion"]').addEventListener("change", function () {
    var estadoBen = document.querySelector('input[name="beneficiario"]:checked').value;

    if (estadoBen == "si") {
        datosBeneficiario();
    }
});
document.querySelector('input[id="cp"]').addEventListener("change", function () {
    var estadoBen = document.querySelector('input[name="beneficiario"]:checked').value;

    if (estadoBen == "si") {
        datosBeneficiario();
    }
});
