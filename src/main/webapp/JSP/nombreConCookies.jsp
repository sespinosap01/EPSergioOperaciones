<%-- 
    Document   : nombreConCookies
    Created on : 25-abr-2023, 19:51:43
    Author     : Sergio
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nombre con Cookies</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styleNumeroSecreto.css">
    </head>
    <body>
        <%
            Cookie valorCookie = null;
            Boolean cookieExiste = false;

            Cookie[] arrayCookies = request.getCookies(); //se obtiene un array de cookies
            if (arrayCookies != null) {                        //se comprueba que haya cookies
                for (int i = 0; i < arrayCookies.length; i++) {
                    if (arrayCookies[i].getName().equals("nombreConCookie")) {
                        valorCookie = arrayCookies[i];          //asigna la cookie con el nombre pedido a la variable
                        break;
                    }
                }
            }

            if (valorCookie == null) {  //si la cookie encontrada no tiene valor se le asigna, en caso contrario ya sabemos que la cookie tiene valor
                valorCookie = new Cookie("nombreConCookie", URLEncoder.encode("Sergio Espinosa", "UTF-8"));
            } else {
                cookieExiste = true;
            }

            valorCookie.setMaxAge(3600); // se le asigna una vida en segundos
            response.addCookie(valorCookie);    //se añade la cookie

            String nombre = "";
            if (cookieExiste) {
                nombre = URLDecoder.decode(valorCookie.getValue(), "UTF-8");
            } else {
                nombre = "Todavia no tenemos datos tuyos";
            }

            //borrar la cookie, se hace asignando un valor vacio a la cookie con el mismo nombre
            if (request.getParameter("envio") != null) {
                if (request.getParameter("envio").equals("Borrar")) {
                    valorCookie = new Cookie("nombreConCookie", "");
                    cookieExiste = false;
                    valorCookie.setMaxAge(0);
                    response.addCookie(valorCookie);
                }
            }

        %>

        <h1><%=nombre%></h1>
        <br>
        <form>
            <input type="submit" name="envio" value="Recargar">
            <input type="submit" name="envio" value="Borrar">
        </form>
        <br>
        <a href="${pageContext.request.contextPath}/index.html">Volver</a>             

    </body>
</html>
