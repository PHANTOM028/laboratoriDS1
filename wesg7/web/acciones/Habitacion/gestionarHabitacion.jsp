

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
        <h1>Gestión de Proveedores</h1>
        <h2>Listado de Proveedores</h2>

        <h2>Conexion: ${mensaje_conexion}</h2>
        
        <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/wesg7?accion=AgregarHabitacion">Agregar Habitacion</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaHabitaciones}" var="item">
    <tr>
        <td><c:out value="${item.idhabitacion}" /></td>
        <td><c:out value="${item.idcategoria}" /></td>
        <td><c:out value="${item.num}" /></td>
        <td><c:out value="${item.piso}" /></td>
        <td><c:out value="${item.costo}" /></td>
        <td><c:out value="${item.detalle}" /></td>
        <!-- opcion de ver detalles, modificar y eliminar -->
        <td>
            <!-- Ver detalles -->
            <button class="open-popup-btn" 
                    onclick="mostrarDetallesHabitacion(
                                    '${item.idhabitacion}',
                                    '${item.idcategoria}',
                                    '${item.num}',
                                    '${item.piso}',
                                    '${item.costo}',
                                    '${item.detalle}'
                                    )">Ver detalles
            </button>
            <!-- Contenedor del pop-up -->
            <div class="overlay" id="overlay"></div>
            <div class="popup-container" id="popup">
                <label>ID Habitación: <span id="ID_Habitacion"></span></label><br>
                <label>ID Categoría: <span id="idcategoria"></span></label><br>
                <label>Número: <span id="num"></span></label><br>
                <label>Piso: <span id="piso"></span></label><br>
                <label>Costo: <span id="costo"></span></label><br>
                <label>Detalle: <span id="detalle"></span></label><br><br>
                <button onclick="abrirPopup()">Cerrar</button>
            </div>
            
            <!-- Modificar Habitacion -->
            <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarHabitacion">
                <input type="hidden" name="idhabitacion" value="${item.idhabitacion}" />
                <input type="hidden" name="idcategoria" value="${item.idcategoria}" />
                <input type="hidden" name="num" value="${item.num}" />
                <input type="hidden" name="piso" value="${item.piso}" />
                <input type="hidden" name="costo" value="${item.costo}" />
                <input type="hidden" name="detalle" value="${item.detalle}" />
                <input type="submit" value="Modificar" />
            </form>
            
            <!-- Eliminar Habitacion -->
            <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarHabitacion">
                <input type="hidden" name="idhabitacion" value="${item.idhabitacion}" />
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar la Habitación?')" />
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

       function mostrarDetallesHabitacion(ID_Habitacion, idcategoria, num, piso, costo, detalle) {
    document.getElementById('ID_Habitacion').textContent = ID_Habitacion;
    document.getElementById('idcategoria').textContent = idcategoria;
    document.getElementById('num').textContent = num;
    document.getElementById('piso').textContent = piso;
    document.getElementById('costo').textContent = costo;
    document.getElementById('detalle').textContent = detalle;

    // Muestra el pop-up
    abrirPopup();
}

    </script>
</html>
