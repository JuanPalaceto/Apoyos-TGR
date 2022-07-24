<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Agenda.aspx.cs" Inherits="Agenda" %>

<asp:Content ID="ContentHAgenda" ContentPlaceHolderID="head" runat="Server">   
</asp:Content>
<asp:Content ID="ContentAgenda" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- MainContent -->
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 whitetext">Sistema de Apoyos</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="Inicio.aspx">Inicio</a></li>
                    <li class="breadcrumb-item active">Agenda</li>
                </ol>
                <div class="card mb-5">
                    <div class="card-header">
                        <i class="fa-solid fa-user-plus me-1"></i>
                        Agregar Contacto
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-3 col-6">
                                <span>Nombre(s):</span>
                                <input id="nombre" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-3 col-6">
                                <span>Apellido Paterno:</span>
                                <input id="apPaterno" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-3 col-6">
                                <span>Apellido Materno:</span>
                                <input id="apMaterno" class="form-control" type="text" required />
                            </div>

                            <div class="col-md-3 col-6">
                                <span>Fecha de Cumpleaños:</span>
                                <input id="fechaCump" class="form-control" type="date" min='1899-01-01' max='2022-12-01' required />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6 col-12">
                                <span>Dirección:</span>
                                <input id="direccion" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-2 col-4">
                                <span>Teléfono:</span>
                                <input id="tel" class="form-control" type="tel" minlength="10" maxlength="10" onkeypress="return isNumberKey(event)" required />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4 col-6">
                                <span>Sector:</span>
                                <input id="sector" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-4 col-6">
                                <span>Sección:</span>
                                <input id="seccion" class="form-control" type="text" required />
                            </div>
                            <div class="col-md-4 col-6">
                                <span>Asociación:</span>
                                <input id="asociacion" class="form-control" type="text" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input type="submit" class="btn btn-primary float-end" onclick="GuardarContacto()" value="Guardar" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-address-book me-1" aria-hidden="true"></i>
                        Lista de Contactos
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
                                <h5>Contacto guardado correctamente</h5>
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

    <script src="js/Agenda.js"></script>
</asp:Content>

