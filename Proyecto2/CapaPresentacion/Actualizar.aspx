<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Actualizar.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Actualizar" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar</title>
    <link rel="stylesheet" href="css/Actualizar.css"> <!-- Enlazar archivo CSS -->
</head>
<body>
    <form runat="server">
             <div class="extra-link">
    <a href="Inicio.aspx" id="inicio-link">Inicio</a>
</div>
    <div class="container">
        <h1>Actualizacion</h1>
        <p>Selecciona una de las opciones para continuar:</p>

        <!-- Menú de navegación -->
        <div class="menu">
            <a href="ActualizarVistas/Reparacion.aspx" class="menu-item">Modificar Reparacion</a>
            <a href="ActualizarVistas/Asignacion.aspx" class="menu-item">Modificar Asignacion</a>
            <a href="ActualizarVistas/Detalle.aspx" class="menu-item">Modificar Detalle</a>
            
        </div>

        <!-- DataGrid (GridView) -->
        <div class="datagrid-container">
            <asp:GridView ID="GridViewReparacion" runat="server" CssClass="datagrid">
            </asp:GridView>
        </div>
        <div class="datagrid-container">
    <asp:GridView ID="GridViewAsignacion" runat="server" CssClass="datagrid">
    </asp:GridView>
</div>
        <div class="datagrid-container">
    <asp:GridView ID="GridViewDetalle" runat="server" CssClass="datagrid">
    </asp:GridView>
</div>
    </div>
        </form>
</body>
</html>
