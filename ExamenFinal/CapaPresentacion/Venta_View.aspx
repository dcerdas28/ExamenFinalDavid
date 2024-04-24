<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Venta_View.aspx.cs" Inherits="ExamenFinal.CapaPresentacion.Venta_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* Estilos para el GridView */
        #ContentPlaceHolder1_gridViewVentas {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            width: 80%;
            border-collapse: collapse;
        }


            #ContentPlaceHolder1_gridViewVentas th {
                background-color: black;
                color: white;
                padding: 10px;
                border: 1px solid #ddd;
            }


            #ContentPlaceHolder1_gridViewVentas td {
                padding: 10px;
                border: 1px solid #ddd;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div>

        <h1>Ventas</h1>
        <asp:GridView ID="gridViewVentas" runat="server" AutoGenerateColumns="True">
        </asp:GridView>
    </div>



</asp:Content>
