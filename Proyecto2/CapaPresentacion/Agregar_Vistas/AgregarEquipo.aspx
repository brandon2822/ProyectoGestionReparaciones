<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarEquipo.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Agregar_Vistas.AgregarEquipo" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agregar Equipo</title>
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
            <h1>Agregar Equipo</h1>
            <br />
            <div class="textboxs">
                <label for="txtT">Tipo Equipo:</label>
                <asp:TextBox ID="txtTEquipo" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtM">Modelo:</label>
                <asp:TextBox ID="txtModelo" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtID">ID de Usuario dueño del equipo:</label>
                <asp:TextBox ID="txtUsuarioID" runat="server" CssClass="input-box"></asp:TextBox>
            </div>

            <!-- Botón "Añadir" -->
            <div class="button-container">
                <asp:Button ID="btnAñadir" runat="server" Text="Añadir" CssClass="add-button" OnClick="btnAñadir_Click" />
            </div>

            <div class="datagrid-container">
                <asp:GridView ID="datagridEquipo" runat="server" CssClass="datagrid">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
