using ExamenFinal.CapaLogica;
using System;

namespace ExamenFinal.Presentacion
{
    public partial class Login : System.Web.UI.Page
    {


        Agente_OP logica = new Agente_OP();
        protected void Page_Load(object sender, EventArgs e)
        {

        }





        protected void InicioLogin(object sender, EventArgs e)
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"];

            if (logica.LoginAgente(username, password))
            {
                Response.Redirect("/CapaPresentacion/Menuprincipal.aspx");
            }



        }



    }
}