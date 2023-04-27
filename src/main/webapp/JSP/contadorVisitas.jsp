<%-- 
    Document   : contadorVisitas
    Created on : 25-abr-2023, 20:41:36
    Author     : Sergio
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contador de visitas</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styleNumeroSecreto.css">

    </head>
    <body>
        <%
            Cookie valorCookie = null;
            int contador = 0;

            Cookie[] arrayCookies = request.getCookies(); //se obtiene un array de cookies
            if (arrayCookies != null) {                        //se comprueba que haya cookies
                for (int i = 0; i < arrayCookies.length; i++) {
                    if (arrayCookies[i].getName().equals("contador")) {
                        contador = Integer.parseInt(arrayCookies[i].getValue());
                        break;
                    }
                }
            }

            contador++;
            valorCookie = new Cookie("contador", Integer.toString(contador));
            valorCookie.setMaxAge(3600);
            response.addCookie(valorCookie);

            //borrar la cookie, se hace asignando un valor vacio a la cookie con el mismo nombre
            if (request.getParameter("envio") != null) {
                if (request.getParameter("envio").equals("Restablecer")) {
                    valorCookie = new Cookie("contador", Integer.toString(0));
                    valorCookie.setMaxAge(0);
                    response.addCookie(valorCookie);
                }
            }
        %>
        <h1>Contador de visitas de la web: <%= contador%></h1>
        <br>
        <form>
            <input type="submit" value="Recargar">
            <input type="submit" name="envio" value="Restablecer">

        </form>
        <br>
        <a href="${pageContext.request.contextPath}/index.html">Volver</a>             

    </body>
</html>
