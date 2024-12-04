package controlador;

import Modelo.CarritoModelo;
import Modelo.Carrito_Productos;
import Modelo.Producto;

import java.util.List;

/**
 *
 * @author abelc
 */
public class ControladorCarrito {

    private CarritoModelo carritoModelo;
    private float total;

    public ControladorCarrito() {
        // Inicializamos el modelo
        this.carritoModelo = new CarritoModelo();
    }

    /**
     * Carga los productos en el carrito de un usuario en formato HTML.
     *
     * @param usuario El nombre del usuario cuyo carrito se quiere cargar.
     * @return El código HTML con la lista de productos del carrito.
     */
    public String cargarCarrito(String usuario) {
        if (usuario == null || usuario.isEmpty()) {
            throw new IllegalArgumentException("El nombre de usuario no puede estar vacío");
        }

        System.out.println("Usuario que entra al método: " + usuario);

        StringBuilder htmlCode = new StringBuilder();

        List<Carrito_Productos> productos = carritoModelo.getProductsInCart(usuario);

        System.out.println();

        if (productos.isEmpty()) {
            htmlCode.append("<tr><td colspan='5'>No hay productos en el carrito.</td></tr>");
        } else {
            for (Carrito_Productos cp : productos) {
                if (cp.getProducto() != null) {
                    float precioTotal = cp.getProducto().getPrecio() * cp.getCantidad();
                    total += precioTotal;
                    htmlCode.append("<tr>")
                            .append("<td><img src=\"").append(cp.getProducto().getImagen()).append("\" alt=\"Producto\" class=\"product-image\"></td>")
                            .append("<td>")
                            .append("<p class=\"mb-1 fw-bold\">").append(cp.getProducto().getNombre()).append("</p>")
                            .append("<p class=\"mb-0\">").append(cp.getProducto().getDescripcion()).append("</p>")
                            .append("</td>")
                            .append("<td>").append(cp.getCantidad()).append("</td>")
                            //                            .append("<button type=\"submit\" class=\"btn btn-success btn-sm mt-2\">Actualizar</button>")
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
                } else {
                    htmlCode.append("<tr><td colspan='5'>Producto no disponible.</td></tr>");
                }
            }
            System.out.println("Total:" + total);
        }

        return htmlCode.toString();
    }

    /**
     * Agrega un producto al carrito de un usuario.
     *
     * @param producto El ID del producto a agregar.
     * @param usuario El nombre del usuario.
     * @return true si el producto se agregó correctamente, false en caso
     * contrario.
     */
    public boolean agregarProductoAlCarrito(String producto, String usuario) {
        if (producto == null || producto.isEmpty() || usuario == null || usuario.isEmpty()) {
            throw new IllegalArgumentException("El producto o usuario no puede estar vacío");
        }

        // Llamar al método del modelo para agregar el producto al carrito
        return carritoModelo.agregarProductoAlCarrito(producto, usuario);
    }

    /**
     * Elimina un producto del carrito de un usuario.
     *
     * @param producto El ID del producto a eliminar.
     * @param usuario El nombre del usuario.
     * @return true si el producto se eliminó correctamente, false en caso
     * contrario.
     */
    public boolean eliminarProductoDelCarrito(String producto, String usuario) {
        if (producto == null || producto.isEmpty() || usuario == null || usuario.isEmpty()) {
            throw new IllegalArgumentException("El producto o usuario no puede estar vacío");
        }

        // Llamar al método del modelo para eliminar el producto del carrito
        return carritoModelo.eliminarProductoDelCarrito(producto, usuario);
    }

    // Método para obtener el total fuera de la clase
    public float getTotal() {
        return total;
    }
}
