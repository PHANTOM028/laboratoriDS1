

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
                    <th>Nombre recepcionista</th>
                    <th>aprellido</th>
                    <th>identificacion</th>
                    <th>id empleado</th>
                   
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaRecepcionistas}" var="recepcionista">
                <tr>
                 <td><c:out value="${recepcionista.id_recepcionista}" /></td>                     
                 <td><c:out value="${recepcionista.nombre_recepcionista}" /></td>
                 <td><c:out value="${recepcionista.apellido}" /></td>
                 <td><c:out value="${recepcionista.identificacion}" /></td>
                 <td><c:out value="${recepcionista.posicion}" /></td>
                 <td><c:out value="${recepcionista.id_empleado}" /></td>
                 <td><c:out value="${recepcionista.id_cargo}" /></td>
       
              <td>
                            <button>
                                Detalles
                            </button>
                            <!-- Modificar Recepcionista -->
                         <form method="POST" action="/wesg7/acciones/recepcionista/ModificarRecepcionista.jsp">
                         <input type="hidden" name="ID_Recepcionista" value="${recepcionista.id_recepcionista}" />
                         <input type="hidden" name="nombreRecepcionista" value="${recepcionista.nombre_recepcionista}" />
                         <input type="hidden" name="apellido" value="${recepcionista.apellido}" />
                         <input type="hidden" name="identificacion" value="${recepcionista.identificacion}" />
                         <input type="hidden" name="posicion" value="${recepcionista.posicion}" />
                         <input type="hidden" name="idEmpleado" value="${recepcionista.id_empleado}" />
                         <input type="hidden" name="idCargo" value="${recepcionista.id_cargo}" />
                         <input type="submit" value="Modificar" />
                     </form> 

                      <!-- Eliminar Recepcionista -->
                        <form method="POST" action="/wesg7/acciones/recepcionista/EliminarRecepcionista.jsp">
                        <input type="hidden" name="ID_Recepcionista" value="${recepcionista.id_recepcionista}" />
                        <input type="hidden" name="nombreRecepcionista" value="${recepcionista.nombre_recepcionista}" />
                        <input type="hidden" name="apellido" value="${recepcionista.apellido}" />
                        <input type="hidden" name="identificacion" value="${recepcionista.identificacion}" />
                        <input type="hidden" name="posicion" value="${recepcionista.posicion}" />
                        <input type="hidden" name="idEmpleado" value="${recepcionista.id_empleado}" />
                        <input type="hidden" name="idCargo" value="${recepcionista.id_cargo}" />
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
