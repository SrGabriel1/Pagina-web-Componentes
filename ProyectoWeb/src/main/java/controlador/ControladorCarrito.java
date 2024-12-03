/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import Modelo.CarritoModelo;
import Modelo.Carrito_Productos;

import java.util.List;

/**
 *
 * @author abelc
 */
public class ControladorCarrito {

    private float total; // Variable de clase para almacenar el total

    public String cargarCarrito(String usuario) {
        System.out.println("usuario que entra al metodo: " + usuario);
        CarritoModelo cm = new CarritoModelo();
        StringBuilder htmlcode = new StringBuilder();
        total = 0.00f;
        List<Carrito_Productos> productos = cm.getProductsInCart(usuario);

        if (productos.isEmpty()) {
            htmlcode.append("<tr><td colspan='5'>No hay productos en el carrito.</td></tr>");
        } else {
            for (Carrito_Productos cp : productos) {
                float precioTotal = cp.getProducto().getPrecio() * cp.getCantidad();
                total += precioTotal; // Actualizamos el total

                htmlcode.append("<tr>")
                        .append("<td><img src=\"").append(cp.getProducto().getImagen()).append("\" alt=\"Producto\" class=\"product-image\"></td>")
                        .append("<td>")
                        .append("<p class=\"mb-1 fw-bold\">").append(cp.getProducto().getNombre()).append("</p>")
                        .append("<p class=\"mb-0\">").append(cp.getProducto().getDescripcion()).append("</p>")
                        .append("</td>")
                           .append("<td>")
                    .append("<form action=\"actualizarCarrito.jsp\" method=\"post\">")
                    .append("<input type=\"number\" name=\"cantidad\" class=\"form-control w-50 mx-auto\" min=\"1\" value=\"").append(cp.getCantidad()).append("\">")
                    .append("<button type=\"submit\" class=\"btn btn-success btn-sm mt-2\">Actualizar</button>")
                    .append("</form>")
                    .append("</td>")
                        .append("<td>").append("$").append(String.format("%.2f", cp.getProducto().getPrecio())).append("</td>")
                       .append("<td>")
.append("<form action=\"EliminarProducto\" method=\"post\">")
.append("<input type=\"hidden\" name=\"producto\" value=\"").append(cp.getProducto().getIdProducto()).append("\">")
.append("<input type=\"hidden\" name=\"usuario\" value=\"").append(usuario).append("\">")
.append("<button type=\"submit\" class=\"btn btn-danger btn-sm\"><i class=\"fa fa-trash\"></i> Eliminar</button>")
.append("</form>")
.append("</td>")
                        .append("</tr>");
            }
        }

        return htmlcode.toString();
    }

    public boolean agregarProductoAlCarrito(String producto, String usuario) {
        CarritoModelo cm = new CarritoModelo();
        // Llamar al método en CarritoModelo para agregar el producto al carrito
        boolean resultado = cm.agregarProductoAlCarrito(producto, usuario);
        // Si el producto se agregó correctamente, devolver true
        return resultado;
    }

    public boolean eliminarProductoDelCarrito(String producto, String usuario) {
        CarritoModelo cm = new CarritoModelo();
        // Llamar al método en CarritoModelo para eliminar el producto del carrito
        boolean resultado = cm.eliminarProductoDelCarrito(producto, usuario);

        // Devolver true si la eliminación fue exitosa, false en caso contrario
        return resultado;
    }

    // Método para obtener el total fuera de la clase
    public float getTotal() {
        return total;
    }
}
