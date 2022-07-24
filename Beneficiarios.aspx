<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Beneficiarios.aspx.cs" Inherits="Beneficiarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- MainContent -->
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 whitetext">Sistema de Apoyos</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="Inicio.aspx">Inicio</a></li>
                    <li class="breadcrumb-item active">Beneficiarios</li>
                </ol>         
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-user-friends me-1" aria-hidden="true"></i>
                        Lista de Beneficiarios
                    </div>
                    <div class="card-body" id="tabla">                        
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

    <script src="js/Beneficiarios.js"></script>
</asp:Content>

