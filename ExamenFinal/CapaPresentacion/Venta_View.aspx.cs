using ExamenFinal.CapaLogica;
using ExamenFinal.Presentacion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinal.CapaPresentacion
{
    public partial class Venta_View : System.Web.UI.Page
    {

        Venta_OP logica = new Venta_OP();
        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewVentas.DataSource = CargarVentas();
            gridViewVentas.DataBind();
        }

        public DataTable CargarVentas()
        {
            DataTable clientes = logica.ObtenerVentas();
            return clientes;
        }


    }
}