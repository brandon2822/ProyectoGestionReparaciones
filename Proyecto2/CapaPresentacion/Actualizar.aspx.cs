using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica;
using Proyecto2.CapaLogica.Logica_Ver;

namespace Proyecto2.CapaPresentacion
{
    public partial class Actualizar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerReparaciones rep = new Class_VerReparaciones();
            Class_VerDetalles det = new Class_VerDetalles();    
            Class_VerAsignaciones asig = new Class_VerAsignaciones();

            rep.LlenarGridReparaciones(GridViewReparacion);
            det.LlenarGridDetalles(GridViewDetalle);
            asig.LlenarGridAsignaciones(GridViewAsignacion);
        }
    }
}