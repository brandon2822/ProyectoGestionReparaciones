using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica;
using Proyecto2.CapaLogica.Logica_Ver;

namespace Proyecto2.CapaPresentacion
{
    public partial class Ver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUsuarios_Click(object sender, EventArgs e)
        {
            Class_VerUsuario usuario = new Class_VerUsuario();
            usuario.LlenarGridUsuario(gvReparaciones);
        }

        protected void btnEquipos_Click(object sender, EventArgs e)
        {
            Class_VerEquipo equipo = new Class_VerEquipo();
            equipo.LlenarGridEquipo(gvReparaciones);
        }

        protected void btnAsignaciones_Click(object sender, EventArgs e)
        {
            Class_VerAsignaciones asignaciones = new Class_VerAsignaciones();
            asignaciones.LlenarGridAsignaciones(gvReparaciones);
        }

        protected void btnTecnicos_Click(object sender, EventArgs e)
        {
            Class_VerTecnicos Tecnicos = new Class_VerTecnicos();
            Tecnicos.LlenarGridTecnicos(gvReparaciones);
        }

        protected void btnReparaciones_Click(object sender, EventArgs e)
        {
            Class_VerReparaciones reparacion = new Class_VerReparaciones();
            reparacion.LlenarGridReparaciones(gvReparaciones);
        }

        protected void btnDetalleReparacion_Click(object sender, EventArgs e)
        {
            Class_VerDetalles detalles = new Class_VerDetalles();
            detalles.LlenarGridDetalles(gvReparaciones);
        }
    }
}