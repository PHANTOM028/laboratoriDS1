
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Recepcionista</title>
    </head>
    <body>
        <h1>Modificar Recepcionista</h1>
<form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarRecepcionista">
    <div>
        <label>ID Recepcionista:</label>
        <input type="text" name="id_recepcionista" id="id_recepcionista" value="${param.id_recepcionista}" readonly /><br>
        <label>Nombre Recepcionista:</label>
        <input type="text" name="nombre_recepcionista" id="nombre_recepcionista" value="${param.nombre_recepcionista}" required /><br>
        <label>Apellido Recepcionista:</label>
        <input type="text" name="apellido_recepcionista" id="apellido_recepcionista" value="${param.apellido_recepcionista}" required /><br>
        <label>Identificación Recepcionista:</label>
        <input type="text" name="identificacion_recepcionista" id="identificacion_recepcionista" value="${param.identificacion_recepcionista}" required /><br>
        <label>Posición Recepcionista:</label>
        <input type="text" name="posicion_recepcionista" id="posicion_recepcionista" value="${param.posicion_recepcionista}" required /><br>

        <!-- Agrega más campos según sea necesario, como id_empleado, id_cargo, etc. -->

        <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el Recepcionista?')" /><br><br>
           </div>
             <div>
                    <a href="/wesg7/?accion=GestionRecepcionista">Regresar</a><br><br>
         </div>
    </form>

    </body>
</html>
