<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- MainContent -->
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 whitetext">Sistema de Apoyos</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Inicio</li>
                </ol>
                <div class="card mb-5">
                    <div class="card-header">
                        <i class="fa-solid fa-file-alt me-1"></i>
                        Agregar Solicitud
                    </div>
                    <div class="card-body">
                        <%-- Esta es una solución por si se quiere a la izq.
                                            <div class="input-group-prepend me-3">
                                                <span class="align-middle">
                                                    Fecha:                                                
                                                </span>
                                            </div>--%>
                        <div class="row">
                            <div class="col-6 col-md-3 mt-auto">
                                <span>Fecha:</span>
                            </div>
                            <div class="col">
                                <span>No. de Personas que Solicitan el Apoyo o Gestión:</span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-6 col-md-3">
                                <input id="fechaRegistro" class="form-control" type="date" required />
                            </div>
                            <div class="col-md-2 col-3">
                                <input id="numPerSolApoy" class="form-control" type="number" min="1" max="999" value="1" required />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3 col-6">
                                <span>Apellido Paterno:</span>
                                <input id="apPaterno" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-3 col-6">
                                <span>Apellido Materno:</span>
                                <input id="apMaterno" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-3 col-6">
                                <span>Nombre(s):</span>
                                <input id="nombre" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-3 col-6">
                                <span>Fecha de Cumpleaños:</span>
                                <input id="fechaCump" class="form-control" type="date" min='1899-01-01' max='2022-12-01' required />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4 col-6">
                                <span>CURP:</span>
                                <input id="curp" class="form-control" type="text" minlength="18" maxlength="18" required />
                            </div>
                            <div class="col-md-4 col-6">
                                <span>Clave de Elector:</span>
                                <input id="claveEl" class="form-control" type="text" minlength="18" maxlength="18" required />
                            </div>
                            <div class="col-md-4 col-8">
                                <span>Sección:</span>
                                <input id="seccion" class="form-control" type="text" required />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12">
                                <span>Dirección:</span>
                                <input id="direccion" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-2 col-4">
                                <span>C.P.:</span>
                                <input id="cp" class="form-control" type="text" minlength="5" maxlength="5" onkeypress="return isNumberKey(event)" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <span>Tipo de Apoyo que Solicita:</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-check">
                                    <div class="form-check-inline" style="margin-right: 2rem;">
                                        <input class="form-check-input me-1" type="radio" name="apoyo" onchange="tipoApoyo()" value="1" id="radioSalud" checked />
                                        <label class="form-check-label" for="radioSalud">
                                            Salud
                                        </label>
                                    </div>
                                    <div class="form-check-inline" style="margin-right: 2rem;">
                                        <input class="form-check-input me-1" type="radio" name="apoyo" onchange="tipoApoyo()" value="2" id="radioEdu" />
                                        <label class="form-check-label" for="radioEdu">
                                            Educación
                                        </label>
                                    </div>
                                    <div class="form-check-inline" style="margin-right: 2rem;">
                                        <input class="form-check-input me-1" type="radio" name="apoyo" onchange="tipoApoyo()" value="3" id="radioAli" />
                                        <label class="form-check-label" for="radioAli">
                                            Alimentación
                                        </label>
                                    </div>
                                    <div class="form-check-inline" style="margin-right: 2rem;">
                                        <input class="form-check-input me-1" type="radio" name="apoyo" onchange="tipoApoyo()" value="4" id="radioDep" />
                                        <label class="form-check-label" for="radioDep">
                                            Deporte
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <input class="form-check-input me-1" type="radio" name="apoyo" id="radioOtro" value="otro" onchange="tipoApoyo()" />
                                        <label class="form-check-label" for="radioOtro">
                                            Otro (Especifique): 
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-7 col-md-5 col-12">
                                <input id="otro" class="form-control" type="text" disabled />
                            </div>
                        </div>
                        <br />
                        <hr class="dropdown-divider" />
                        <br />
                        <div class="row mb-3">
                            <div class="col-12">
                                <span>¿El Beneficiario es el Mismo que Solicita el Apoyo?</span>
                                <div class="form-check">
                                    <div class="form-check-inline" style="margin-right: 2rem;">
                                        <input class="form-check-input me-1" type="radio" name="beneficiario" id="radioSiBen" value="si" onchange="datosBeneficiario()" required />
                                        <label class="form-check-label" for="radioSiBen">
                                            Sí
                                        </label>
                                    </div>
                                    <div class="form-check-inline" style="margin-right: 2rem;">
                                        <input class="form-check-input me-1" type="radio" name="beneficiario" id="radioNoBen" value="no" onchange="datosBeneficiario()" />
                                        <label class="form-check-label" for="radioNoBen">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3 col-6">
                                <span>Apellido Paterno:</span>
                                <input id="apPaternoBen" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-3 col-6">
                                <span>Apellido Materno:</span>
                                <input id="apMaternoBen" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-3 col-6">
                                <span>Nombre(s):</span>
                                <input id="nombreBen" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-3 col-6">
                                <span>Fecha de Cumpleaños:</span>
                                <input id="fechaCumpBen" class="form-control" type="date" min='1899-01-01' max='2022-12-01' required />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4 col-6">
                                <span>CURP:</span>
                                <input id="curpBen" class="form-control" type="text" minlength="18" maxlength="18" required />
                            </div>
                            <div class="col-md-4 col-6">
                                <span>Clave de Elector:</span>
                                <input id="claveElBen" class="form-control" type="text" minlength="18" maxlength="18" required />
                            </div>
                            <div class="col-md-4 col-8">
                                <span>Sección:</span>
                                <input id="seccionBen" class="form-control" type="text" required />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12">
                                <span>Dirección:</span>
                                <input id="direccionBen" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-2 col-4">
                                <span>C.P.:</span>
                                <input id="cpBen" class="form-control" type="text" minlength="5" maxlength="5" onkeypress="return isNumberKey(event)" required />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-xxl-3 col-6 order-xxl-first order-first">
                                <span>Monto del Apoyo Solicitado:</span>
                                <div class="input-group mb-3">
                                    <span class="input-group-text">$</span>
                                    <input id="montoSol" type="number" class="form-control" aria-label="Amount (to the nearest dollar)" min="0" required />
                                </div>
                            </div>
                            <div class="col-md-6 col-6 order-xxl-1 order-last">
                                <span>Gestión:</span>
                                <input id="gestion" class="form-control" type="text" required />
                            </div>
                            <div class="col-xxl-3 col-6 order-xxl-last order-1">
                                <span>Monto del Apoyo Proporcionado:</span>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input id="montoProp" type="number" class="form-control" aria-label="Amount (to the nearest dollar)" min="0" required />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <span>¿Se Atendió la Solicitud?</span>
                                <div class="form-check">
                                    <div class="form-check-inline" style="margin-right: 2rem;">
                                        <input class="form-check-input me-1" type="radio" name="solicitud" id="radioSiSol" value="si" onchange="estadoSolicitud()" checked />
                                        <label class="form-check-label" for="radioSiBen">
                                            Sí
                                        </label>
                                    </div>
                                    <div class="form-check-inline" style="margin-right: 2rem;">
                                        <input class="form-check-input me-1" type="radio" name="solicitud" id="radioNoSol" onchange="estadoSolicitud()" value="no" />
                                        <label class="form-check-label" for="radioNoBen">
                                            No (Especifique)
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-7 col-md-5 col-12">
                                <textarea id="solicitudDesc" <%--style="resize: ;"--%> class="form-control" disabled></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input type="submit" class="btn btn-primary float-end" onclick="Guardar()" value="Guardar" />
                            </div>
                        </div>
                    </div>
                </div>

                <%-- Esto me va a servir después --%>
                <%--<div class="col-xl-5">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fa-solid fa-chart-pie me-1"></i>
                                        Porcentaje de Solicitudes Atendidas
                                    </div>
                                    <div class="card-body">
                                        <canvas id="myPieChart" width="100%" height="40"></canvas>
                                    </div>
                                </div>
                            </div>--%>

                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-calendar-days me-1" aria-hidden="true"></i>
                        Próximos Cumpleaños
                    </div>
                    <div class="card-body" id="tabla">                        
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="float-end">
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>                 
                            </div>                            
                            <div class="text-center">
                                <br />
                                <br />
                                <h5>Datos guardados correctamente</h5>
                                <br />
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <footer class="py-4 <%--bg-light--%> mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <%-- Quitar los ms y me si se agregan las politicas y condiciones --%>
                    <%--<div class="text-muted ms-auto me-auto">Copyright &copy; Juan Pablo Palaceto Céspedes</div>--%>
                    <%--<div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>--%>
                </div>
            </div>
        </footer>
    </div>

    <script src="js/controles-forms.js"></script>
    <script src="js/Solicitud.js"></script>
    <script src="js/reporteCumples.js"></script>
    <script src="js/datatables-simple-demo.js"></script>
</asp:Content>

