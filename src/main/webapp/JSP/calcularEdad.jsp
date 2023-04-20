<%-- 
    Document   : calcularEdad
    Created on : 20-abr-2023, 16:15:54
    Author     : Sergio
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado edad</title>
    </head>
    <body>
        <h1>Resultado de Edad</h1>
        <%
            String nombre = request.getParameter("nombre");

            LocalDate fAct = LocalDate.now();
            LocalDate fNac = LocalDate.parse(request.getParameter("fNac"));
            int edadAnios = Period.between(fNac, fAct).getYears();
            int edadMeses = Period.between(fNac, fAct).getMonths();
            int edadDias = Period.between(fNac, fAct).getDays();

            String aniosStr = "";
            String mesesStr = "";
            String diasStr = "";

            String separador1 = "";
            String separador2 = "";

            //logica separadores
            if (edadAnios > 0 && edadMeses > 0) {
                separador1 = ", ";
            } else {
                separador1 = " y ";
            }

            if (edadMeses > 0 && (edadDias > 0 || edadAnios > 0) || edadDias > 0 && (edadMeses > 0 || edadAnios > 0)) {
                separador2 = " y ";
            }

            //logica años
            if (edadAnios > 1) {
                aniosStr = "" + edadAnios + " años" + separador1 + "";
            } else if (edadAnios == 0) {
                aniosStr = "";
            } else {
                aniosStr = "" + edadAnios + " año" + separador1 + "";
            }

            //logica meses
            if (edadMeses == 1) {
                mesesStr = "" + edadMeses + " mes" + separador2 + "";
            } else if (edadMeses > 0) {
                mesesStr = "" + edadMeses + " meses" + separador2 + "";
            }

            //logica dias
            if (edadDias == 1) {
                diasStr = "" + edadDias + " dia ";
            } else if (edadDias > 0) {
                diasStr = "" + edadDias + " dias ";
            }

            String fraseMostrar = "";
            if (fNac.isAfter(fAct)) {
                fraseMostrar ="No has nacido";
            } else {
                fraseMostrar = "<h3>Hola " + nombre + ", tienes " + aniosStr + mesesStr + diasStr + "</h3>";
            }

        %>
        <p><%=fraseMostrar%></p> 
        <a href="../HTML/calcularEdad.html">Volver atras</a>
    </body>
</html>
