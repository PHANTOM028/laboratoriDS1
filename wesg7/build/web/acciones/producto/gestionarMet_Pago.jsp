

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Productos</title>
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
        <h1>Gestión de Pagos</h1>
        <h2>Listado de Pagos</h2>

        <h2>Conexion: ${mensaje_conexion}</h2>
        
        <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/wesg7?accion=AgregarProducto">Agregar Productos</a><br><br>

        <a href="/wesg7?accion=AgregarMetPago">Agregar Métodos de Pago</a><br><br>

<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Tipo</th>
            <th>Opciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listaMetPagos}" var="item">
            <tr>
                <td><c:out value="${item.idmet_pago}" /></td>
                <td><c:out value="${item.tipo}" /></td>

                <!-- opción de modificar y eliminar -->
                <td>
                    <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarMetPago">
                        <input type="hidden" name="idmet_pago" value="${item.idmet_pago}" />
                        <input type="hidden" name="tipo" value="${item.tipo}" />
                        <input type="submit" value="Modificar" />
                    </form>    
                    <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarMetPago">
                        <input type="hidden" name="idmet_pago" value="${item.idmet_pago}" />
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

        function mostrarDetallesMetPago(ID_MetPago, tipo) {
    document.getElementById('ID_MetPago').textContent = ID_MetPago;
    document.getElementById('tipo').textContent = tipo;

    // Muestra el pop-up
    abrirPopup();
}

    </script>
</html>
