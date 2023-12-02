
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cliente</title>
    </head>
    <body>
        <h1>Modificar Cliente</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarCliente">
            <div>
                <label>ID Cliente</label>
                <input type="text" name="idCliente" id="idCliente" value="${param.ID_Cliente}" readonly /><br>
                <label>Identificacion:</label>
                <input type="text" name="identificacion" id="identificacion" value="${param.identificacion}" required /><br>
                <label>Nombres:</label>
                <input type="text" name="nombresCliente" id="nombresCliente" value="${param.nombresCliente}" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosCliente" id="apellidosCliente" value="${param.apellidosCliente}" required /><br>
                <label>Teléfono:</label>
                <input type="tel" name="telefono" id="telefono" value="${param.telefono}" required /><br>
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea modificar el cliente?')" /><br><br>
            </div><br>
            <div>
              <a href="/wesg7/?accion=GestionCliente">Volver al inicio</a>
            </div>
        </form>
    </body>
</html>
