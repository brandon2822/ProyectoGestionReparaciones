<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarAsignacion.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Agregar_Vistas.AgregarAsignacion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agregar Asignacion</title>
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
            <h1>Agregar Asignacion</h1>
            <br />
            <div class="textboxs">
                <label for="txtIDR">ID de la reparacion a asignar:</label>
                <asp:TextBox ID="txtIDrep" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtIDT">ID del Tecnico a asignar:</label>
                <asp:TextBox ID="txtIDtecnico" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtA">Fecha de Asignacion:</label>
                <asp:TextBox ID="txtFA" runat="server" CssClass="input-box"></asp:TextBox>
            </div>

            <!-- Botón "Añadir" -->
            <div class="button-container">
                <asp:Button ID="btnAñadir" runat="server" Text="Añadir" CssClass="add-button" OnClick="btnAñadir_Click" />
            </div>

            <div class="datagrid-container">
                <asp:GridView ID="datagridAsignacion" runat="server" CssClass="datagrid">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
