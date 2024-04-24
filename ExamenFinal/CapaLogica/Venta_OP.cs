using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;

namespace ExamenFinal.CapaLogica
{
    public class Venta_OP
    {

        private static string cadenaConexion = ConfigurationManager.ConnectionStrings["examenDB"].ConnectionString;
        public DataTable ObtenerVentas()
        {
            using (SqlConnection conexion = new SqlConnection(cadenaConexion))
            {
                string procedimiento = "ConsultarVentas";
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


    }
}