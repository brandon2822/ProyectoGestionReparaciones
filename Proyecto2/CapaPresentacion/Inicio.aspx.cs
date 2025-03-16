using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto2.CapaLogica;


namespace Proyecto2.CapaPresentacion
{
    public partial class Inicio : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            ClassInicio inicio = new ClassInicio();
            inicio.LlenarGrid(GridViewID);
        }

    }
}