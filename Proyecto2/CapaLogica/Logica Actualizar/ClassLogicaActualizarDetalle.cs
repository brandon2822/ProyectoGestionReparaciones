using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Proyecto2.CapaDatos;
using System.Web.UI;

namespace Proyecto2.CapaLogica.Logica_Actualizar
{
    public class ClassLogicaActualizarDetalle
    {
        public void MostrarMensaje(Page pag, string Mensaje)
        {
            // Profe esto lo estuve investigando, es una forma de poner un alert ASP, lo hice para sustitutir el MessageBox
            // de Windows Forms
            // Usar ScriptManager para generar una alerta en el navegador
            ScriptManager.RegisterStartupScript(pag, GetType(), "alert", $"alert('{Mensaje}');", true);
        }

        public void Actualizar(Page pag, string ID, string Reparacion, string Descripcion, string FechaIN, string FechaFN)
        {
            // Validar que al menos tengamos un ID válido
            if (string.IsNullOrWhiteSpace(ID))
            {
                MostrarMensaje(pag, "El ID del detalle es obligatorio");
                ID = "0";

            }

            int DetalleID = Convert.ToInt32(ID);

            // Consultar valores actuales en la base de datos
            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;
            int reparacionActual = 0;
            string descripcionActual = "";
            string fechaINActual = "";
            string fechaFNActual = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ReparacionID, Descripcion, FechaInicio,FechaFin FROM DetalleReparacion WHERE DetalleID = @DetalleID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DetalleID", DetalleID);

                    try
                    {
                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                reparacionActual = Convert.ToInt32(reader["ReparacionID"]);
                                descripcionActual = reader["Descripcion"].ToString();
                                fechaINActual = reader["FechaInicio"].ToString();
                                fechaFNActual = reader["FechaFin"].ToString();
                            }
                            else
                            {
                                MostrarMensaje(pag, "No se encontró el detalle");

                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        MostrarMensaje(pag, "Error al consultar el detalle:" + ex.Message);

                    }
                }
            }

            // Asignar valores a la clase de datos, usando los actuales si los nuevos están vacíos
            // Se utiliza el metodo IsNullOrWhiteSpace para una validacion mas a fondo
            Class_DetalleRep_data.DetalleID = DetalleID;

            if (string.IsNullOrWhiteSpace(Reparacion))
            {
                Class_DetalleRep_data.ReparacionID = reparacionActual;
            }
            else
            {
                Class_DetalleRep_data.ReparacionID = Convert.ToInt32(Reparacion);
            }

            if (string.IsNullOrWhiteSpace(Descripcion))
            {
                Class_DetalleRep_data.Descripcion = descripcionActual;
                
            }
            else
            {
                Class_DetalleRep_data.Descripcion = Descripcion;
            }

            if (string.IsNullOrWhiteSpace(FechaIN))
            {
                Class_DetalleRep_data.FechaInicio = fechaINActual;
        
            }
            else
            {
                Class_DetalleRep_data.FechaInicio = FechaIN;
            }
            if (string.IsNullOrWhiteSpace(FechaFN))
            {
                Class_DetalleRep_data.FechaFin = fechaFNActual;

            }
            else
            {
                Class_DetalleRep_data.FechaFin = FechaFN;
            }

            // Ejecutar el procedimiento almacenado con los valores finales
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("sp_ActualizarDetalle", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@DetalleID", Class_DetalleRep_data.DetalleID);
                    command.Parameters.AddWithValue("@ReparacionID", Class_DetalleRep_data.ReparacionID);
                    command.Parameters.AddWithValue("@Descripcion", Class_DetalleRep_data.Descripcion);
                    command.Parameters.AddWithValue("@FechaIN", Class_DetalleRep_data.FechaInicio);
                    command.Parameters.AddWithValue("@FechaFN", Class_DetalleRep_data.FechaFin);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        MostrarMensaje(pag, "Error al actualizar el detalle:" + ex.Message);

                    }
                }
            }
        }
    }
}