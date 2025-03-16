using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica;
using Proyecto2.CapaLogica.Logica_Eliminar;
using Proyecto2.CapaLogica.Logica_Ver;

namespace Proyecto2.CapaPresentacion
{
    public partial class Eliminar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Class_VerEquipo eq = new Class_VerEquipo(); 
            Class_VerUsuario user = new Class_VerUsuario();
            Class_VerAsignaciones asig = new Class_VerAsignaciones();
            Class_VerTecnicos tec = new Class_VerTecnicos();
            Class_VerReparaciones rep = new Class_VerReparaciones();
            Class_VerDetalles det = new Class_VerDetalles();

            user.LlenarGridUsuario(GridViewUser);
            eq.LlenarGridEquipo(GridViewEquipo);
            asig.LlenarGridAsignaciones(GridViewAsignaciones);
            tec.LlenarGridTecnicos(GridViewTecnicos);
            rep.LlenarGridReparaciones(GridViewReparaciones);
            det.LlenarGridDetalles(GridViewDetalle);
        }

     
        protected void btnEliminarUsuario_Click(object sender, EventArgs e)
        {
            Class_VerUsuario user = new Class_VerUsuario();
            ClassLogicaEliminarUsuario eliminarL = new ClassLogicaEliminarUsuario();

            eliminarL.EliminarUsuario(txtUsuarioID.Text, this);
            user.LlenarGridUsuario(GridViewUser);
            txtUsuarioID.Text = string.Empty;
            
        }

        protected void btnEliminarEquipo_Click(object sender, EventArgs e)
        {
            Class_VerEquipo eq = new Class_VerEquipo();
            ClassLogicaEliminarEquipo eqL = new ClassLogicaEliminarEquipo();

            eqL.EliminarEquipo(txtEquipoID.Text, this);
            eq.LlenarGridEquipo(GridViewEquipo);
            txtEquipoID.Text = string.Empty;    
        }

        protected void btnEliminarAsignacion_Click(object sender, EventArgs e)
        {
            Class_VerAsignaciones asig = new Class_VerAsignaciones();   
            ClassLogicaEliminarAsignacion asigL = new ClassLogicaEliminarAsignacion();

            asigL.EliminarAsignacion(txtAsignacionID.Text, this);
            asig.LlenarGridAsignaciones(GridViewAsignaciones);  
            txtAsignacionID.Text = string.Empty;    
        }

        protected void btnEliminarTecnico_Click(object sender, EventArgs e)
        {
            Class_VerTecnicos tec = new Class_VerTecnicos();
            ClassLogicaEliminarTecnico tecL = new ClassLogicaEliminarTecnico();
            tecL.EliminarTecnico(txtTecnicoID.Text, this);
            tec.LlenarGridTecnicos(GridViewTecnicos);
            txtTecnicoID .Text = string.Empty;
        }

        protected void btnEliminarReparacion_Click(object sender, EventArgs e)
        {
            Class_VerReparaciones rep = new Class_VerReparaciones();
            ClassLogicaEliminarReparacion repL = new ClassLogicaEliminarReparacion();
            repL.EliminarReparacion(txtReparacionID.Text, this);
            rep.LlenarGridReparaciones(GridViewReparaciones);  
            txtReparacionID .Text = string.Empty;   
        }

        protected void btnEliminarDetalle_Click(object sender, EventArgs e)
        {
            Class_VerDetalles det = new Class_VerDetalles();
            ClassLogicaEliminarDetalle detL = new ClassLogicaEliminarDetalle();

            detL.EliminarDetalle(txtDetalleID.Text, this);
            det.LlenarGridDetalles(GridViewDetalle);
            txtDetalleID .Text = string.Empty;  
        }
    }
}