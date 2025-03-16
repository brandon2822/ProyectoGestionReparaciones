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
    public partial class AgregarEquipo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerEquipo equipo = new Class_VerEquipo();
            equipo.LlenarGridEquipo(datagridEquipo);
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTEquipo.Text) ||
               string.IsNullOrWhiteSpace(txtModelo.Text) ||
               string.IsNullOrWhiteSpace(txtUsuarioID.Text))
            {

                MostrarMensaje(this, "Todos los campos deben estar llenos.");
                return;
            }

            Class_VerEquipo equipogrid = new Class_VerEquipo();
            ClassLogicaAgregEquipo equipo = new ClassLogicaAgregEquipo();
            equipo.add(txtTEquipo.Text,txtModelo.Text, txtUsuarioID.Text);

            equipogrid.LlenarGridEquipo(datagridEquipo);
            Limpiar();
        }

        public void Limpiar()
        {
            txtUsuarioID.Text = string.Empty;
            txtTEquipo.Text = string.Empty;
            txtModelo.Text = string.Empty;
            
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