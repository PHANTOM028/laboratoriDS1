

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EliminarCliente</title>
    </head>
    <body>
        <h1>Eliminar Cliente</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarCliente">
            <div>
              <label>ID Cliente: ${param.ID_Cliente}</label><br>
                <label>Nombres: ${param.nombresCliente}</label><br>
                <label>Apellidos: ${param.apellidosCliente}</label><br>
                <label>identificacion: ${param.identificacion}</label><br>
                <label>Teléfono: ${param.telefono}</label><br>   
                <input type="hidden" name="ID_Cliente" id="ID_Cliente" value="${param.ID_Cliente}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el cliente?')" /><br><br>
            </div><br>
            <div>
              <a href="/wesg7/?accion=GestionCliente">Volver al inicio</a>
            </div>
        </form>
    </body>
</html>

