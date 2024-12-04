/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import controlador.Conexion;
import java.io.Console;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author abelc
 */
public class CarritoModelo extends Conexion {

    public List<Carrito_Productos> getProductsInCart(String usuario) {
        ModeloProducto mp = new ModeloProducto();
        ArrayList<Carrito_Productos> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Llamada al procedimiento almacenado
            String sql = "CALL obtener_productos_carrito_usuario(?)";
            pst = getConexion().prepareStatement(sql);
            pst.setString(1, usuario);
            rs = pst.executeQuery();  // Ejecutar la consulta

            // Verificar si hay productos
            while (rs.next()) {
                // Verificamos que el idProducto sea válido
                int idProducto = rs.getInt("idProducto");
                if (idProducto <= 0) {
                    continue; // Si no hay producto válido, continuamos con el siguiente
                }

                // Crear el objeto Producto
                Producto producto = mp.getProductById(idProducto);

                // Verificar si el producto existe (no debería ser null)
                if (producto == null) {
                    continue; // Si el producto no se encuentra, continuamos con el siguiente
                }

                // Crear el objeto Carrito_Productos con la información obtenida
                Carrito_Productos p = new Carrito_Productos(
                        rs.getInt("idCarritoProductos"), // idCarritoProductos
                        0, // No necesitamos el id_carrito aquí, asignamos 0
                        producto, // Producto
                        rs.getInt("cantidad"), // Cantidad
                        producto.getPrecio() * rs.getInt("cantidad") // Precio total
                );

                // Añadir el producto al ArrayList
                productos.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error en getProductsInCart: " + e.getMessage());
        } finally {
            try {
                // Cerrar ResultSet y PreparedStatement
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
        return productos;
    }

    public boolean agregarProductoAlCarrito(String producto, String usuario) {
        PreparedStatement pst = null;
        ModeloProducto mp = new ModeloProducto();
        Producto prod = mp.getProductByName(producto);
        try {
            String sql = "CALL agregarProductoAlCarrito(?, ?)";
            pst = getConexion().prepareStatement(sql);
            pst.setInt(1, prod.getIdProducto());
            pst.setString(2, usuario);
            pst.executeUpdate();
            System.out.println(prod.getNombre() + "  ID:" + prod.getIdProducto());
            return true;
        } catch (SQLException e) {
            System.out.println("Error al agregar producto al carrito: " + e.getMessage());
            return false;
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }

            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
    }

    public boolean eliminarProductoDelCarrito(String productoId, String usuario) {
        System.out.println(productoId + usuario);
        PreparedStatement pst = null;
        try {
            // Llamada al procedimiento almacenado para eliminar el producto del carrito
            String sql = "CALL eliminarProductoDelCarrito(?, ?)";
            pst = getConexion().prepareStatement(sql);
            pst.setString(1, productoId); // ID del producto a eliminar
            pst.setString(2, usuario);    // Usuario propietario del carrito

            int filasAfectadas = pst.executeUpdate(); // Ejecutar el procedimiento almacenado

            // Si al menos una fila fue afectada, la eliminación fue exitosa
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.out.println("Error al eliminar producto del carrito: " + e.getMessage());
            System.out.println(productoId + usuario);
            return false;
        } finally {
            try {
                // Cerrar el PreparedStatement y la conexión
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
    }

    public boolean vaciarCarrito(String usuario) {
        PreparedStatement pst = null;
        try {
            String sql = "DELETE cp FROM carrito_productos cp "
                    + "JOIN carrito c ON cp.id_carrito = c.idCarrito "
                    + "JOIN usuario u ON c.id_usuario = u.idUsuario "
                    + "WHERE u.nombre = ?";
            pst = getConexion().prepareStatement(sql);
            pst.setString(1, usuario);

            int rowsDeleted = pst.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.out.println("Error al vaciar el carrito: " + e.getMessage());
            return false;
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
    }
}
