/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "formularioReservas", urlPatterns = {"/formularioReservas"})
public class formularioReservas extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, String> datos = new HashMap<>();
        Enumeration<String> nombresParametros = request.getParameterNames();
        while (nombresParametros.hasMoreElements()) {
            String nombreParam = nombresParametros.nextElement();
            String valorParam = request.getParameter(nombreParam);
            datos.put(nombreParam, valorParam);
        }

        String nombre = datos.get("nombre");
        String apellidos = datos.get("apellidos");
        String telefono = datos.get("telefono");
        String email = datos.get("email");
        String noches = datos.get("noches");
        String fEntradaDia = datos.get("fEntradaDia");
        String fEntradaMes = datos.get("fEntradaMes");
        String tipoHabitacion = datos.get("tipoHabitacion");
        String servicios = datos.get("servicios");
        String comentario = datos.get("comentario");
        
        //ARREGLAR GUARDADO DE FECHAS, INPUTS RADIO Y CHECKBOX
        //AÑADIR FOTOS DE CHECK Y ERROR
        //CONTROLAR LOS ERRORES

        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Reservas</title>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("<link rel=\"stylesheet\" href=\"CSS/styleFormularioComplejo.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Formulario de reserva</h1>");
            out.println("<form action=\"formularioReservas\" method=\"post\">");
            out.println("<fieldset>");
            out.println("<legend>Datos Personales</legend>");
            out.println("<label for=\"nombre\">Nombre </label><br>");
            out.println("<input type=\"text\" name=\"nombre\" placeholder=\"Ej. Sergio\" value=\"" + nombre + "\"><br><br>");
            out.println("<label for=\"apellidos\">Apellidos</label><br>");
            out.println("<input type=\"text\" name=\"apellidos\" placeholder=\"Ej. Espinosa Pascua\" value=\"" + apellidos + "\"><br><br>");
            out.println("<label for=\"telefono\">Tel&eacute;fono de contacto</label><br>");
            out.println("<input type=\"text\" name=\"telefono\" placeholder=\"Ej. 924558811\" value=\"" + telefono + "\"><br><br>");
            out.println("<label for=\"email\">Correo electr&oacute;nico</label><br>");
            out.println("<input type=\"text\" name=\"email\" placeholder=\"Ej. usuario@gmail.com\" value=\"" + email + "\"><br><br>");
            out.println("</fieldset>");
            out.println("<fieldset>");
            out.println("<legend>Datos de Reserva</legend>");
            out.println("<label for=\"noches\">N&uacute;mero de noches</label><br>");
            out.println("<input type=\"number\" name=\"noches\" value=\"" + noches + "\"><br><br>");
            out.println("<label for=\"fEntrada\">Fecha de entrada</label><br>");
            out.println("<select name=\"fEntradaDia\">");
            out.println("<option value=\"0\">Elige d&iacute;a </option>");
            out.println("<option value=\"" + fEntradaDia + "\">\"" + fEntradaDia + "\"</option>");
            for (int i = 1; i <= 31; i++) {
                out.println("<option value=\"" + i + "\">" + i + "</option>");
            }
            out.println("</select>");
            out.println("<select name=\"fEntradaMes\">");
            out.println("<option value=\"0\">Elige mes</option>");
            out.println("<option value=\"" + fEntradaMes + "\">\"" + fEntradaMes + "\"</option>");
            out.println("<option value=\"Enero\">Enero</option>");
            out.println("<option value=\"Febrero\">Febrero</option>");
            out.println("<option value=\"Marzo\">Marzo</option>");
            out.println("<option value=\"Abril\">Abril</option>");
            out.println("<option value=\"Mayo\">Mayo</option>");
            out.println("<option value=\"Junio\">Junio</option>");
            out.println("<option value=\"Julio\">Julio</option>");
            out.println("<option value=\"Agosto\">Agosto</option>");
            out.println("<option value=\"Septiembre\">Septiembre</option>");
            out.println("<option value=\"Octubre\">Octubre</option>");
            out.println("<option value=\"Noviembre\">Noviembre</option>");
            out.println("<option value=\"Diciembre\">Diciembre</option>");
            out.println("</select>");
            out.println("<br><br>");
            out.println("<h3>Tipo de habitaci&oacute;n: </h3>");
            out.println("<p>");
            out.println("<input type=\"radio\" name=\"tipoHabitacion\" value=\"simple\" id=\"simple\" checked>");
            out.println("<label for=\"simple\">Simple</label>");
            out.println("<input type=\"radio\" name=\"tipoHabitacion\" value=\"doble\" id=\"doble\">");
            out.println("<label for=\"doble\">Doble</label>");
            out.println("<input type=\"radio\" name=\"tipoHabitacion\" value=\"matrimonio\" id=\"matrimonio\">");
            out.println("<label for=\"matrimonio\">Matrimonio</label>");
            out.println("</p>");
            out.println("<br>");
            out.println("<h3>Servicios adicionales</h3>");
            out.println("<input type=\"checkbox\" name=\"servicios\" value=\"desayuno\" id=\"desayuno\">");
            out.println("<label for=\"desayuno\">Desayuno</label><br>");
            out.println("<input type=\"checkbox\" name=\"servicios\" value=\"comida\" id=\"comida\">");
            out.println("<label for=\"comida\">Comida</label><br>");
            out.println("<input type=\"checkbox\" name=\"servicios\" value=\"cena\" id=\"cena\">");
            out.println("<label for=\"cena\">Cena</label><br>");
            out.println("<input type=\"checkbox\" name=\"servicios\" value=\"camaSupletoria\" id=\"camaSupletoria\">");
            out.println("<label for=\"camaSupletoria\">Cama Supletoria</label><br><br>");
            out.println("<label for=\"comentario\">Comentarios:</label><br>");
            out.println("<textarea name=\"comentario\" cols=\"50\" rows=\"3\" placeholder=\"Escribe aqu&iacute; tus comentarios...\">"+ comentario +"</textarea><br>");
            out.println("</fieldset>");
            out.println("<br>");
            out.println("<input type=\"submit\" name=\"enviar\" value=\"Enviar Formulario\">");
            out.println("<input type=\"reset\" name=\"limpiar\" value=\"Limpiar Formulario\">");
            out.println("</form>");
            out.println("<br>");
            out.println("<p><a href=\"HTML/formularioReservas.html\">Volver</a></p>");
            out.println("</body>");
            out.println("</html>");

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
