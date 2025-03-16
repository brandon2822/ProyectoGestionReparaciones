<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Agregar_Vistas.AgregarUsuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agregar Usuario</title>
    <link rel="stylesheet" href="../css/Agregar2.css" />
</head>
<body>
    <form runat="server">
        <!-- Hipervínculo adicional -->
        <div class="extra-link">
            <a href="../Inicio.aspx">Inicio</a>
        </div>

        <!-- Contenedor principal -->
        <div class="container">
            <h1>Agregar Usuario</h1>
            <br />
            <div class="textboxs">
                <label for="txtNombre">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtCorreo">Correo Electrónico:</label>
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtTelefono">Teléfono:</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="input-box"></asp:TextBox>
            </div>

            <!-- Botón "Añadir" -->
            <div class="button-container">
                <asp:Button ID="btnAñadir" runat="server" Text="Añadir" CssClass="add-button" OnClick="btnAñadir_Click" />
            </div>

            <div class="datagrid-container">
                <asp:GridView ID="datagrid" runat="server" CssClass="datagrid">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
