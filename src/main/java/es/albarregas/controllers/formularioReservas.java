/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
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
        int nochesInt = Integer.parseInt(noches);
        String fEntradaDia = datos.get("fEntradaDia");
        int fEntradaDiaInt = Integer.parseInt(fEntradaDia);
        String fEntradaMes = datos.get("fEntradaMes");
        String tipoHabitacion = datos.get("tipoHabitacion");
        String[] servicios = request.getParameterValues("servicios[]");
        String comentario = datos.get("comentario");

        //mapeo para establecer cuantos dias tienen los meses
        Map<Integer, Integer> diasPorMes = new HashMap<>();
        diasPorMes.put(0, -1); // Enero
        diasPorMes.put(1, 31); // Enero
        diasPorMes.put(2, 28); // Febrero
        diasPorMes.put(3, 31); // Marzo
        diasPorMes.put(4, 30); // Abril
        diasPorMes.put(5, 31); // Mayo
        diasPorMes.put(6, 30); // Junio
        diasPorMes.put(7, 31); // Julio
        diasPorMes.put(8, 31); // Agosto
        diasPorMes.put(9, 30); // Septiembre
        diasPorMes.put(10, 31); // Octubre
        diasPorMes.put(11, 30); // Noviembre
        diasPorMes.put(12, 31); // Diciembre
        int mesSeleccionado = Integer.parseInt(request.getParameter("fEntradaMes"));
        int diaSeleccionado = Integer.parseInt(request.getParameter("fEntradaDia"));
        int diasPermitidos = diasPorMes.get(mesSeleccionado);

        boolean camposCorrectos = false;
        String cadenaReadOnly = "";
        if (camposCorrectos == true) {
            cadenaReadOnly = "readonly";
        }
        
        //Faltaría por añadir la funcion de escribir el readonly ya que no funciona correctamente

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
            out.println("<div class=\"lineaControl\">");
            out.println("<input type=\"text\" " + cadenaReadOnly + " name=\"nombre\" placeholder=\"Ej. Sergio\" value=\"" + nombre + "\">");
            if (nombre.length() <= 0) {
                out.println("<img src=\"IMG/error.png\" width=\"15px\">");
                camposCorrectos = false;
            } else {
                out.println("<img src=\"IMG/check.png\" width=\"15px\">");
            }
            out.println("</div>");
            out.println("<br>");
            out.println("<label for=\"apellidos\">Apellidos</label><br>");
            out.println("<div class=\"lineaControl\">");
            out.println("<input type=\"text\" name=\"apellidos\" placeholder=\"Ej. Espinosa Pascua\" value=\"" + apellidos + "\">");
            if (apellidos.length() <= 0) {
                out.println("<img src=\"IMG/error.png\" width=\"15px\">");
                camposCorrectos = false;
            } else {
                out.println("<img src=\"IMG/check.png\" width=\"15px\">");
            }
            out.println("</div>");
            out.println("<br>");
            out.println("<label for=\"telefono\">Tel&eacute;fono de contacto</label><br>");
            out.println("<div class=\"lineaControl\">");
            out.println("<input type=\"text\" name=\"telefono\" placeholder=\"Ej. 924558811\" value=\"" + telefono + "\">");
            if (telefono.length() == 9 && (telefono.startsWith("6") || telefono.startsWith("7") || telefono.startsWith("9"))) {
                out.println("<img src=\"IMG/check.png\" width=\"15px\">");

            } else {
                out.println("<img src=\"IMG/error.png\" width=\"15px\">");
                camposCorrectos = false;
            }
            out.println("</div>");
            out.println("<br>");
            out.println("<label for=\"email\">Correo electr&oacute;nico</label><br>");
            out.println("<div class=\"lineaControl\">");
            out.println("<input type=\"text\" name=\"email\" placeholder=\"Ej. usuario@gmail.com\" value=\"" + email + "\">");
            if (email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                out.println("<img src=\"IMG/check.png\" width=\"15px\">");
            } else {
                out.println("<img src=\"IMG/error.png\" width=\"15px\">");
                camposCorrectos = false;
            }
            out.println("</div>");
            out.println("<br>");
            out.println("</fieldset>");
            out.println("<fieldset>");
            out.println("<legend>Datos de Reserva</legend>");
            out.println("<label for=\"noches\">N&uacute;mero de noches</label><br>");
            out.println("<div class=\"lineaControl\">");
            out.println("<input type=\"number\" name=\"noches\" value=\"" + nochesInt + "\">");
            if (nochesInt <= 0) {
                out.println("<img src=\"IMG/error.png\" width=\"15px\">");
                camposCorrectos = false;
            } else {
                out.println("<img src=\"IMG/check.png\" width=\"15px\">");
            }
            out.println("</div>");
            out.println("<br>");
            out.println("<label for=\"fEntrada\">Fecha de entrada</label><br>");
            out.println("<select name=\"fEntradaDia\">");
            if (fEntradaDiaInt == 0) {
                out.println("<option value=\"0\">Elige d&iacute;a</option>");
            } else {
                out.println("<option value=\"" + fEntradaDiaInt + "\">" + fEntradaDiaInt + "</option>");
            }
            for (int i = 1; i <= 31; i++) {
                out.println("<option value=\"" + i + "\">" + i + "</option>");
            }
            out.println("</select>");
            out.println("<select name=\"fEntradaMes\">");
            out.println("<div class=\"lineaControl\">");
            if (fEntradaMes.equals("Elige mes")) {
                out.println("<option value=\"0\" selected >Elige mes</option>");
            } else {
                String nombreMes = "";
                switch (fEntradaMes) {
                    case "1":
                        nombreMes = "Enero";
                        break;
                    case "2":
                        nombreMes = "Febrero";
                        break;
                    case "3":
                        nombreMes = "Marzo";
                        break;
                    case "4":
                        nombreMes = "Abril";
                        break;
                    case "5":
                        nombreMes = "Mayo";
                        break;
                    case "6":
                        nombreMes = "Junio";
                        break;
                    case "7":
                        nombreMes = "Julio";
                        break;
                    case "8":
                        nombreMes = "Agosto";
                        break;
                    case "9":
                        nombreMes = "Septiembre";
                        break;
                    case "10":
                        nombreMes = "Octubre";
                        break;
                    case "11":
                        nombreMes = "Noviembre";
                        break;
                    case "12":
                        nombreMes = "Diciembre";
                        break;
                    default:
                        nombreMes = "Elige mes";
                        break;
                }
                out.println("<option value=\"" + fEntradaMes + "\">" + nombreMes + "</option>");
            }
            out.println("<option value=\"1\">Enero</option>");
            out.println("<option value=\"2\">Febrero</option>");
            out.println("<option value=\"3\">Marzo</option>");
            out.println("<option value=\"4\">Abril</option>");
            out.println("<option value=\"5\">Mayo</option>");
            out.println("<option value=\"6\">Junio</option>");
            out.println("<option value=\"7\">Julio</option>");
            out.println("<option value=\"8\">Agosto</option>");
            out.println("<option value=\"9\">Septiembre</option>");
            out.println("<option value=\"10\">Octubre</option>");
            out.println("<option value=\"11\">Noviembre</option>");
            out.println("<option value=\"12\">Diciembre</option>");
            out.println("</select>");
            if (diaSeleccionado > diasPermitidos) {
                out.println("<img src=\"IMG/error.png\" width=\"15px\">");
                camposCorrectos = false;
            } else {
                out.println("<img src=\"IMG/check.png\" width=\"15px\">");
            }
            out.println("</div>");
            out.println("<br><br>");
            out.println("<h3>Tipo de habitaci&oacute;n: </h3>");
            out.println("<p>");
            if (tipoHabitacion != null && tipoHabitacion.equals("simple")) {
                out.println("<input type=\"radio\" name=\"tipoHabitacion\" value=\"simple\" id=\"simple\" checked>");
            } else {
                out.println("<input type=\"radio\" name=\"tipoHabitacion\" value=\"simple\" id=\"simple\">");
            }
            out.println("<label for=\"simple\">Simple</label>");

            if (tipoHabitacion != null && tipoHabitacion.equals("doble")) {
                out.println("<input type=\"radio\" name=\"tipoHabitacion\" value=\"doble\" id=\"doble\" checked>");
            } else {
                out.println("<input type=\"radio\" name=\"tipoHabitacion\" value=\"doble\" id=\"doble\">");
            }
            out.println("<label for=\"doble\">Doble</label>");

            if (tipoHabitacion != null && tipoHabitacion.equals("matrimonio")) {
                out.println("<input type=\"radio\" name=\"tipoHabitacion\" value=\"matrimonio\" id=\"matrimonio\" checked>");
            } else {
                out.println("<input type=\"radio\" name=\"tipoHabitacion\" value=\"matrimonio\" id=\"matrimonio\">");
            }
            out.println("<label for=\"matrimonio\">Matrimonio</label>");
            out.println("</p>");
            out.println("<br>");
            out.println("<h3>Servicios adicionales</h3>");
            if (servicios != null && Arrays.asList(servicios).contains("desayuno")) {
                out.println("<input type=\"checkbox\" name=\"servicios[]\" value=\"desayuno\" id=\"desayuno\" checked>");
            } else {
                out.println("<input type=\"checkbox\" name=\"servicios[]\" value=\"desayuno\" id=\"desayuno\">");
            }
            out.println("<label for=\"desayuno\">Desayuno</label><br>");
            if (servicios != null && Arrays.asList(servicios).contains("comida")) {
                out.println("<input type=\"checkbox\" name=\"servicios[]\" value=\"comida\" id=\"comida\" checked>");
            } else {
                out.println("<input type=\"checkbox\" name=\"servicios[]\" value=\"comida\" id=\"comida\">");
            }
            out.println("<label for=\"comida\">Comida</label><br>");
            if (servicios != null && Arrays.asList(servicios).contains("cena")) {
                out.println("<input type=\"checkbox\" name=\"servicios[]\" value=\"cena\" id=\"cena\" checked>");
            } else {
                out.println("<input type=\"checkbox\" name=\"servicios[]\" value=\"cena\" id=\"cena\">");
            }
            out.println("<label for=\"cena\">Cena</label><br>");
            if (servicios != null && Arrays.asList(servicios).contains("camaSupletoria")) {
                out.println("<input type=\"checkbox\" name=\"servicios[]\" value=\"camaSupletoria\" id=\"camaSupletoria\" checked>");
            } else {
                out.println("<input type=\"checkbox\" name=\"servicios[]\" value=\"camaSupletoria\" id=\"camaSupletoria\">");
            }
            out.println("<label for=\"camaSupletoria\">Cama Supletoria</label><br>");
            out.println("<br>");
            out.println("<label for=\"comentario\">Comentarios:</label><br>");
            out.println("<textarea name=\"comentario\" cols=\"50\" rows=\"3\" placeholder=\"Escribe aqu&iacute; tus comentarios...\">" + comentario + "</textarea><br>");
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
