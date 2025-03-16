<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Inicio" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenida</title>
    <link rel="stylesheet" href="css/inicio.css"> <!-- Enlazar archivo CSS -->
</head>
<body>
    <form runat="server">
    <div class="container">
        <h1>Bienvenido</h1>
        <p>Selecciona una de las opciones para continuar:</p>

        <!-- Menú de navegación -->
        <div class="menu">
            <a href="Agregar.aspx" class="menu-item">Agregar</a>
            <a href="Ver.aspx" class="menu-item">Ver</a>
            <a href="Eliminar.aspx" class="menu-item">Eliminar</a>
            <a href="Actualizar.aspx" class="menu-item">Actualizar</a>
        </div>

        <!-- DataGrid (GridView) -->
        <div class="datagrid-container">
            <asp:GridView ID="GridViewID" runat="server" CssClass="datagrid">
            </asp:GridView>
        </div>
    </div>
        </form>
</body>
</html>
