
import Modelo.CarritoModelo;
import Modelo.Carrito_Productos;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author abelc
 */
public class idk {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       // Definir el nombre del usuario cuyo carrito se va a consultar
        String usuario = "a";  // El nombre del usuario

        // Crear una instancia de CarritoModelo
        CarritoModelo carritoModelo = new CarritoModelo();

        // Obtener la lista de productos del carrito del usuario
        List<Carrito_Productos> productosEnCarrito = carritoModelo.getProductsInCart(usuario);
        // Verificar si el carrito tiene productos
        if (productosEnCarrito.isEmpty()) {
            System.out.println("El carrito de " + usuario + " está vacío.");
        } else {
            System.out.println("Productos en el carrito de " + usuario + ":");
            for (Carrito_Productos producto : productosEnCarrito) {
                // Imprimir detalles de cada producto en el carrito
                System.out.println("Nombre: " + producto.getProducto().getNombre());
                System.out.println("IMg:"+producto.getProducto().getImagen());
                System.out.println("Descripción: " + producto.getProducto().getDescripcion());
                System.out.println("Cantidad: " + producto.getCantidad());
                System.out.println("Precio Unitario: $" + producto.getProducto().getPrecio());
                System.out.println("Total por Producto: $" + producto.getTotal());
                System.out.println("-----------------------------");
            }
        }
    }
    }
    

