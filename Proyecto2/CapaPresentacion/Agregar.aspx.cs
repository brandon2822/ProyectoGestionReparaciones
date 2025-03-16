using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica;


namespace Proyecto2.CapaPresentacion
{
    public partial class Agregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClassInicio agregar = new ClassInicio();
            agregar.LlenarGrid(GridViewAgregar);

        }
    }
}