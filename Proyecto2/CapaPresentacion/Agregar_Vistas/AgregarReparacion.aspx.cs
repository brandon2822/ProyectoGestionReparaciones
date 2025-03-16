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
    public partial class AgregarReparacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerReparaciones rep = new Class_VerReparaciones();
            rep.LlenarGridReparaciones(datagridReparaciones);

        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtIDEquipo.Text) ||
                string.IsNullOrWhiteSpace(txtfecha.Text) ||
                string.IsNullOrWhiteSpace(txtEstado.Text))
            {

                MostrarMensaje(this, "Todos los campos deben estar llenos.");
                return;
            }

            Class_VerReparaciones rep = new Class_VerReparaciones();
            ClassLogicaAgregReparacion repL = new ClassLogicaAgregReparacion();
            repL.add(txtIDEquipo.Text, txtfecha.Text, txtEstado.Text);
            rep.LlenarGridReparaciones(datagridReparaciones);
            Limpiar();

        }
        public void Limpiar()
        {
            txtIDEquipo.Text = string.Empty;
            txtEstado.Text = string.Empty;
            txtfecha.Text = string.Empty;

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