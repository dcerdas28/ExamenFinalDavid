<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes_View.aspx.cs" Inherits="ExamenFinal.Capa_Presentacion.Clientes_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        #gridViewClientes {
            text-align: center;
            margin-bottom: 10px;
             margin-left: 50px;
        }



        form {
            width: 500px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            button[type="submit"]:hover {
                background-color: #0056b3;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Gestión de Clientes</h1>


        <div>
            <asp:GridView ID="gridViewClientes" runat="server" AutoGenerateColumns="True">
            </asp:GridView>
        </div>




        <form id="formAgregarCliente" onsubmit="agregarCliente(); return false;">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" required><br>
            <button type="submit" onclick="agregarCliente()">Agregar Cliente</button>
        </form>

        <form id="formBorrarCliente" onsubmit="borrarCliente(); return false;">
            <label for="idBorrar">ID del Cliente:</label>
            <input type="number" id="idBorrar" name="idBorrar" required><br>
            <button type="submit" onclick="borrarCliente()">Borrar Cliente</button>
        </form>

        <form id="formModificarCliente" onsubmit="modificarCliente(); return false;">
            <label for="idModificar">ID del Cliente:</label>
            <input type="number" id="idModificar" name="idModificar" required><br>
            <label for="nombreModificar">Nuevo Nombre:</label>
            <input type="text" id="nombreModificar" name="nombreModificar"><br>
            <label for="emailModificar">Nuevo Email:</label>
            <input type="email" id="emailModificar" name="emailModificar"><br>
            <label for="telefonoModificar">Nuevo Teléfono:</label>
            <input type="tel" id="telefonoModificar" name="telefonoModificar"><br>
            <button type="submit" onclick="modificarCliente()">Modificar Cliente</button>
        </form>

        <script>
            function agregarCliente() {
                var nombre = document.getElementById("nombre").value;
                var email = document.getElementById("email").value;
                var telefono = document.getElementById("telefono").value;

                console.log("Nuevo cliente:");
                console.log("Nombre: " + nombre);
                console.log("Email: " + email);
                console.log("Teléfono: " + telefono);

                $.ajax({
                    type: "POST",
                    url: "/CapaPresentacion/Clientes_View.aspx/AgregarCliente",
                    data: JSON.stringify({ nombre: nombre, email: email, telefono: telefono }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d);
                        location.reload();
                    },
                    error: function (error) {
                        alert("Error al agregar cliente:", error);
                    }
                });

                document.getElementById("form1").reset();
            }

            function borrarCliente() {
                var id = document.getElementById("idBorrar").value;

                console.log("Borrar cliente con ID: " + idBorrar);



                $.ajax({
                    type: "POST",
                    url: "/CapaPresentacion/Clientes_View.aspx/EliminarCliente",
                    data: JSON.stringify({ id: id }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d);
                        location.reload();
                    },
                    error: function (error) {
                        alert("Error al agregar cliente:", error);
                    }
                });

                // Limpiar el formulario después de borrar el cliente
                document.getElementById("formBorrarCliente").reset();
            }

            function modificarCliente() {
                var id = document.getElementById("idModificar").value;
                var nombre = document.getElementById("nombreModificar").value;
                var email = document.getElementById("emailModificar").value;
                var telefono = document.getElementById("telefonoModificar").value;

                console.log("Modificar cliente con ID: " + id);
                console.log("Nuevo Nombre: " + nombre);
                console.log("Nuevo Email: " + email);
                console.log("Nuevo Teléfono: " + telefono);


                $.ajax({
                    type: "POST",
                    url: "/CapaPresentacion/Clientes_View.aspx/ModificarCliente",
                    data: JSON.stringify({ id: id, nombre: nombre, email: email, telefono: telefono }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d);
                        location.reload();
                    },
                    error: function (error) {
                        console.error("Error al agregar cliente:", error);
                    }
                });



                // Limpiar el formulario después de modificar el cliente
                document.getElementById("formModificarCliente").reset();
            }
        </script>
    </form>
</body>
</html>
