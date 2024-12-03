package controlador;

import Modelo.CarritoModelo;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EliminarProducto")
public class EliminarProducto extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String producto = request.getParameter("producto");

        CarritoModelo carritoModelo = new CarritoModelo();
        boolean eliminado = carritoModelo.eliminarProductoDelCarrito(producto, usuario);

        if (eliminado) {
            response.sendRedirect("Carrito"); 
        } else {
            response.getWriter().println("Error al eliminar el producto.");
        }
    }
}