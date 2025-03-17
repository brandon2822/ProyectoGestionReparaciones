using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using Proyecto2.CapaDatos;
using Proyecto2.CapaPresentacion;
namespace Proyecto2.CapaLogica.Logica_LogIN
{
    public class ClassLogicaLogIn
    {
        public void MostrarMensaje(Page pag, string Mensaje)
        {
            // Profe esto lo estuve investigando, es una forma de poner un alert ASP, lo hice para sustitutir el MessageBox
            // de Windows Forms
            // Usar ScriptManager para generar una alerta en el navegador
            ScriptManager.RegisterStartupScript(pag, GetType(), "alert", $"alert('{Mensaje}');", true);
        }
        public void validar(string usuario, string contra, Page pag )
        {
            Class_LogIn_data.Usuario = usuario;
            Class_LogIn_data.Contrasena = contra;   

            string connectionString = ConfigurationManager.ConnectionStrings["SQLconnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ValidarUsuario",connection))
                {
                    connection.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    cmd.Parameters.Add(new SqlParameter("@Usuario", Class_LogIn_data.Usuario));
                    cmd.Parameters.Add(new SqlParameter("@Contrasena", Class_LogIn_data.Contrasena));

                    SqlDataReader afectada = cmd.ExecuteReader();
                    if (afectada.HasRows ) 
                    {
                        
                        pag.Response.Redirect("Inicio.aspx");
                    }
                    else {
                        MostrarMensaje(pag, "Credenciales incorrectas.");
                    }
                    
                    



                };
            }
        }
    }
}