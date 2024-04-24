using ExamenFinal.CapaLogica;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinal.Capa_Presentacion
{
    public partial class Clientes_View : System.Web.UI.Page
    {

        Cliente_OP logica = new Cliente_OP();
        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewClientes.DataSource = CargarClientes();
            gridViewClientes.DataBind();


        }


        public DataTable CargarClientes()
        {
            DataTable clientes = logica.ObtenerClientes();
            return clientes;
        }


        [WebMethod]
        public static string AgregarCliente(string nombre, string email, string telefono)
        {
            Cliente_OP.AgregarClientes(nombre, email, telefono);

            return "Ingresado Correctamente";

        }


        [WebMethod]
        public static string EliminarCliente(int id)
        {
            Cliente_OP.EliminarClientes(id);

            return "Eliminado Correctamente";

        }



        [WebMethod]
        public static string ModificarCliente(int id, string nombre, string email, string telefono)
        {
            Cliente_OP.ModificarClientes(id, nombre, email, telefono);

            return "Modificado Correctamente";

        }


    }
}