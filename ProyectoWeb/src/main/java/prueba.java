
import Modelo.ModeloProducto;
import Modelo.Producto;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author abelc
 */
public class prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
           // Nombre del producto a buscar
        String nombreProducto = "Bloodborne";

        // Crear una instancia de ModeloProducto
        ModeloProducto modeloProducto = new ModeloProducto();

        // Llamar al método getProductByName para obtener el producto
        Producto producto = modeloProducto.getProductByName(nombreProducto);

        // Verificar si el producto fue encontrado
        if (producto != null) {
            System.out.println("Producto encontrado:");
            System.out.println("ID: " + producto.getIdProducto());
            System.out.println("Nombre: " + producto.getNombre());
            System.out.println("Descripción: " + producto.getDescripcion());
            System.out.println("Precio: " + producto.getPrecio());
            System.out.println("Stock: " + producto.getStock());
            System.out.println("Categoría: " + producto.getCategoria());
            System.out.println("Imagen: " + producto.getImagen());
        } else {
            System.out.println("Producto no encontrado.");
        }
    }
    }
    

