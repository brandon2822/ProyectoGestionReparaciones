<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agregar.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Agregar" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Agregar</title>
    <link rel="stylesheet" href="css/Agregar.css">
</head>
<body>

    <form runat="server">
         <div class="extra-link">
        <a href="Inicio.aspx" id="inicio-link">Inicio</a>
    </div>
    <div class="container">
        <!-- Sección de botones -->

         <div class="menu">
             <a href="Agregar_Vistas/AgregarUsuario.aspx" class="menu-item">Agregar Usuario</a>
             <a href="Agregar_Vistas/AgregarEquipo.aspx" class="menu-item">Agregar Equipo</a>
             <a href="Agregar_Vistas/AgregarReparacion.aspx" class="menu-item">Agregar Reparacion</a>
             <a href="Agregar_Vistas/AgregarAsignacion.aspx" class="menu-item">Agregar Asignacion</a>
             <a href="Agregar_Vistas/AgregarTecnico.aspx" class="menu-item">Agregar Tecnico</a>
             <a href="Agregar_Vistas/AgregarDetalle.aspx" class="menu-item">Agregar Detalle</a>
        </div>
        <p>Recordar que a la hora de agregar los ID deben tener congruencia.</p>
        <div class="datagrid-container">
            <asp:GridView ID="GridViewAgregar" runat="server" CssClass="datagrid">
            </asp:GridView>
        </div>

    </div>
 </form>
</body>
</html>
