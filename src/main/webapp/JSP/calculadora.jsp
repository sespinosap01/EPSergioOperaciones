<%-- 
    Document   : calculadora
    Created on : 18-abr-2023, 21:26:10
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calculadora con todas las operaciones</h1>
        <%
            if (request.getParameter("ocultar") == null) {
        %>
        <form method="post" action="./calculadora.jsp">
            <input type="hidden" name="ocultar" value="true">
            <input type="text" name="op1" pattern="^[+-]?\d*\.?\d+$|^[+-]?\d+$">
            <input type="text" name="op2" pattern="^[+-]?\d*\.?\d+$|^[+-]?\d+$">

            <p>
                <input type="submit" name="opciones" value="Sumar">
                <input type="submit" name="opciones" value="Restar">
                <input type="submit" name="opciones" value="Multiplicar">
                <input type="submit" name="opciones" value="Dividir">
            </p>
        </form>

        <%
        } else {
            String opciones = request.getParameter("opciones");

            String op1Str = request.getParameter("op1");
            Double op1 = Double.parseDouble(op1Str);

            String op2Str = request.getParameter("op2");
            Double op2 = Double.parseDouble(op2Str);

            String msgError = "";

            Double resultado = 0.0;
            String textoResultado = "";

            switch (opciones) {
                case "Sumar":
                    resultado = op1 + op2;
                    textoResultado = "La suma de " + op1 + "+" + op2 + "=" + resultado;
                    break;
                case "Restar":
                    if (op1 < op2) {
                        msgError = "El primer operando debe ser mayor que el segundo operando";
                    } else {
                        resultado = op1 - op2;
                        textoResultado = "La resta de " + op1 + "-" + op2 + "=" + resultado;
                    }
                    break;
                case "Multiplicar":
                    resultado = op1 * op2;
                    textoResultado = "La multiplicacion de " + op1 + "*" + op2 + "=" + resultado;
                    break;
                case "Dividir":
                    if (op2 == 0) {
                        msgError = "No se puede dividir entre cero";
                    } else {
                        resultado = op1 / op2;
                        textoResultado = "La division de " + op1 + "/" + op2 + "=" + resultado;
                    }
                    break;
                default:
                    break;
            }


        %>
        <p><%=textoResultado%><%=msgError%></p>
        <%

        %>
        <a href="./calculadora.jsp">Volver atras</a>
        <%            }
//cierre else general
%>
        <br><br>
        <a href="../index.html">Volver al menu</a>
    </body>
</html>
