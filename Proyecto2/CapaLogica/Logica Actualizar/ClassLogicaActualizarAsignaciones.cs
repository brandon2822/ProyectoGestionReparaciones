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
    public class ClassLogicaActualizarAsignaciones
    {
        public void MostrarMensaje(Page pag, string Mensaje)
        {
            // Profe esto lo estuve investigando, es una forma de poner un alert ASP, lo hice para sustitutir el MessageBox
            // de Windows Forms
            // Usar ScriptManager para generar una alerta en el navegador
            ScriptManager.RegisterStartupScript(pag, GetType(), "alert", $"alert('{Mensaje}');", true);
        }

        public void Actualizar(Page pag, string ID, string Reparacion, string Tecnico, string Fecha)
        {
            // Validar que al menos tengamos un ID válido
            if (string.IsNullOrWhiteSpace(ID))
            {
                MostrarMensaje(pag, "El ID de la asignacion es obligatorio");
                ID = "0";

            }

            int asignacionID = Convert.ToInt32(ID);

            // Consultar valores actuales en la base de datos
            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;
            int reparacionActual = 0;
            int tecnicoActual = 0;
            string fechaActual = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ReparacionID, TecnicoID, FechaAsignacion FROM Asignaciones WHERE AsignacionID = @AsignacionID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@AsignacionID", asignacionID);

                    try
                    {
                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                reparacionActual = Convert.ToInt32(reader["ReparacionID"]);
                                tecnicoActual = Convert.ToInt32(reader["TecnicoID"]);
                                fechaActual = reader["FechaAsignacion"].ToString();
                            }
                            else
                            {
                                MostrarMensaje(pag, "No se encontró la asignacion");

                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        MostrarMensaje(pag, "Error al consultar la asignacion:" + ex.Message);

                    }
                }
            }

            // Asignar valores a la clase de datos, usando los actuales si los nuevos están vacíos
            // Se utiliza el metodo IsNullOrWhiteSpace para una validacion mas a fondo
            Class_Asignaciones_data.AsignacionID = asignacionID;

            if (string.IsNullOrWhiteSpace(Reparacion))
            {
                Class_Asignaciones_data.ReparacionID = reparacionActual;
            }
            else
            {
                Class_Asignaciones_data.ReparacionID = Convert.ToInt32(Reparacion);
            }

            if (string.IsNullOrWhiteSpace(Tecnico))
            {
                Class_Asignaciones_data.TecnicoID = tecnicoActual;
            }
            else
            {
                Class_Asignaciones_data.TecnicoID = Convert.ToInt32(Tecnico);
            }

            if (string.IsNullOrWhiteSpace(Fecha))
            {
                Class_Asignaciones_data.FechaAsignacion = fechaActual;
            }
            else
            {
                Class_Asignaciones_data.FechaAsignacion = Fecha;
            }

            // Ejecutar el procedimiento almacenado con los valores finales
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("sp_ActualizarAsignacion", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@AsignacionID", Class_Asignaciones_data.AsignacionID);
                    command.Parameters.AddWithValue("@ReparacionID", Class_Asignaciones_data.ReparacionID);
                    command.Parameters.AddWithValue("@TecnicoID", Class_Asignaciones_data.TecnicoID);
                    command.Parameters.AddWithValue("@Fecha", Class_Asignaciones_data.FechaAsignacion);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        MostrarMensaje(pag, "Error al actualizar la asignacion:" + ex.Message);

                    }
                }
            }
        }
    }
}