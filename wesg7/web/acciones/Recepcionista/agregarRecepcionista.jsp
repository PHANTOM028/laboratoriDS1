
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Recepcionista</title>
    </head>
    <body>
        <c:if test="${exito!=null}">
            <c:if test="${exito}">
                <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p><strong style="color: red;">No se guardó la información</strong></p>
            </c:if>
        </c:if>   
        <h1>Agregar nuevo Recepcionista</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=AgregarRecepcionista">
    <div>
        <!-- Campos de Recepcionista -->
        <label>Nombre Recepcionista:</label>
        <input type="text" name="nombre_recepcionista" id="nombre_recepcionista" required /><br>
        <label>Apellido Recepcionista:</label>
        <input type="text" name="apellido_recepcionista" id="apellido_recepcionista" required /><br>
        <label>Identificación Recepcionista:</label>
        <input type="text" name="identificacion_recepcionista" id="identificacion_recepcionista" required /><br>
        <label>Posición Recepcionista:</label>
        <input type="text" name="posicion_recepcionista" id="posicion_recepcionista" required /><br>
        <!-- Puedes agregar más campos según sea necesario -->

        <br>
        <input type="submit" value="Agregar Recepcionista" onclick="return confirm('¿Desea agregar el Recepcionista?')" /><br><br>
    </div>
    <div>
        <a href="/wesg7/?accion=GestionRecepcionista">Volver al inicio</a>
    </div>
</form>


    </body>
</html>
