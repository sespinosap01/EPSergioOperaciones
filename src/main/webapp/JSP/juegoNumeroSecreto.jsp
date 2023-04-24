<%-- 
    Document   : juegoNumeroSecreto
    Created on : 21-abr-2023, 13:15:14
    Author     : Sergio
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Numero Secreto</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/styleNumeroSecreto.css">

    </head>
    <body>
        <%
            boolean acierto = false;
            int intentos = 0;
            int numeroSecreto = (int) (Math.random() * 100) + 1;
            List<Integer> numerosIntroducidos = new ArrayList<Integer>();
            List<String> resultados = new ArrayList<String>();
            if (request.getParameter("ocultar") == null) {
        %>
        <h1>Juego del numero secreto</h1>
        <br>
        <h4>Explicacion del juego</h4>
        <br>
        <p>El ordenador piensa un numero y tenermos que averiguarlo en los menos intentos posibles, debes introducir un numero entre el 1 y el 100 y el juego te ira dando pistas en base al numero que hayas escrito y el numero secreto. ¡Buena suerte!</p>
        <form method="post" action="${pageContext.request.contextPath}/JSP/juegoNumeroSecreto.jsp">
            <br>
            <input type="hidden" name="ocultar" value="true">
            <input type="hidden" name="numeroSecreto" value="<%=numeroSecreto%>">
            <input type="hidden" name="intentos" value="<%=intentos%>"> 
            <input type="number" name="numIntroducido" value="1" min="1" max="100" step="1">
            <input type="submit" value="Intentar">                    
        </form>
        <br>
        <%        } else {
            int numIntroducido = Integer.parseInt(request.getParameter("numIntroducido"));
            String resultadoTabla = "";
            numeroSecreto = Integer.parseInt(request.getParameter("numeroSecreto"));
            intentos = Integer.parseInt(request.getParameter("intentos"));
            intentos++;

            if (numIntroducido == numeroSecreto) {
                resultadoTabla = "¡Has acertado!";
                acierto = true;
            } else if (numIntroducido < numeroSecreto) {
                resultadoTabla = "El numero secreto es mayor";
            } else {
                resultadoTabla = "El numero secreto es menor";
            }
            numerosIntroducidos.add(numIntroducido);
            resultados.add(resultadoTabla);
        %>
        <h1>Juego del numero secreto</h1>
        <br>
        <h4>Explicacion del juego</h4>
        <br>
        <p>El ordenador piensa un numero y tenermos que averiguarlo en los menos intentos posibles, debes introducir un numero entre el 1 y el 100 y el juego te ira dando pistas en base al numero que hayas escrito y el numero secreto. ¡Buena suerte!</p>
        <form method="post" action="${pageContext.request.contextPath}/JSP/juegoNumeroSecreto.jsp">
            <br>
            <input type="hidden" name="ocultar" value="true">
            <input type="hidden" name="numeroSecreto" value="<%=numeroSecreto%>">
            <input type="hidden" name="intentos" value="<%=intentos%>">

            <input type="hidden" name="numerosIntroducidos" value="<%=numerosIntroducidos%>">
            <input type="hidden" name="resultados" value="<%=resultados%>">

            <%if (acierto == false) {%>
            <input type="number" name="numIntroducido" value="" min="1" max="100" step="1" required>
            <input type="submit" value="Intentar">                    
            <%}%>
        </form>
        <br>
        <table border="1">
            <tr>
                <th>Numero</th>
                <th>Resultado</th>
            </tr>
            <%--NO SE MUESTRA CORRECTAMENTE--%>
            <% for (int i = 0; i < numerosIntroducidos.size(); i++) {%>
            <tr>
                <td><%=numerosIntroducidos.get(i)%></td>
                <td><%=resultados.get(i)%></td>
                <%}%>
        </table>
        <%if (acierto == true) {%>
        <br>
        <p>El número secreto era: <%=numeroSecreto%></p>
        <p>Intentos: <%=intentos%></p>
        <%}%>
        <br>
        <%}//cierre else general%>
        <a href="${pageContext.request.contextPath}/index.html">Volver</a>             
    </body>
</html>
