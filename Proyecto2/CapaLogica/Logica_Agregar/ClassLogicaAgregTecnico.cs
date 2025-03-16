using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Proyecto2.CapaDatos;

namespace Proyecto2.CapaLogica.Logica_Agregar
{
    public class ClassLogicaAgregTecnico
    {

        public void add(string nombre, string esp)
        {
            Class_Tecnicos_data.Nombre = nombre;
            Class_Tecnicos_data.Especialidad = esp;

            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection conecction = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AgregarTecnico", conecction))
                {
                    conecction.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Nombre", Class_Tecnicos_data.Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Especialidad", Class_Tecnicos_data.Especialidad));
                    
                    cmd.ExecuteNonQuery();
                    conecction.Close();


                };
            }
        }
    }
}