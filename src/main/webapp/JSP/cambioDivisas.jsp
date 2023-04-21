<%-- 
    Document   : cambioDivisas
    Created on : 20-abr-2023, 18:33:26
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado cambio de divisas</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styleCambioDivisas.css">
    </head>
    <body>
        <h1>Resultado cambio de divisas</h1>
        <br>
        <%
            double eurosALibras = 0.86;
            double eurosAYenes = 128.17;
            double librasAEuros = 1.16;
            double librasAYenes = 150.07;
            double yenesAEuros = 0.0078;
            double yenesALibras = 0.0067;
            double cantidad = Double.parseDouble(request.getParameter("cantidad"));

            String cambioDe = request.getParameter("cambioDe");
            String cambioA = request.getParameter("cambioA");
            String fraseMostrar = "";

            double resultado = 0.0;

            if (cambioDe.equals("Euros") && cambioA.equals("Libras esterlinas")) {
                resultado = cantidad * eurosALibras;
                fraseMostrar = "El cambio de " + cantidad + " " + cambioDe + " a " + cambioA + " son: " + resultado + " " + cambioA + "";
            }
            if (cambioDe.equals("Libras esterlinas") && cambioA.equals("Euros")) {
                resultado = cantidad * librasAEuros;
                fraseMostrar = "El cambio de " + cantidad + " " + cambioDe + " a " + cambioA + " son: " + resultado + " " + cambioA + "";
            }
            if (cambioDe.equals("Euros") && cambioA.equals("Yenes")) {
                resultado = cantidad * eurosAYenes;
                fraseMostrar = "El cambio de " + cantidad + " " + cambioDe + " a " + cambioA + " son: " + resultado + " " + cambioA + "";
            }
            if (cambioDe.equals("Yenes") && cambioA.equals("Euros")) {
                resultado = cantidad * yenesAEuros;
                fraseMostrar = "El cambio de " + cantidad + " " + cambioDe + " a " + cambioA + " son: " + resultado + " " + cambioA + "";
            }
            if (cambioDe.equals("Libras esterlinas") && cambioA.equals("Yenes")) {
                resultado = cantidad * librasAYenes;
                fraseMostrar = "El cambio de " + cantidad + " " + cambioDe + " a " + cambioA + " son: " + resultado + " " + cambioA + "";
            }
            if (cambioDe.equals("Yenes") && cambioA.equals("Libras esterlinas")) {
                resultado = cantidad * yenesALibras;
                fraseMostrar = "El cambio de " + cantidad + " " + cambioDe + " a " + cambioA + " son: " + resultado + " " + cambioA + "";
            }
            if (cambioDe.equals("Euros") && cambioA.equals("Euros")) {
                resultado = cantidad;
                fraseMostrar = "No has realizado ningun cambio, por lo tanto siguen siendo " + cantidad + " " + cambioA + "";
            }
            if (cambioDe.equals("Yenes") && cambioA.equals("Yenes")) {
                resultado = cantidad;
                fraseMostrar = "No has realizado ningun cambio, por lo tanto siguen siendo " + cantidad + " " + cambioA + "";
            }
            if (cambioDe.equals("Libras esterlinas") && cambioA.equals("Libras esterlinas")) {
                fraseMostrar = "No has realizado ningun cambio, por lo tanto siguen siendo " + cantidad + " " + cambioA + "";
                resultado = cantidad;
            }
        %>

        <%=fraseMostrar%>
        <br><br>
        <a href="${pageContext.request.contextPath}/HTML/cambioDivisas.html">Volver</a>             
    </body>
</html>
