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
    public partial class Asignacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerAsignaciones asig = new Class_VerAsignaciones();
            asig.LlenarGridAsignaciones(datagridAsignaciones);

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Class_VerAsignaciones asig = new Class_VerAsignaciones();
            ClassLogicaActualizarAsignaciones asigL = new ClassLogicaActualizarAsignaciones();
            asigL.Actualizar(this,txtIDasig.Text,txtRep.Text,txtTec.Text,txtfech.Text);            
            asig.LlenarGridAsignaciones(datagridAsignaciones);
            txtIDasig.Text = string.Empty;
            txtRep.Text = string.Empty;
            txtTec.Text = string.Empty;
            txtfech.Text = string.Empty;
        }
    }
}