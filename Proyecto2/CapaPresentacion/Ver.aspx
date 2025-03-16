<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ver.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Ver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de Reparaciones</title>
    <link href="css/Ver.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Visualizacion</h1>
            <p class="subtitle">Selecciona una de las opciones para continuar:</p>

            <div class="extra-link">
    <a href="Inicio.aspx">Inicio</a>
</div>

            <div class="action-buttons">
                <asp:Button ID="btnUsuarios" runat="server" Text="Usuarios" CssClass="action-button" OnClick="btnUsuarios_Click" />
                <asp:Button ID="btnEquipos" runat="server" Text="Equipos" CssClass="action-button" OnClick="btnEquipos_Click"  />
                <asp:Button ID="btnAsignaciones" runat="server" Text="Asignaciones" CssClass="action-button" OnClick="btnAsignaciones_Click" />
                <asp:Button ID="btnReparaciones" runat="server" Text="Reparaciones" CssClass="action-button" OnClick="btnReparaciones_Click"  />
                <asp:Button ID="btnTecnicos" runat="server" Text="Tecnicos" CssClass="action-button" OnClick="btnTecnicos_Click" />
                <asp:Button ID="btnDetalleReparacion" runat="server" Text="Detalle Reparacion" CssClass="action-button" OnClick="btnDetalleReparacion_Click"  />
                
            </div>
            
            <div class="grid-container">
                <asp:GridView ID="gvReparaciones" runat="server" CssClass="grid-view" 
                   >
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>

