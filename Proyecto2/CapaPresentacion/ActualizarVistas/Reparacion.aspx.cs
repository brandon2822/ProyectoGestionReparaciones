using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica.Logica_Actualizar;
using Proyecto2.CapaLogica.Logica_Ver;

namespace Proyecto2.CapaPresentacion.ActualizarVistas
{
    public partial class Reparacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerReparaciones rep = new Class_VerReparaciones();
            rep.LlenarGridReparaciones(datagridReparaciones);

        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            Class_VerReparaciones rep = new Class_VerReparaciones();
            ClassLogicaActualizarReparaciones repL = new ClassLogicaActualizarReparaciones();
            repL.Actualizar(this,txtIDRep.Text,txtEquipo.Text,txtfech.Text,txtEstado.Text);
            rep.LlenarGridReparaciones(datagridReparaciones);
            txtIDRep.Text = string.Empty;
            txtEquipo.Text = string.Empty;  
            txtEstado.Text = string.Empty;  
            txtfech.Text = string.Empty;    
        }
    }
}