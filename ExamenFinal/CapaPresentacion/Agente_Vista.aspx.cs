using ExamenFinal.CapaLogica;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinal.CapaPresentacion
{
    public partial class Agente_Vista : System.Web.UI.Page
    {

        Agente_OP logica = new Agente_OP();
        protected void Page_Load(object sender, EventArgs e)
        {

            gridViewAgentes.DataSource = CargarDatos(); 
            gridViewAgentes.DataBind();

        }



        private DataTable CargarDatos()
        {
            var agentes = logica.ObtenerAgentes();
            return agentes;
        }


        [WebMethod]
        public static string AgregarCliente(string nombre, string email, string telefono)
        {
            Agente_OP.AgregarAgente(nombre, email, telefono);

            return "Ingresado Correctamente";

        }


        [WebMethod]
        public static string EliminarCliente(int id)
        {
            Agente_OP.BorrarAgente(id);

            return "Eliminado Correctamente";

        }



        [WebMethod]
        public static string ModificarCliente(int id, string nombre, string email, string telefono)
        {
            Agente_OP.ModificarAgente(id, nombre, email, telefono);

            return "Modificado Correctamente";

        }


    }
}