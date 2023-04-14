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
@WebServlet(name = "formularioComplejo", urlPatterns = {"/formularioComplejo"})
public class formularioComplejo extends HttpServlet {

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

        Map<String, String> datosFormulario = new HashMap<>();
        Enumeration<String> nombresParametros = request.getParameterNames();
        while (nombresParametros.hasMoreElements()) {
            String nombreParam = nombresParametros.nextElement();
            String valorParam = request.getParameter(nombreParam);
            datosFormulario.put(nombreParam, valorParam);
        }

        String usuario = datosFormulario.get("usuario");
        String password = datosFormulario.get("password");
        String aficiones = datosFormulario.get("aficiones");
        
//ARREGLAR AFICIONES //ARREGLAR AFICIONES //ARREGLAR AFICIONES //ARREGLAR AFICIONES

        String comentario = datosFormulario.get("comentario");
        String sistemaOperativo = datosFormulario.get("sistemaOperativo");

        String usuarioMostrar = datosFormulario.get("usuario");
        if (usuario.length() <= 0) {
            usuarioMostrar = "Sin informacion";
        }
        String passwordMostrar = datosFormulario.get("password");
        if (password.length() <= 0) {
            passwordMostrar = "Sin informacion";
        }
        String edadMostrar = datosFormulario.get("edad");
        String estadoCivilMostrar = datosFormulario.get("estadoCivil");
        String aficionesMostrar = datosFormulario.get("aficiones");
        if (aficiones == null) {
            aficionesMostrar = "No seleccionado";
        }
        String comentarioMostrar = datosFormulario.get("comentario");
        if (comentario.length() <= 0) {
            comentarioMostrar = "Sin informacion";
        }
        String internetSiNoMostrar = datosFormulario.get("internetSiNo");
        String sistemaOperativoMostrar = datosFormulario.get("sistemaOperativo");
        if (sistemaOperativo == null) {
            sistemaOperativoMostrar = "No seleccionado";
        }
        String digitoMostrar = datosFormulario.get("digito");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"es\">");
            out.println("<head>");
            out.println("<title>Datos formulario complejo</title>");
            out.println("<link rel=\"stylesheet\" href=\"CSS/styleFormularioComplejoDatos.css\">\n");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Datos introducidos</h1>");
            out.println("<br>");
            out.println("<p>Usuario: <b>" + usuarioMostrar + "</b></p>");
            out.println("<p>Contraseña: <b>" + passwordMostrar + "</b></p>");
            out.println("<p>Edad: <b>" + edadMostrar + "</b></p>");
            out.println("<p>Estado civil: <b>" + estadoCivilMostrar + "</b></p>");
            out.println("<p>Aficiones: <b>" + aficionesMostrar + "</b></p>");
            out.println("<p>Comentario: <b>" + comentarioMostrar + "</b></p>");
            out.println("<p>Internet: <b>" + internetSiNoMostrar + "</b></p>");
            out.println("<p>Sistema Operativo: <b>" + sistemaOperativoMostrar + "</b></p>");
            out.println("<p>Digito: <b>" + digitoMostrar + "</b></p>");
            out.println("<br>");
            out.println("<p><a href=\"HTML/formularioComplejo.html\">Volver</a></p>");
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
