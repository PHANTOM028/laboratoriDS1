
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Reserva</title>
    </head>
    <body>
        <h1>Modificar proveedor</h1>
        <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarProveedor">
            <div>
               <label>ID Reserva:</label>
               <input type="text" name="ID_Reserva" id="ID_Reserva" value="${param.ID_Reserva}" readonly /><br>
               <label>ID Cliente:</label>
               <input type="text" name="idcliente" id="idcliente" value="${param.idcliente}" required /><br>
               <label>ID Recepcionista:</label>
               <input type="text" name="idrecepcionista" id="idrecepcionista" value="${param.idrecepcionista}" required /><br>
              <label>ID Paquete:</label>
              <input type="text" name="idpaquete" id="idpaquete" value="${param.idpaquete}" required /><br>
              <label>Fecha:</label>
              <input type="text" name="fecha" id="fecha" value="${param.fecha}" required /><br>
   
            <br>           
        <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar la Reserva?')" /><br><br> 
     </div>

            <div>
                <a href="/wesg7/?accion=GestionProveedor">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
