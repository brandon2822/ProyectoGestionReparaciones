using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using Proyecto2.CapaDatos;

namespace Proyecto2.CapaLogica.Logica_Agregar
{
    public class ClassLogicaAgregUsuario
    {
       
        public void add(string nombre, string correo, string telf)
        {
            Class_Usuarios_data.Nombre = nombre;
            Class_Usuarios_data.CorreoElectronico = correo;
            Class_Usuarios_data.Telefono = telf;

            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection conecction = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AgregarUsuario", conecction))
                {
                    conecction.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Nombre",Class_Usuarios_data.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Correo",Class_Usuarios_data.CorreoElectronico));
                    cmd.Parameters.Add(new SqlParameter("@Telefono", Class_Usuarios_data.Telefono));
                    cmd.ExecuteNonQuery();
                    conecction.Close();

              
                } ;
            }
        }
    }
}