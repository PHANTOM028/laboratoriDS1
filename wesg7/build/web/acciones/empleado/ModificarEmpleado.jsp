
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Empleado</title>
    </head>
    <body>
        <h1>Modificar empleado</h1>
        <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarEmpleado">
    <div>
        <label for="ID_Empleado">ID Empleado:</label>
        <input type="text" id="ID_Empleado" name="ID_Empleado" value="${param.ID_Empleado}" readonly /><br>

        <label for="DUI_Empleado">DUI:</label>
        <input type="text" id="DUI_Empleado" name="DUI_Empleado" value="${param.DUI_Empleado}" required /><br>

        <label for="ISSS_Empleado">Número de afiliado ISSS:</label>
        <input type="text" id="ISSS_Empleado" name="ISSS_Empleado" value="${param.ISSS_Empleado}" required /><br>

        <label for="nombresEmpleado">Nombres:</label>
        <input type="text" id="nombresEmpleado" name="nombresEmpleado" value="${param.nombresEmpleado}" required /><br>

        <label for="apellidosEmpleado">Apellidos:</label>
        <input type="text" id="apellidosEmpleado" name="apellidosEmpleado" value="${param.apellidosEmpleado}" required /><br>

        <label for="fechaNacEmpleado">Fecha de nacimiento:</label>
        <input type="date" id="fechaNacEmpleado" name="fechaNacEmpleado" value="${param.fechaNacEmpleado}" required /><br>

        <label for="telefonoEmpleado">Teléfono:</label>
        <input type="text" id="telefonoEmpleado" name="telefonoEmpleado" value="${param.telefonoEmpleado}" required /><br>

        <label for="correo">Correo:</label>
        <input type="email" id="correo" name="correo" value="${param.correo}" required /><br>

        <label for="ID_Cargo">ID Cargo:</label>
        <input type="text" id="ID_Cargo" name="ID_Cargo" value="${param.ID_Cargo}" required /><br>

        <label for="ID_Direccion">ID Dirección:</label>
        <input type="text" id="ID_Direccion" name="ID_Direccion" value="${param.ID_Direccion}" required /><br><br>

        <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el empleado?')" /><br><br>
    </div>

    <div>
        <a href="/wesg7/?accion=GestionEmpleados">Regresar</a><br><br>
    </div>
</form>

    </body>
</html>
