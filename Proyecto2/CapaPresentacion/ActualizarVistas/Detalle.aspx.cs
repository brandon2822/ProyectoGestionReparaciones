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
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerDetalles deta = new Class_VerDetalles();
            deta.LlenarGridDetalles(datagridDetalle);

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Class_VerDetalles deta = new Class_VerDetalles();
            ClassLogicaActualizarDetalle detaL = new ClassLogicaActualizarDetalle();
            detaL.Actualizar(this,txtIDdeta.Text,txtRep.Text,txtDescrip.Text,txtfechIN.Text,txtfechFN.Text);
            deta.LlenarGridDetalles(datagridDetalle);
            txtfechFN.Text = string.Empty;
            txtDescrip.Text = string.Empty;
            txtfechIN.Text = string.Empty;  
            txtIDdeta.Text = string.Empty;  
            txtRep.Text = string.Empty; 
            

        }
    }
}