<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarDetalle.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Agregar_Vistas.AgregarDetalle" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agregar Detalle</title>
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
            <h1>Agregar Detalle</h1>
            <br />
            <div class="textboxs">
                <label for="txtR">ID de Reparacion:</label>
                <asp:TextBox ID="txtIDrep" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtD">Descripcion:</label>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtFi">Fecha de Inicio:</label>
                <asp:TextBox ID="txtFechaIn" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtFF">Fecha de Finalizacion:</label>
                <asp:TextBox ID="txtFechaFin" runat="server" CssClass="input-box"></asp:TextBox>
            </div>

            <!-- Botón "Añadir" -->
            <div class="button-container">
                <asp:Button ID="btnAñadir" runat="server" Text="Añadir" CssClass="add-button" OnClick="btnAñadir_Click" />
            </div>

            <div class="datagrid-container">
                <asp:GridView ID="datagridDetalle" runat="server" CssClass="datagrid">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
