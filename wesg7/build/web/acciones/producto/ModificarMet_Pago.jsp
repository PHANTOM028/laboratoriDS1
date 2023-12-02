
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Producto</title>
    </head>
    <body>
        <h1>Modificar pago</h1>
        <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarMetPago">
    <div>
        <label>ID Método de Pago:</label>
        <input type="text" name="idmet_pago" id="idmet_pago" value="${param.idmet_pago}" readonly /><br>
        <label>Tipo:</label>
        <input type="text" name="tipo" id="tipo" value="${param.tipo}" required /><br>
        <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el Método de Pago?')" /><br><br> 
    </div>
    <div>
        <a href="/wesg7/?accion=GestionMetPago">Regresar</a><br><br>
    </div>             
</form>

    </body>
</html>
