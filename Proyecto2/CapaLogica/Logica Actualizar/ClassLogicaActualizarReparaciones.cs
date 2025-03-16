using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Proyecto2.CapaDatos;
using System.Web.UI;

namespace Proyecto2.CapaLogica.Logica_Actualizar
{
    public class ClassLogicaActualizarReparaciones
    {
        public void MostrarMensaje(Page pag, string Mensaje)
        {
            // Profe esto lo estuve investigando, es una forma de poner un alert ASP, lo hice para sustitutir el MessageBox
            // de Windows Forms
            // Usar ScriptManager para generar una alerta en el navegador
            ScriptManager.RegisterStartupScript(pag, GetType(), "alert", $"alert('{Mensaje}');", true);
        }

        public void Actualizar(Page pag, string ID, string Equipo, string Fecha, string Estado)
        {
            // Validar que al menos tengamos un ID válido
            if (string.IsNullOrWhiteSpace(ID))
            {
                MostrarMensaje(pag, "El ID de la reparación es obligatorio");
                ID = "0";
                
            }

            int reparacionID = Convert.ToInt32(ID);

            // Consultar valores actuales en la base de datos
            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;
            int equipoActual = 0;
            string fechaActual = "";
            string estadoActual = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT EquipoID, FechaSolicitud, Estado FROM Reparaciones WHERE ReparacionID = @ReparacionID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ReparacionID", reparacionID);

                    try
                    {
                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                equipoActual = Convert.ToInt32(reader["EquipoID"]);
                                fechaActual = reader["FechaSolicitud"].ToString();
                                estadoActual = reader["Estado"].ToString();
                            }
                            else
                            {
                                MostrarMensaje(pag, "No se encontró la reparación");
                                
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        MostrarMensaje(pag, "Error al consultar la reparación:" + ex.Message);
                        
                    }
                }
            }

            // Asignar valores a la clase de datos, usando los actuales si los nuevos están vacíos
            // Se utiliza el metodo IsNullOrWhiteSpace para una validacion mas a fondo
            Class_Reparaciones_data.ReparacionID = reparacionID;

            if (string.IsNullOrWhiteSpace(Equipo))
            {
                Class_Reparaciones_data.EquipoID = equipoActual;
            }
            else
            {
                Class_Reparaciones_data.EquipoID = Convert.ToInt32(Equipo);
            }

            if (string.IsNullOrWhiteSpace(Fecha))
            {
                Class_Reparaciones_data.FechaSolicitud = fechaActual;
            }
            else
            {
                Class_Reparaciones_data.FechaSolicitud = Fecha;
            }

            if (string.IsNullOrWhiteSpace(Estado))
            {
                Class_Reparaciones_data.Estado = estadoActual;
            }
            else
            {
                Class_Reparaciones_data.Estado = Estado;
            }

            // Ejecutar el procedimiento almacenado con los valores finales
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("sp_ActualizarReparacion", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@ReparacionID", Class_Reparaciones_data.ReparacionID);
                    command.Parameters.AddWithValue("@EquipoID", Class_Reparaciones_data.EquipoID);
                    command.Parameters.AddWithValue("@FechaSolicitud", Class_Reparaciones_data.FechaSolicitud);
                    command.Parameters.AddWithValue("@Estado", Class_Reparaciones_data.Estado);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        MostrarMensaje(pag, "Error al actualizar la reparación:" + ex.Message);
                        
                    }
                }
            }
        }
        
    }
 }
