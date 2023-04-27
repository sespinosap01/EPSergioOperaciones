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
                StringBuilder resultado = new StringBuilder();

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
                            resultado.append("Ya existe una cookie con el nombre: ").append(nombreIntroducido);
                        } else {
                            valorCookie = new Cookie(nombreIntroducido, URLEncoder.encode(valorIntroducido, "UTF-8"));
                            valorCookie.setMaxAge(86400);
                            response.addCookie(valorCookie);
                            String msg = "";
                            msg = URLDecoder.decode(valorCookie.getValue(), "UTF-8");
                            resultado.append("Se ha creado la cookie ").append(nombreIntroducido).append(" con el valor: ").append(valorIntroducido);
                        }
                        break;
                    case "Visualizar":
                        if (arrayCookies != null) {
                            for (int i = 0; i < arrayCookies.length; i++) {
                                if (arrayCookies[i].getName().equals(nombreIntroducido)) {
                                    valorCookie = arrayCookies[i];
                                    String msg = "";
                                    msg = URLDecoder.decode(valorCookie.getValue(), "UTF-8");
                                    resultado.append("El valor de la cookie ").append(nombreIntroducido).append(" es: ").append(msg);
                                    break;
                                } else {
                                    resultado.append("No existe una cookie con el nombre: ").append(nombreIntroducido);

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
                                    resultado.append("Se ha modificado la cookie ").append(nombreIntroducido).append(" con el valor: ").append(valorIntroducido);
                                    break;
                                }
                            }
                        }
                        if (!existeCookie) {
                            resultado.append("La cookie ").append(nombreIntroducido).append(" no existe");
                        }
                        break;
                    case "Eliminar":
                        if (arrayCookies != null) {
                            for (int i = 0; i < arrayCookies.length; i++) {
                                if (arrayCookies[i].getName().equals(nombreIntroducido)) {
                                    valorCookie = new Cookie(nombreIntroducido, "");
                                    valorCookie.setMaxAge(0);
                                    response.addCookie(valorCookie);
                                    resultado.append("Se ha borrado la cookie ").append(nombreIntroducido);
                                    break;
                                } else {
                                    resultado.append("La cookie ").append(nombreIntroducido).append(" no existe");
                                }
                            }
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
