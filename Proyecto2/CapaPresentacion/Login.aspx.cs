using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica.Logica_LogIN;

namespace Proyecto2.CapaPresentacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            ClassLogicaLogIn login = new ClassLogicaLogIn();    
            login.validar(txtUsuario.Text,txtContrasena.Text, this);
            Limpiar();
        }

        private void Limpiar()
        {
            txtUsuario.Text = string.Empty;
            txtContrasena.Text = string.Empty;
        }
    }
}