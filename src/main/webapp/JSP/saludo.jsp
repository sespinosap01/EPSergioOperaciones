<%-- 
    Document   : saludo
    Created on : 18-abr-2023, 20:54:18
    Author     : Sergio
--%>

<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Saludo</h1>

        <%
            if (request.getParameter("ocultar") == null) {
        %>
        <form method="post" action="./saludo.jsp" >
            <input type="hidden" name="ocultar" value="true">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" required>

            <p>Genero:
                <label for="hombre">Hombre</label>
                <input type="radio" name="genero" value="hombre" id="hombre" checked>
                <label for="mujer">Mujer</label>
                <input type="radio" name="genero" value="mujer" id="mujer">
            </p>
            <input type="submit" value="Enviar">
        </form>
        <%
        } else {
            String nombre = request.getParameter("nombre");
            String genero = request.getParameter("genero");
            LocalTime horaActual = LocalTime.now();
            int hora = horaActual.getHour();
            String mensajeSaludo = "";
            if (hora >= 20 || hora < 6) {
                mensajeSaludo = "buenas noches";
            } else if (hora >= 6 && hora < 12) {
                mensajeSaludo = "buenos dias";
            } else if (hora >= 12 && hora < 20) {
                mensajeSaludo = "buenas tardes";
            }
            if (genero.equals("hombre")) {
        %>
        <h1>Bienvenido <%=nombre%>, <%=mensajeSaludo%></h1>
        <%
        } else {
        %>
        <h1>Bienvenida <%=nombre%>, <%=mensajeSaludo%></h1>
        <%
            }//cierre else
        %>
        <a href="./saludo.jsp">Volver atras</a>
        <%
            }//cierre else general

        %>
        <br><br>
        <a href="../index.html">Volver al menu</a>
    </body>
</html>
