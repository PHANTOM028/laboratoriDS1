

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar empleado</title>
    </head>
    <body>
        <h1>Eliminar empleado</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarHabitacion">
    <div>
        <label>ID Habitación: ${param.idhabitacion}</label><br>
        <label>ID Categoría: ${param.idcategoria}</label><br>
        <label>Número: ${param.num}</label><br>
        <label>Piso: ${param.piso}</label><br>
        <label>Costo: ${param.costo}</label><br>
        <label>Detalle: ${param.detalle}</label><br>
        <input type="hidden" name="idhabitacion" id="idhabitacion" value="${param.idhabitacion}" /><br><br>
        <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar la Habitación?')" /><br><br>
    </div>
    <div>
        <a href="/wesg7/?accion=GestionHabitacion">Regresar</a><br><br>
    </div>
</form>

    </body>
</html>
