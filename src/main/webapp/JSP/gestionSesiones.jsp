<%-- 
    Document   : gestionCookies
    Created on : 27-abr-2023, 16:29:50
    Author     : Sergio
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de cookies</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styleNumeroSecreto.css">
    </head>
    <body>
        <h1>Gestión de sesiones</h1>
        <br>
        <form action="gestionSesiones.jsp" method="post">
            <label for="nombreIntroducido">Nombre de la sesión:</label>
            <input type="text" name="nombreIntroducido" id="nombreIntroducido" required><br><br>           
            <label for="valorIntroducido">Valor de la sesión:</label>
            <input type="text" name="valorIntroducido" id="valorIntroducido">
            <br><br>           
            <input type="submit" name="opcion" value="Crear">
            <input type="submit" name="opcion" value="Visualizar">
            <input type="submit" name="opcion" value="Modificar">
            <input type="submit" name="opcion" value="Eliminar">
        </form>
        <br>
        <%
            if (request.getParameter("opcion") != null) {
                String opcion = request.getParameter("opcion");
                String nombreIntroducido = request.getParameter("nombreIntroducido").replace(" ", "");
                String valorIntroducido = request.getParameter("valorIntroducido");
                String valorSesion = "";
                StringBuilder resultado = new StringBuilder();
                HttpSession sesion = request.getSession(true);
                boolean existeSesion = false;

                switch (opcion) {
                    case "Crear":
                        if (sesion.getAttribute(nombreIntroducido) != null) {
                            existeSesion = true;
                        }
                        if (existeSesion) {
                            resultado.append("Ya existe una sesion con el nombre: ").append(nombreIntroducido);
                        } else {
                            sesion.setAttribute(nombreIntroducido, valorIntroducido);
                            resultado.append("Se ha creado la sesion ").append(nombreIntroducido).append(" con el valor: ").append(valorIntroducido);
                        }
                        break;
                    case "Visualizar":
                        if (sesion.getAttribute(nombreIntroducido) != null) {
                            valorSesion = (String) sesion.getAttribute(nombreIntroducido);
                            resultado.append("El valor de la sesion ").append(nombreIntroducido).append(" es: ").append(valorSesion);
                        } else {
                            resultado.append("No existe una sesión con el nombre: ").append(nombreIntroducido);
                        }
                        break;
                    case "Modificar":
                        if (sesion.getAttribute(nombreIntroducido) != null) {
                            sesion.setAttribute(nombreIntroducido, valorIntroducido);
                            resultado.append("Se ha modificado la sesión ").append(nombreIntroducido).append(" con el valor: ").append(valorIntroducido);

                        } else {
                            resultado.append("La sesión ").append(nombreIntroducido).append(" no existe");
                        }
                        break;
                    case "Eliminar":
                        if (sesion.getAttribute(nombreIntroducido) != null) {
                            sesion.removeAttribute(nombreIntroducido);
                            resultado.append("Se ha borrado la sesión ").append(nombreIntroducido);
                        } else {
                            resultado.append("La sesión ").append(nombreIntroducido).append(" no existe");
                        }
                        break;
                    default:
                        resultado.append("");
                }
        %>
        <%=resultado%>
        <br><br>
        <%
            }//cierre del primer if
        %>
        <a href="${pageContext.request.contextPath}/index.html">Volver</a>             
    </body>

</html>
