<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="Proyecto2.CapaPresentacion.ActualizarVistas.Detalle" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Modificar Detalles</title>
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
            <h1>Modificar Detalles</h1>
            <br />
            <div class="textboxs">
                <label for="txtID">ID del detalle a modificar:</label>
                <asp:TextBox ID="txtIDdeta" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtE">Nuevo ID de reparacion:</label>
                <asp:TextBox ID="txtRep" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtE">Nueva descripcion:</label>
                <asp:TextBox ID="txtDescrip" runat="server" CssClass="input-box"></asp:TextBox>
                <label for="txtE">Nueva fecha de inicio:</label>
<asp:TextBox ID="txtfechIN" runat="server" CssClass="input-box"></asp:TextBox>
                                <label for="txtE">Nueva fecha de finalizacion:</label>
<asp:TextBox ID="txtfechFN" runat="server" CssClass="input-box"></asp:TextBox>
            </div>

            <!-- Botón "Añadir" -->
            <div class="button-container">
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="add-button" OnClick="btnModificar_Click"   />
            </div>

            <div class="datagrid-container">
                <asp:GridView ID="datagridDetalle" runat="server" CssClass="datagrid">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
