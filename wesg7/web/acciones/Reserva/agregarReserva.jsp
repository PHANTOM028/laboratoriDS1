
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Reserva</title>
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
        <h1>Agregar nueva Reserva </h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=AgregarReserva">
         <div>
               <label>ID Reserva:</label>
               <input type="text" name="idreserva" id="idreserva" required /><br>
               <label>ID Cliente:</label>
               <input type="text" name="idcliente" id="idcliente" required /><br>
               <label>ID Recepcionista:</label>
               <input type="text" name="idrecepcionista" id="idrecepcionista" required /><br>
               <label>ID Paquete:</label>
               <input type="text" name="idpaquete" id="idpaquete" required /><br>
               <label>Fecha:</label>
               <input type="date" name="fecha" id="fecha" required /><br><br>
               <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la Reserva?')" /><br><br>
             </div><br>
       <div>
        <a href="/wesg7/?accion=GestionReserva">Volver al inicio</a>
    </div>
</form>


    </body>
</html>
