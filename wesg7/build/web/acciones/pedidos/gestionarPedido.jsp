<%-- 
    Document   : gestioarEmpleados
    Created on : 1 nov 2023, 17:22:06
    Author     : Raul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Empleados</title>
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
        <h1>Gestión de Pedidos</h1>
        <h2>Listado de Pedidos</h2>

        <h2>Conexion: ${mensaje_conexion}</h2>
        
        <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/wesg7?accion=AgregarProveedor">Agregar pedidos</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Fecha</th>
                    <th>Recibido</th>
                    <th>Comenatrio</th>
                    <th>ID Proveedor</th>
                    <th>Proveedor</th>
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaPedidos}" var="item">
                    <tr>
                        <td><c:out value="${item.idPedido}" /></td>                     
                        <td><c:out value="${item.fechaPedido}" /></td>
                        <td><c:out value="${item.fechaRecibido}" /></td>
                        <td><c:out value="${item.comentario}" /></td>
                        <td><c:out value="${item.idProveedor}" /></td>
                        <td><c:out value="${item.proveedor}" /></td>
                        <!-- opcion de modificar y eliminar -->
                        <td>
                            <button>
                                Detalles
                            </button>
                            <form method="POST" action = "/wesg7/acciones/proveedor/ModificarProveedor.jsp">
                                <input type="hidden" name="ID_Pedido" value="${item.idPedido}" />
                                <input type="hidden"  name="fechaPedido" value="${item.fechaPedido}" />
                                <input type="hidden" name="fechaRecibido" value="${item.fechaRecibido}" />
                                <input type="hidden" name="comentario" value="${item.comentario}" />
                                <input type="hidden" name="ID_Proveedor" value="${item.idProveedor}" />
                                <input type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action = "/wesg7/acciones/proveedor/eliminarProveedor.jsp">
                                <input type="hidden" name="ID_Pedido" value="${item.idPedido}" />
                                <input type="hidden" name="fechaPedido" value="${item.fechaPedido}" />
                                <input type="hidden" name="fechaRecibido" value="${item.fechaRecibido}" />
                                <input type="hidden" name="comentario" value="${item.comentario}" />
                                <input type="hidden" name="ID_Proveedor" value="${item.idProveedor}" />
                                <input type="hidden" name="Proveedor" value="${item.proveedor}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
        <div>
            <%@include file = "/footer.html" %>
        </div>
    </body>
</html>
