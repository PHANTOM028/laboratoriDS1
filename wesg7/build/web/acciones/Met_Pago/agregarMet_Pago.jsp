   
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Agregar Pago</title>
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
            <h1>Agregar nuevo pago</h1>

            <form method="POST" action="/wesg7/ServletPrincipal?accion=AgregarMetPago">
    <div>
        <label>Tipo:</label>
        <input type="text" name="tipo" id="tipo" required /><br>
        <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el Método de Pago?')" /><br><br>
    </div><br>
    <div>
        <a href="/wesg7/?accion=GestionMetPago">Volver al inicio</a>
    </div>
</form>


        </body>
    </html>
