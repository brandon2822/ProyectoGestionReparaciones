using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Proyecto2.CapaDatos;

namespace Proyecto2.CapaLogica.Logica_Agregar
{
    public class ClassLogicaAgregReparacion
    {

        public void add(string IdEq, string Fecha, string estado)
        {
            Class_Reparaciones_data.EquipoID = Convert.ToInt32(IdEq);
            Class_Reparaciones_data.FechaSolicitud = Fecha;
            Class_Reparaciones_data.Estado= estado;

            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection conecction = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AgregarReparacion", conecction))
                {
                    conecction.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@IDEquipo", Class_Reparaciones_data.EquipoID));
                    cmd.Parameters.Add(new SqlParameter("@FechaIn", Class_Reparaciones_data.FechaSolicitud));
                    cmd.Parameters.Add(new SqlParameter("@Estado", Class_Reparaciones_data.Estado));
                    cmd.ExecuteNonQuery();
                    conecction.Close();


                };
            }
        }
    }
}