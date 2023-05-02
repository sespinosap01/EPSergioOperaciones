<%-- 
    Document   : controlSesionesBack
    Created on : 28-abr-2023, 12:54:07
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>controlSesionesBack</title>
    </head>
    <body>
        <%
            String nombreIntrod = request.getParameter("nombreIntrod");
            HttpSession sesion = request.getSession(true);

            if (nombreIntrod != null) {
                sesion.setAttribute("nombreIntroducido", nombreIntrod);
            }else{
                
            }
            response.sendRedirect("controlSesiones.jsp");
        %>
    </body>

</html>
