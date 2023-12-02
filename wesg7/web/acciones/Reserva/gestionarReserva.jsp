

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Reserva</title>
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
        <h1>Gestión de Compras</h1>
        <h2>Listado de Compras</h2>

        <h2>Conexion: ${mensaje_conexion}</h2>
        
        <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/wesg7?accion=AgregarReserva">Agregar Reserva</a><br><br>

<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>ID Reserva</th>
            <th>ID Cliente</th>
            <th>ID Recepcionista</th>
            <th>ID Paquete</th>
            <th>Fecha</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listaReservas}" var="reserva">
            <tr>
                <td><c:out value="${reserva.idreserva}" /></td>
                <td><c:out value="${reserva.idreserva}" /></td>
                <td><c:out value="${reserva.idcliente}" /></td>
                <td><c:out value="${reserva.idrecepcionista}" /></td>
                <td><c:out value="${reserva.idpaquete}" /></td>
                <td><c:out value="${reserva.fecha}" /></td>
                <!-- Opción de modificar y eliminar -->
                <td>
                    <button>
                        Detalles
                    </button>
                    <form method="POST" action="/wesg7/acciones/reserva/ModificarReserva.jsp">
                        <!-- Agrega los campos que deseas modificar -->
                        <input type="hidden" name="ID_Reserva" value="${reserva.idreserva}" />
                        <input type="hidden" name="ID_Cliente" value="${reserva.idcliente}" />
                        <input type="hidden" name="ID_Recepcionista" value="${reserva.idrecepcionista}" />
                        <input type="hidden" name="ID_Paquete" value="${reserva.idpaquete}" />
                        <input type="hidden" name="Fecha" value="${reserva.fecha}" />
                        <input type="submit" value="Modificar" />
                    </form>
                    <form method="POST" action="/wesg7/acciones/reserva/EliminarReserva.jsp">
                        <!-- Agrega los campos que deseas eliminar -->
                        <input type="hidden" name="ID_Reserva" value="${reserva.idreserva}" />
                        <input type="submit" value="Eliminar" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

            </tbody>            
        </table>
        <div>
            <%@include file = "/footer.html" %>
        </div>
    </body>
</html>
