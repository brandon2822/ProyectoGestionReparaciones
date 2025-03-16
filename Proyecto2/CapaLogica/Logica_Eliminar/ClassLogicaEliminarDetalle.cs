﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Proyecto2.CapaDatos;
using System.Web.UI;

namespace Proyecto2.CapaLogica.Logica_Eliminar
{
    public class ClassLogicaEliminarDetalle
    {
        public void EliminarDetalle(string ID, Page pagina)
        {
            Class_DetalleRep_data.DetalleID = Convert.ToInt32(ID);

            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_EliminarDetalle", connection))
                {
                    connection.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    cmd.Parameters.Add(new SqlParameter("@DetalleID", Class_DetalleRep_data.DetalleID));

                    // Verificar si se elimino el registro
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // El registro fue eliminado con exito
                        MostrarMensaje(pagina, "Detalle eliminado exitosamente.");
                    }
                    else
                    {
                        // No se elimino ningún registro porque el ID no existe
                        MostrarMensaje(pagina, "Error: El ID ingresado no existe.");
                    }


                };
            }
        }

        public void MostrarMensaje(Page pag, string Mensaje)
        {
            // Profe esto lo estuve investigando, es una forma de poner un alert ASP, lo hice para sustitutir el MessageBox
            // de Windows Forms
            // Usar ScriptManager para generar una alerta en el navegador
            ScriptManager.RegisterStartupScript(pag, GetType(), "alert", $"alert('{Mensaje}');", true);
        }
    }
}