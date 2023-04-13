/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "Calculadora", urlPatterns = {"/Calculadora"})
public class Calculadora extends HttpServlet {

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

        String opt1 = request.getParameter("op1");
        String opt2 = request.getParameter("op2");
        int result = 0;
        String textResult = "";

        if (opt1 == null || opt1.isEmpty() || opt2 == null || opt2.isEmpty()) {
            textResult = "Alguno de los datos introducidos son erroneos";

        } else {
            int op1 = Integer.parseInt(opt1);
            int op2 = Integer.parseInt(opt2);

            String operacion = request.getParameter("operacion");
            switch (operacion) {
                case "Sumar":
                    result = op1 + op2;
                    textResult = "La suma de " + op1 + " + " + op2 + " es: " + result;
                    break;
                case "Restar":
                    result = op1 - op2;
                    textResult = "La resta de " + op1 + " - " + op2 + " es: " + result;
                    break;
                case "Multiplicar":
                    result = op1 * op2;
                    textResult = "La multiplicacion de " + op1 + " * " + op2 + " es: " + result;
                    break;
                case "Dividir":
                    result = op1 / op2;
                    textResult = "La division de " + op1 + " / " + op2 + " es: " + result;
                    break;
                default:
                    return;
            }
        }

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"es\">");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" href=\"CSS/style.css\">\n");
            out.println("<title>Resultado</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Resultado de la operaci&oacute;n:</h1>");
            out.println("<h3>" + textResult + "</h3>");
            out.println("<p><a href=\"HTML/calculadora.html\">Volver</a></p>");
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
