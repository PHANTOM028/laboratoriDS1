

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Reserva</title>
    </head>
    <body>
        <h1>Eliminar Reserva</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarReserva">
    <div>
        <label>ID Reserva: ${param.ID_Reserva}</label><br>
        <label>ID Cliente: ${param.idcliente}</label><br>
        <label>ID Recepcionista: ${param.idrecepcionista}</label><br>
        <label>ID Paquete: ${param.idpaquete}</label><br>
        <label>Fecha: ${param.fecha}</label><br>
        
        <input type="hidden" name="ID_Reserva" id="ID_Reserva" value="${param.ID_Reserva}" /><br><br>
        <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar la reserva?')" /><br><br>
     </div>
         <div>
        <a href="/wesg7/?accion=GestionReserva">Regresar</a><br><br>
          </div>             
       </form>

    </body>
</html>
