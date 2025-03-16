<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Eliminar.aspx.cs" Inherits="Proyecto2.CapaPresentacion.Eliminar" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestión - Eliminar</title>
    <link rel="stylesheet" href="css/Eliminar.css">
</head>
<body>
    <form id="form1" runat="server">
             <div class="extra-link">
    <a href="Inicio.aspx" id="inicio-link">Inicio</a>
</div>
        <div class="container">
            <br />
            <br />
            <h1>Gestión de Eliminación</h1>
            <div>
                <p><span>Solo se pueden eliminar elementos que no tengan relaciones afecten a otras tabalas.</span> </p>
                
            </div>
            
            <div class="delete-section">
    <!-- Fila Superior -->
    <div class="delete-item">
        <asp:TextBox ID="txtUsuarioID" runat="server" CssClass="input-id" Placeholder="ID Usuario"></asp:TextBox>
        <asp:Button ID="btnEliminarUsuario" runat="server" CssClass="btn" Text="Eliminar Usuario" OnClick="btnEliminarUsuario_Click" />
    </div>
    <div class="delete-item">
        <asp:TextBox ID="txtEquipoID" runat="server" CssClass="input-id" Placeholder="ID Equipo"></asp:TextBox>
        <asp:Button ID="btnEliminarEquipo" runat="server" CssClass="btn" Text="Eliminar Equipo" OnClick="btnEliminarEquipo_Click" />
    </div>
    <div class="delete-item">
        <asp:TextBox ID="txtAsignacionID" runat="server" CssClass="input-id" Placeholder="ID Asignación"></asp:TextBox>
        <asp:Button ID="btnEliminarAsignacion" runat="server" CssClass="btn" Text="Eliminar Asignación" OnClick="btnEliminarAsignacion_Click" />
    </div>
    
    <!-- Fila Inferior -->
    <div class="delete-item">
        <asp:TextBox ID="txtTecnicoID" runat="server" CssClass="input-id" Placeholder="ID Técnico"></asp:TextBox>
        <asp:Button ID="btnEliminarTecnico" runat="server" CssClass="btn" Text="Eliminar Técnico" OnClick="btnEliminarTecnico_Click" />
    </div>
    <div class="delete-item">
        <asp:TextBox ID="txtReparacionID" runat="server" CssClass="input-id" Placeholder="ID Reparación"></asp:TextBox>
        <asp:Button ID="btnEliminarReparacion" runat="server" CssClass="btn" Text="Eliminar Reparación" OnClick="btnEliminarReparacion_Click" />
    </div>
    <div class="delete-item">
        <asp:TextBox ID="txtDetalleID" runat="server" CssClass="input-id" Placeholder="ID Detalle"></asp:TextBox>
        <asp:Button ID="btnEliminarDetalle" runat="server" CssClass="btn" Text="Eliminar Detalle" OnClick="btnEliminarDetalle_Click" />
    </div>
</div>
            
            <div class="datagrid-container">
                <asp:GridView ID="GridViewUser" runat="server" CssClass="datagrid" >
                    
                </asp:GridView>
            </div>
            <div class="datagrid-container">
                <asp:GridView ID="GridViewEquipo" runat="server" CssClass="datagrid" >
        
                </asp:GridView>
            </div>
            <div class="datagrid-container">
    <asp:GridView ID="GridViewAsignaciones" runat="server" CssClass="datagrid" >
        
    </asp:GridView>
</div>
            <div class="datagrid-container">
    <asp:GridView ID="GridViewTecnicos" runat="server" CssClass="datagrid" >
        
    </asp:GridView>
</div>
            <div class="datagrid-container">
    <asp:GridView ID="GridViewReparaciones" runat="server" CssClass="datagrid" >
        
    </asp:GridView>
</div>
            <div class="datagrid-container">
    <asp:GridView ID="GridViewDetalle" runat="server" CssClass="datagrid" >
        
    </asp:GridView>
</div>
        </div>
    </form>
</body>
</html>