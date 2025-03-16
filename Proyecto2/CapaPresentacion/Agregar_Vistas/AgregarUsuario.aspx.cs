using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica;
using Proyecto2.CapaLogica.Logica_Agregar;

namespace Proyecto2.CapaPresentacion.Agregar_Vistas
{
    public partial class AgregarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class_VerUsuario user = new Class_VerUsuario();
            user.LlenarGridUsuario(datagrid);
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNombre.Text) ||
                string.IsNullOrWhiteSpace(txtCorreo.Text) ||
                string.IsNullOrWhiteSpace(txtTelefono.Text))
            {
                
                MostrarMensaje(this,"Todos los campos deben estar llenos.");
                return; 
            }

            Class_VerUsuario user = new Class_VerUsuario();
            ClassLogicaAgregUsuario agregar = new ClassLogicaAgregUsuario();
            agregar.add(txtNombre.Text, txtCorreo.Text, txtTelefono.Text);
            user.LlenarGridUsuario(datagrid);
            Limpiar();
        }
        public void Limpiar()
        {
            txtNombre.Text = string.Empty;
            txtCorreo.Text = string.Empty;
            txtTelefono.Text = string.Empty;
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