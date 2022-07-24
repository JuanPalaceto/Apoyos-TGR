<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.: Sistema de Apoyos :.</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Sistema de Apoyos TGR" />
    <meta name="author" content="Juan Pablo Palaceto Céspedes" />
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body class="bg-dark">
    <form id="form_login" runat="server">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                        <h3 class="text-center font-weight-light mt-4">Bienvenido al Sistema</h3>
                                        <p class="text-center font-weight-light mb-4">Por favor inicie sesión</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" placeholder="Nombre de Usuario" required />
                                            <label for="txtUsuario">Usuario</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" TextMode="Password" placeholder="Contraseña" required />
                                            <label for="txtPass">Contraseña</label>
                                        </div>
                                        <div class="row mt-4 mb-0" style="margin-left:-7px;">
                                            <div id="divError" class="col-8 col-xxl-9 ms-2 my-auto alert-danger border border-danger rounded d-none" runat="server">
                                                <asp:Label ID="lblError" runat="server" />
                                            </div>
                                            <div class="col my-auto">
                                                <asp:Button ID="btnIngresar" CssClass="btn btn-primary float-end" Text="Ingresar" runat="server" OnClick="btnIngresar_Click" />
                                            </div>
                                        </div>
                                        <div class="d-flex float-end mt-4 mb-0">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </form>
</body>
</html>
