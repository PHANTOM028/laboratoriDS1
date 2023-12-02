
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Proveedor</title>
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
        <h1>Agregar nuevo habitacion</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=AgregarHabitacion">
    <div>
        <label>ID Habitación:</label>
        <input type="text" name="idhabitacion" id="idhabitacion" required /><br>
        <label>ID Categoría:</label>
        <input type="text" name="idcategoria" id="idcategoria" required /><br>
        <label>Número:</label>
        <input type="text" name="num" id="num" required /><br>
        <label>Piso:</label>
        <input type="text" name="piso" id="piso" required /><br>
        <label>Costo:</label>
        <input type="text" name="costo" id="costo" required /><br>
        <label>Detalle:</label>
        <input type="text" name="detalle" id="detalle" required /><br><br>
        <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la Habitación?')" /><br><br>
    </div><br>
    <div>
        <a href="/wesg7/?accion=GestionHabitacion">Volver al inicio</a>
    </div>
    </form>


    </body>
</html>
