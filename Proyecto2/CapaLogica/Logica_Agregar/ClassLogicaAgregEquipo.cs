using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Proyecto2.CapaDatos;

namespace Proyecto2.CapaLogica.Logica_Agregar
{
    public class ClassLogicaAgregEquipo
    {
        public void add(string TEquipo, string Modelo, string IDuser)
        {
            Class_Equipos_data.TipoEquipo = TEquipo;
            Class_Equipos_data.Modelo = Modelo;
            Class_Equipos_data.UsuarioID = Convert.ToInt32(IDuser);

            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection conecction = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AgregarEquipo", conecction))
                {
                    conecction.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@TipoEquipo", Class_Equipos_data.TipoEquipo));
                    cmd.Parameters.Add(new SqlParameter("@Modelo", Class_Equipos_data.Modelo));
                    cmd.Parameters.Add(new SqlParameter("@ID", Class_Equipos_data.UsuarioID));
                    cmd.ExecuteNonQuery();
                    conecction.Close();


                };
            }
        }
    }
}