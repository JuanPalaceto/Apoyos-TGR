<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Solicitudes.aspx.cs" Inherits="Solicitudes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/Solicitudes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- MainContent -->
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 whitetext">Sistema de Apoyos</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="Inicio.aspx">Inicio</a></li>
                    <li class="breadcrumb-item active">Solicitudes</li>
                </ol>

                <%-- Esto me va a servir después --%>
                <div class="col-xl-5">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fa-solid fa-chart-pie me-1"></i>
                            Porcentaje de Solicitudes Atendidas
                        </div>
                        <div class="card-body">
                            <div id="tituloGrafica"></div>
                            <canvas id="myPieChart" width="100%" height="40"></canvas>
                        </div>
                        <div>
                            <%-- No se puede recuperar el texto con js de un label, tiene que estar en un contenedor de html, como span, div, etc --%>
                            <span id="atendida" hidden><asp:Label ID="lblAtendida" Text="" runat="server"/></span>
                            <span id="noAtendida" hidden><asp:Label ID="lblNoAtendida" Text="" runat="server"/></span>
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

</asp:Content>

