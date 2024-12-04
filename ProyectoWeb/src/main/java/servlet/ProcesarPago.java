/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Modelo.CarritoModelo;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Gabriel
 */
public class ProcesarPago extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        String usuario = request.getParameter("usuario");

        if (usuario != null && !usuario.isEmpty()) {
            CarritoModelo carritoModelo = new CarritoModelo();
            boolean carritoVaciado = carritoModelo.vaciarCarrito(usuario);

            if (carritoVaciado) {
                request.setAttribute("mensaje", "Tu pago se ha procesado con éxito. ¡Gracias por tu compra!");
            } else {
                request.setAttribute("mensaje", "Hubo un problema al procesar tu pago. Inténtalo de nuevo.");
            }
        } else {
            request.setAttribute("mensaje", "Usuario no válido. Por favor, inicia sesión.");
        }

        // Redirige a la página del carrito con el mensaje
        request.getRequestDispatcher("carrito.jsp").forward(request, response);
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
