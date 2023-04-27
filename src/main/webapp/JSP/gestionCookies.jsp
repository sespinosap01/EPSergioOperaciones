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
        <h1>Gestión de cookies</h1>
        <br>
        <form action="gestionCookies.jsp" method="post">
            <label for="nombreIntroducido">Nombre de la cookie:</label>
            <input type="text" name="nombreIntroducido" id="nombreIntroducido" required><br><br>           
            <label for="valorIntroducido">Valor de la cookie:</label>
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
                String resultado = "asd";
                boolean existeCookie = false;

                Cookie valorCookie = null;
                Cookie[] arrayCookies = request.getCookies();

                switch (opcion) {
                    case "Crear":
                        if (arrayCookies != null) {
                            for (int i = 0; i < arrayCookies.length; i++) {
                                if (arrayCookies[i].getName().equals(nombreIntroducido)) {
                                    existeCookie = true;
                                    break;
                                }
                            }
                        }

                        if (existeCookie) {
                            resultado = "Ya existe una cookie con el nombre: " + nombreIntroducido;
                        } else {
                            valorCookie = new Cookie(nombreIntroducido, URLEncoder.encode(valorIntroducido, "UTF-8"));
                            valorCookie.setMaxAge(86400);
                            response.addCookie(valorCookie);
                            String msg = "";
                            msg = URLDecoder.decode(valorCookie.getValue(), "UTF-8");
                            resultado = "Se ha creado la cookie " + nombreIntroducido + " con el valor: " + msg;
                        }
                        break;
                    case "Visualizar":
                        if (arrayCookies != null) {
                            for (int i = 0; i < arrayCookies.length; i++) {
                                if (arrayCookies[i].getName().equals(nombreIntroducido)) {
                                    valorCookie = arrayCookies[i];
                                    String msg = "";
                                    msg = URLDecoder.decode(valorCookie.getValue(), "UTF-8");
                                    resultado = "El valor de la cookie " + nombreIntroducido + " es: " + msg;
                                    break;
                                } else {
                                    resultado = "No existe una cookie con el nombre: " + nombreIntroducido;

                                }
                            }
                        }
                        break;
                    case "Modificar":
                        if (arrayCookies != null) {
                            for (int i = 0; i < arrayCookies.length; i++) {
                                if (arrayCookies[i].getName().equals(nombreIntroducido)) {
                                    existeCookie = true;
                                    arrayCookies[i].setValue(URLEncoder.encode(valorIntroducido, "UTF-8"));
                                    arrayCookies[i].setMaxAge(86400);
                                    response.addCookie(arrayCookies[i]);
                                    resultado = "Se ha modificado la cookie " + nombreIntroducido + " con el valor: " + valorIntroducido;
                                    break;
                                }
                            }
                        }
                        if (!existeCookie) {
                            resultado = "La cookie " + nombreIntroducido + " no existe";
                        }
                        break;
                    case "Eliminar":
                        if (arrayCookies != null) {
                            for (int i = 0; i < arrayCookies.length; i++) {
                                if (arrayCookies[i].getName().equals(nombreIntroducido)) {
                                    valorCookie = new Cookie(nombreIntroducido, "");
                                    valorCookie.setMaxAge(0);
                                    response.addCookie(valorCookie);
                                    resultado = "Se ha borrado la cookie: " + nombreIntroducido;
                                    break;
                                } else {
                                    resultado = "La cookie" + nombreIntroducido + " introducida no existe";
                                }
                            }
                        }
                        break;
                    default:
                        resultado = "";
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
