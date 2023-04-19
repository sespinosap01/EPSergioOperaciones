<%-- 
    Document   : sumar
    Created on : 18-abr-2023, 20:24:44
    Author     : Sergio
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sumar</title>
    </head>
    <body>

        <%
            if (request.getParameter("switch") == null) {
        %>
        <form method="post" action="./sumar.jsp" >
            <input type="hidden" name="switch" value="true">
            <table>
                <tr>
                    <td>Primer número:</td>
                    <td><input name="param1"></td>
                </tr>
                <tr>
                    <td>Segundo número:</td>
                    <td><input name="param2"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Sumar"></td>
                </tr>
            </table>
        </form>
        <%
        } else {
            try {
                int param1 = Integer.parseInt(request.getParameter("param1"));
                int param2 = Integer.parseInt(request.getParameter("param2"));
                int result = param1 + param2;
        %>
        <p>El resultado de la suma de <%=param1%> + <%=param2%> es: <%=result%></p>
        <%
        } catch (NumberFormatException ex) {
        %>
        <p>Alguno de los números no contenía dígitos válidos...</p>
        <%
            }
        %>
        <p><%= Calendar.getInstance().getTime()%></p>
        <a href="./sumar.jsp">Volver a sumar</a>
        <%
            }
        %>
        <br><br>
        <a href="../index.html">Volver al menu</a>
    </body>
</html>
