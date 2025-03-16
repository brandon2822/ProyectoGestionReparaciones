using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Proyecto2.CapaLogica.Logica_Ver
{
    public class Class_VerDetalles
    {
        public void LlenarGridDetalles(GridView grid)
        {
            string constr = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("sp_MostrarDetalles", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grid.DataSource = dt;
                            grid.DataBind();
                        }
                    }
                }
            }
        }
    }
}