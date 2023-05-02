<%-- 
    Document   : controlSesiones
    Created on : 28-abr-2023, 12:51:24
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de sesiones</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styleNumeroSecreto.css">

    </head>
    <body>
        <h1>Control de sesiones</h1>
        <br>
        <form action="controlSesionesBack.jsp" method="post">
            <fieldset>
                <legend>Atributo de la sesión</legend>
                <label for="nombreIntrod">Nombre</label>
                <input type="text" name="nombreIntrod" id="nombreIntrod">
                <input type="submit" name="enviarAtr" value="Buscar">
            </fieldset>
            <br>
            <%
                HttpSession sesion = request.getSession(true);

                    String nombreIntrod = request.getParameter("nombreIntrod");
                    String valorSesion = (String) sesion.getAttribute("nombreIntroducido");

                   if (sesion.getAttribute("nombreIntroducido") != null) {

            %>
            <fieldset>
                <legend>Datos del atributo de sesion</legend>
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" id="nombre"<%
                    if (valorSesion != null) {%>
                       value="<%=valorSesion%>">
                <%}%>
                <br><br>

                <label for="fechaNacimiento">Fecha de nacimiento:</label>
                <input type="date" name="fechaNacimiento" id="fechaNacimiento">
                <br><br>

                <label for="numeroHijos">Número de hijos:</label>
                <input type="number" name="numeroHijos" id="numeroHijos" min="0" step="1">
                <br><br>

                <label for="salario">Salario:</label>
                <input type="number" name="salario" id="salario" min="0" step="any">
            </fieldset>
            <%
                }
            %>
            <br>
            <fieldset>
                <legend>Acciones</legend>
                <form action="controlSesionesBack.jsp" method="post">
                    <input type="submit" name="accionesAtr" value="Crear">
                    <input type="submit" name="accionesAtr" value="Modificar">
                    <input type="submit" name="accionesAtr" value="Eliminar">
                </form>
                <br><br>
                <a href="${pageContext.request.contextPath}/index.html">Volver</a>   
            </fieldset>
        </form>
    </body>
</html>
