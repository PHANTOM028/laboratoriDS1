
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Pago</title>
    </head>
    <body>
        <h1>Eliminar pago</h1>

       <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarMetPago">
    <div>
        <label>ID Método de Pago: ${param.idmet_pago}</label><br>
        <label>Tipo: ${param.tipo}</label><br>
        <input type="hidden" name="idmet_pago" id="idmet_pago" value="${param.idmet_pago}" /><br><br>
        <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el Método de Pago?')" /><br><br>
    </div>
    <div>
        <a href="/wesg7/?accion=GestionMetPago">Regresar</a><br><br>
    </div>             
</form>

    </body>
</html>
