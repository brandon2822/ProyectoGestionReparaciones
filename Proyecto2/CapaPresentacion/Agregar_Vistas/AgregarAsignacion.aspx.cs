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
    public partial class AgregarAsignacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerAsignaciones asig = new Class_VerAsignaciones();
            asig.LlenarGridAsignaciones(datagridAsignacion);
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtIDrep.Text) ||
               string.IsNullOrWhiteSpace(txtIDtecnico.Text) ||
               string.IsNullOrWhiteSpace(txtFA.Text))
            {

                MostrarMensaje(this, "Todos los campos deben estar llenos.");
                return;
            }
            Class_VerAsignaciones asig = new Class_VerAsignaciones();
            ClassLogicaAgregAsignacion asigL = new ClassLogicaAgregAsignacion();
            asigL.add(txtIDrep.Text,txtIDtecnico.Text,txtFA.Text);
            asig.LlenarGridAsignaciones(datagridAsignacion);
            Limpiar();
        }

        public void Limpiar()
        {
            txtIDrep.Text = string.Empty;
            txtIDtecnico.Text = string.Empty;
            txtFA.Text = string.Empty;
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