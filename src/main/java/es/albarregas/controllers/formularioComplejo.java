/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
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

        //obtener parametros
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        String edad = request.getParameter("edad");
        String estadoCivil = request.getParameter("estadoCivil");
        //aficiones se guarda en un array ya que puede tener tamaños distintos
        String[] aficiones = request.getParameterValues("aficiones[]");
        String comentario = request.getParameter("comentario");
        String internetSiNo = request.getParameter("internetSiNo");
        String sistemaOperativo = request.getParameter("sistemaOperativo");
        String digito = request.getParameter("digito");

        //guardamos los datos en un mapa
        Map<String, String> datosFormulario = new HashMap<>();

        //metemos los datos introducidos en el mapa
        datosFormulario.put("usuarioKey", usuario);
        datosFormulario.put("passwordKey", password);
        datosFormulario.put("edadKey", edad);
        datosFormulario.put("estadoCivilKey", estadoCivil);
        datosFormulario.put("aficionesKey", Arrays.toString(aficiones));
        datosFormulario.put("comentarioKey", comentario);
        datosFormulario.put("internetSiNoKey", internetSiNo);
        datosFormulario.put("sistemaOperativoKey", sistemaOperativo);
        datosFormulario.put("digitoKey", digito);

        //accedemos a los datos con la clave, los guardamos y controlamos salidas erroneas
        String usuarioMostrar = datosFormulario.get("usuarioKey");
        if (usuario.length() <= 0) {
            usuarioMostrar = "Sin informacion";
        }
        String passwordMostrar = datosFormulario.get("passwordKey");
        if (password.length() <= 0) {
            passwordMostrar = "Sin informacion";
        }
        String edadMostrar = datosFormulario.get("edadKey");
        String estadoCivilMostrar = datosFormulario.get("estadoCivilKey");
        String aficionesMostrar = datosFormulario.get("aficionesKey");
        if (aficiones == null) {
            aficionesMostrar = "No seleccionado";
        }
        String comentarioMostrar = datosFormulario.get("comentarioKey");
        if (comentario.length() <= 0) {
            comentarioMostrar = "Sin informacion";
        }
        String internetSiNoMostrar = datosFormulario.get("internetSiNoKey");
        String sistemaOperativoMostrar = datosFormulario.get("sistemaOperativoKey");
        if (sistemaOperativo == null) {
            sistemaOperativoMostrar = "No seleccionado";
        }
        String digitoMostrar = datosFormulario.get("digitoKey");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
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
