using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica.Logica_Agregar;
using Proyecto2.CapaLogica.Logica_Ver;

namespace Proyecto2.CapaPresentacion.Agregar_Vistas
{
    public partial class AgregarDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerDetalles det = new Class_VerDetalles();
            det.LlenarGridDetalles(datagridDetalle);

        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtIDrep.Text) ||
               string.IsNullOrWhiteSpace(txtDescripcion.Text) ||
               string.IsNullOrWhiteSpace(txtFechaIn.Text)||
               string.IsNullOrEmpty(txtFechaFin.Text))
            {

                MostrarMensaje(this, "Todos los campos deben estar llenos.");
                return;
            }
            Class_VerDetalles det = new Class_VerDetalles();
            ClassLogicaAgregDetalle detL = new ClassLogicaAgregDetalle();
            detL.add(txtIDrep.Text,txtDescripcion.Text, txtFechaIn.Text, txtFechaFin.Text);
            det.LlenarGridDetalles(datagridDetalle);
            Limpiar();
        }
        public void Limpiar()
        {
            txtIDrep.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtFechaFin.Text = string.Empty;
            txtFechaIn.Text = string.Empty;

        }
        public void MostrarMensaje(Page pag, string Mensaje)
        {
            // Profe esto lo estuve investigando, es una forma de poner un alert ASP, lo hice para sustitutir el MessageBox
            // de Windows Forms
            // Usar ScriptManager para generar una alerta en el navegador
            ScriptManager.RegisterStartupScript(pag, GetType(), "alert", $"alert('{Mensaje}');", true);
        }
    }
}