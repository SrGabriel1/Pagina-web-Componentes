
import controlador.ControladorCarrito;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author abelc
 */
public class Prueba2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Definir el nombre del usuario y el nombre del producto a agregar al carrito
        String usuario = "Abel";
        String producto = "Bloodborne";  // El nombre del producto (juego)

        // Crear una instancia de ControladorCarrito
        ControladorCarrito controladorCarrito = new ControladorCarrito();

        // Intentar agregar el producto al carrito
        boolean productoAgregado = controladorCarrito.agregarProductoAlCarrito(producto, usuario);

        // Verificar si el producto fue agregado correctamente
        if (productoAgregado) {
            System.out.println("El producto '" + producto + "' fue agregado correctamente al carrito de " + usuario + ".");
        } else {
            System.out.println("Hubo un error al agregar el producto '" + producto + "' al carrito de " + usuario + ".");
        }
    }
    }
    

