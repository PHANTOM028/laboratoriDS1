
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Proveedor</title>
    </head>
    <body>
        <h1>Modificar Habitacion</h1>
        <<form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarHabitacion">
    <div>
        <label>ID Habitación:</label>
        <input type="text" name="idhabitacion" id="idhabitacion" value="${param.idhabitacion}" readonly /><br>
        <label>ID Categoría:</label>
        <input type="text" name="idcategoria" id="idcategoria" value="${param.idcategoria}" required /><br>
        <label>Número:</label>
        <input type="text" name="num" id="num" value="${param.num}" required /><br>
        <label>Piso:</label>
        <input type="text" name="piso" id="piso" value="${param.piso}" required /><br>
        <label>Costo:</label>
        <input type="text" name="costo" id="costo" value="${param.costo}" required /><br>
        <label>Detalle:</label>
        <input type="text" name="detalle" id="detalle" value="${param.detalle}" required /><br><br>
        <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar la Habitación?')" /><br><br>
    </div>
    <div>
        <a href="/wesg7/?accion=GestionHabitacion">Regresar</a><br><br>
    </div>
</form>

    </body>
</html>
