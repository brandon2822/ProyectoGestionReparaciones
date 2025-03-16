<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Asignacion.aspx.cs" Inherits="Proyecto2.CapaPresentacion.ActualizarVistas.Asignacion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Modificar Asignacion</title>
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
            <h1>Modificar Asignacion</h1>
            <br />
            <div class="textboxs">
                <label for="txtID">ID de asignacion a modificar:</label>
                <asp:TextBox ID="txtIDasig" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtE">Nuevo ID de reparacion:</label>
                <asp:TextBox ID="txtRep" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtE">Nuevo ID de tecnico:</label>
                <asp:TextBox ID="txtTec" runat="server" CssClass="input-box"></asp:TextBox>
                <label for="txtE">Nueva Fecha de asignacion:</label>
<asp:TextBox ID="txtfech" runat="server" CssClass="input-box"></asp:TextBox>
            </div>

            <!-- Botón "Añadir" -->
            <div class="button-container">
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="add-button" OnClick="btnModificar_Click"   />
            </div>

            <div class="datagrid-container">
                <asp:GridView ID="datagridAsignaciones" runat="server" CssClass="datagrid">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
