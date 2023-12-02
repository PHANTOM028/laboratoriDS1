

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Administrador</title>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="/wesg7">Reserva de Hotel</a></li>
                <li><a href="/wesg7?accion=Login">LogIn</a></li>
                <%-- gestion --%>
                <li><a href="/wesg7?accion=GestionEmpleados">Gestionar Empleados</a></li>
                <li><a href="/wesg7?accion=GestionCliente">Gestionar Cliente</a></li>
                <li><a href="/wesg7?accion=GestionReserva">Gestionar Reserva</a></li>
                <li><a href="/wesg7?accion=GestionRecepcionista">Gestionar Recepcionista</a></li>
                <li><a href="/wesg7?accion=GestionHabitacion">Gestionar Habitacion</a></li>
                <li><a href="/wesg7?accion=GestionMet_pago">Gestionar Met_Pago</a></li>
            </ul>
        </nav>
    </body>
</html>
