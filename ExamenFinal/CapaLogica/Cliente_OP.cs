using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;

namespace ExamenFinal.CapaLogica
{
    public class Cliente_OP
    {

        private static string cadenaConexion = ConfigurationManager.ConnectionStrings["examenDB"].ConnectionString;




        public DataTable ObtenerClientes()
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "ConsultarClientes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    conexion.Open();
                    DataTable tabla = new DataTable();


                    using (SqlDataAdapter adapter = new SqlDataAdapter(comando))
                    {
                        adapter.Fill(tabla);
                        return tabla;
                    }
                }
            }
        }





        public static void AgregarClientes(string nombre, string email, string telefono)
        {

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "CrearClientes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@Nombre", nombre);
                    comando.Parameters.AddWithValue("@Email", email);
                    comando.Parameters.AddWithValue("@Telefono", telefono);
                    conexion.Open();
                    comando.ExecuteNonQuery();
                  
                }
            }
        }



        public static void ModificarClientes(int id,string nombre, string email, string telefono)
        {

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "ModificarClientes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@Nombre", nombre);
                    comando.Parameters.AddWithValue("@Email", email);
                    comando.Parameters.AddWithValue("@Telefono", telefono);
                    comando.Parameters.AddWithValue("@ID", id);
                    conexion.Open();
                    comando.ExecuteNonQuery();

                }
            }
        }



        public static void EliminarClientes(int id)
        {

            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "EliminarClientes";
                using (SqlCommand comando = new SqlCommand(procedimiento, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@ID", id);
                    conexion.Open();
                    comando.ExecuteNonQuery();

                }
            }
        }



    }
}