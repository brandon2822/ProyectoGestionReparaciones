<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarTecnico.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Agregar_Vistas.AgregarTecnico" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agregar Tecnico</title>
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
            <h1>Agregar Tecnico</h1>
            <br />
            <div class="textboxs">
                <label for="txtN">Nombre:</label>
                <asp:TextBox ID="txtTNombre" runat="server" CssClass="input-box"></asp:TextBox>

                <label for="txtE">Especialidad:</label>
                <asp:TextBox ID="txtEsp" runat="server" CssClass="input-box"></asp:TextBox>
            </div>

            <!-- Botón "Añadir" -->
            <div class="button-container">
                <asp:Button ID="btnAñadir" runat="server" Text="Añadir" CssClass="add-button" OnClick="btnAñadir_Click" />
            </div>

            <div class="datagrid-container">
                <asp:GridView ID="datagridtecnico" runat="server" CssClass="datagrid">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
