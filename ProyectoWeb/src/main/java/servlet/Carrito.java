package servlet;

import Modelo.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Carrito extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Obtener la lista de productos del carrito desde la sesión
        List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
        if (carrito == null) {
            carrito = new ArrayList<>();
        }

        // Agregar la lista de productos como atributo para usarla en JSP
        session.setAttribute("carrito", carrito);

        // Redirigir al JSP del carrito
        response.sendRedirect("carrito.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Obtener la lista de productos del carrito desde la sesión
        List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
        if (carrito == null) {
            carrito = new ArrayList<>();
        }

        // Leer parámetros enviados desde un formulario o API
        String imagen = request.getParameter("imagen");
        String descripcion = request.getParameter("descripcion");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        float precioUnitario = Float.parseFloat(request.getParameter("precioUnitario"));

        // Crear un nuevo producto
        Producto producto = new Producto(imagen, descripcion, precioUnitario);

        // Añadir el producto a la lista del carrito
        carrito.add(producto);

        // Guardar la lista en la sesión
        session.setAttribute("carrito", carrito);

        // Redirigir al JSP del carrito
        response.sendRedirect("carrito.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet que gestiona el carrito de compras";
    }
}
