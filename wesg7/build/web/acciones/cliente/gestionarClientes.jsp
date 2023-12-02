
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Clientes</title>
        <style>
            /* Estilo para el contenedor del pop-up */
            .popup-container {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                z-index: 1;
            }

            /* Estilo para el fondo oscuro */
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 0;
            }
        </style>
    </head>
    <body>
        <h1>Gestión de Clientes</h1>
        <h2>Listado de Clientes</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
        <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/wesg7?accion=AgregarCliente">Agregar Cliente</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>idCliente</th>
                    <th>identificacion</th>
                    <th>nombresCliente</th>
                    <th>apellidosCliente</th>
                    <th>telefono</th>                 
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaClientes}" var="item">
                    <tr>
                        <td><c:out value="${item.idCliente}" /></td>
                        <td><c:out value="${item.identificacion}" /></td>                       
                        <td><c:out value="${item.nombresCliente}" /></td>
                        <td><c:out value="${item.apellidosCliente}" /></td>
                        <td><c:out value="${item.telefono}" /></td>                      
                        <!-- opcion de modificar y eliminar -->
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesEmpleado(
                                                    '${item.idCliente}',
                                                    '${item.identificacion}',
                                                    '${item.nombresCliente}',
                                                    '${item.apellidosCliente}',
                                                    '${item.telefono}',
              
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Cliente <span id="ID_Cliente"></span></label><br>
                                <label>Identificacion: <span id="identificacion"></span></label><br>
                                <label>Nombres: <span id="nombresCliente"></span></label><br>
                                <label>Apellidos: <span id="apellidosCliente"></span></label><br>
                                <label>Teléfono: <span id="telefono"></span></label><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>
                            <form method="POST" action="/wesg7/acciones/cliente/ModificarCliente.jsp">
                              <input type="hidden" name="idCliente" value="${item.idCliente}" />
                             <input type="hidden" name="identificacion" value="${item.identificacion}" />
                             <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />
                             <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />
                             <input type="hidden" name="telefono" value="${item.telefono}" />
                              <input type="submit" value="Modificar" />
                          </form>
   
                            <form method="POST" action="/wesg7/acciones/cliente/eliminarCliente.jsp">
                              <input type="hidden" name="idCliente" value="${item.idCliente}" />
                              <input type="hidden" name="identificacion" value="${item.identificacion}" />
                              <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />
                              <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />
                              <input type="hidden" name="telefono" value="${item.telefono}" />
                              <input type="submit" value="Eliminar" />
                             </form>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
    <script>
        function abrirPopup() {
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');

            if (popup.style.display === 'block') {
                popup.style.display = 'none';
                overlay.style.display = 'none';
            } else {
                popup.style.display = 'block';
                overlay.style.display = 'block';
            }
        }

        function mostrarDetallesEmpleado(ID_Cliente, DUI_Cliente, nombresCliente, apellidosCliente, telefonoCliente) {
            document.getElementById('ID_Cliente').textContent = ID_Cliente;
            document.getElementById('dui').textContent = DUI_Cliente;
            document.getElementById('nombresCliente').textContent = nombresCliente;
            document.getElementById('apellidosCliente').textContent = apellidosCliente;
            document.getElementById('telefono').textContent = telefonoCliente;
            

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
