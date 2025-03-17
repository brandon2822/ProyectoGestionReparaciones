<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Iniciar Sesion</title>
    <link rel="stylesheet" href="css/Agregar2.css" />
</head>
<body>
    <form runat="server">
        <!-- Contenedor principal -->
        <div class="container">
            <h1>Iniciar Sesion</h1>
            <br />
            <div class="textboxs">
                <label for="txtU">Usuario:</label>
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtC">Contraseña:</label>
                <asp:TextBox ID="txtContrasena" runat="server" CssClass="input-box"></asp:TextBox>

            
            </div>

            <!-- Botón "Añadir" -->
            <div class="button-container">
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="add-button" OnClick="btnIngresar_Click" />
            </div>

            
        </div>
    </form>
</body>
</html>
