

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Recepcionista</title>
    </head>
    <body>
        <h1>Eliminar Recepcionista</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarRecepcionista">
    <div>
        <label>ID Recepcionista: ${recep.id_recepcionista}</label><br>
        <label>Nombres: ${recep.nombre_recepcionista}</label><br>
        <label>Apellidos: ${recep.apellido}</label><br>
        <label>Identificación: ${recep.identificacion}</label><br>
        <label>Posición: ${recep.posicion}</label><br>
        <label>ID Empleado: ${recep.id_empleado}</label><br>
        <label>ID Cargo: ${recep.id_cargo}</label><br>

     
        <input type="hidden" name="ID_Recepcionista" id="ID_Recepcionista" value="${recep.id_recepcionista}" /><br><br>
        
        <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el recepcionista?')" /><br><br>
    </div>
    <div>
        <a href="/wesg7/?accion=GestionRecepcionista">Regresar</a><br><br>
    </div>             
</form>

    </body>
</html>
