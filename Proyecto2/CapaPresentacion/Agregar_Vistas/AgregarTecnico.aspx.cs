using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica.Logica_Agregar;
using Proyecto2.CapaLogica.Logica_Ver;

namespace Proyecto2.CapaPresentacion.Agregar_Vistas
{
    public partial class AgregarTecnico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerTecnicos tec = new Class_VerTecnicos();
            tec.LlenarGridTecnicos(datagridtecnico);

        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTNombre.Text) ||
                string.IsNullOrWhiteSpace(txtEsp.Text))
                {

                MostrarMensaje(this, "Todos los campos deben estar llenos.");
                return;
            }

            Class_VerTecnicos tec = new Class_VerTecnicos();
            ClassLogicaAgregTecnico tecL = new ClassLogicaAgregTecnico();
            tecL.add(txtTNombre.Text, txtEsp.Text);

            tec.LlenarGridTecnicos(datagridtecnico);
            Limpiar();

        }

        public void Limpiar()
        {
            txtTNombre.Text = string.Empty;
            txtEsp.Text = string.Empty;
            
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