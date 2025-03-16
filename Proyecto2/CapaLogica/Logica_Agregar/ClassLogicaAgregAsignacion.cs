using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Proyecto2.CapaDatos;
using Proyecto2.CapaLogica.Logica_Ver;

namespace Proyecto2.CapaLogica.Logica_Agregar
{
    public class ClassLogicaAgregAsignacion
    {
        public void add(string IDrep, string IDtec, string FechaAsig)
        {
            Class_Asignaciones_data.ReparacionID = Convert.ToInt32(IDrep);
            Class_Asignaciones_data.TecnicoID = Convert.ToInt32(IDtec);
            Class_Asignaciones_data.FechaAsignacion = FechaAsig;

            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection conecction = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AgregarAsignacion", conecction))
                {
                    conecction.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@IDrep", Class_Asignaciones_data.ReparacionID));
                    cmd.Parameters.Add(new SqlParameter("@IDTec", Class_Asignaciones_data.TecnicoID));
                    cmd.Parameters.Add(new SqlParameter("@FechaAsig", Class_Asignaciones_data.FechaAsignacion));
                    cmd.ExecuteNonQuery();
                    conecction.Close();


                };
            }
        }
    }
}