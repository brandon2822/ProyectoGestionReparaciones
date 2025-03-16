<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarReparacion.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Agregar_Vistas.AgregarReparacion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agregar Reparacion</title>
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
            <h1>Agregar Reparacion</h1>
            <br />
            <div class="textboxs">
                <label for="txtID">ID de equipo a reparar:</label>
                <asp:TextBox ID="txtIDEquipo" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtF">Fecha de Solicitud:</label>
                <asp:TextBox ID="txtfecha" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtE">Estado:</label>
                <asp:TextBox ID="txtEstado" runat="server" CssClass="input-box"></asp:TextBox>
            </div>

            <!-- Botón "Añadir" -->
            <div class="button-container">
                <asp:Button ID="btnAñadir" runat="server" Text="Añadir" CssClass="add-button" OnClick="btnAñadir_Click" />
            </div>

            <div class="datagrid-container">
                <asp:GridView ID="datagridReparaciones" runat="server" CssClass="datagrid">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
