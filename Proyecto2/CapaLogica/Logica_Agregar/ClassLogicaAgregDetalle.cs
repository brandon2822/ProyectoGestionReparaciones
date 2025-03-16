using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Proyecto2.CapaDatos;

namespace Proyecto2.CapaLogica.Logica_Agregar
{
    public class ClassLogicaAgregDetalle
    {
        public void add(string IDrep, string descr, string fechIN, string fechFN)
        {
            Class_DetalleRep_data.ReparacionID = Convert.ToInt32(IDrep);
            Class_DetalleRep_data.Descripcion = descr;
            Class_DetalleRep_data.FechaInicio = fechIN;
            Class_DetalleRep_data.FechaFin = fechFN;

            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection conecction = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AgregarDetalle", conecction))
                {
                    conecction.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@IDrep", Class_DetalleRep_data.ReparacionID));
                    cmd.Parameters.Add(new SqlParameter("@Descrip", Class_DetalleRep_data.Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@FechaIn", Class_DetalleRep_data.FechaInicio));
                    cmd.Parameters.Add(new SqlParameter("@FechaFn", Class_DetalleRep_data.FechaFin));
                    cmd.ExecuteNonQuery();
                    conecction.Close();


                };
            }
        }
    }
}