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
                // Si no hay productos (filas con valores nulos), continuamos con la siguiente iteración
                if (rs.getObject("idProducto") == null) {
                    continue;
                }

                // Crear el objeto Producto usando el idProducto que obtenemos en el resultado
                Producto producto = mp.getProductById(rs.getInt("idProducto"));

                Carrito_Productos p = new Carrito_Productos(
                        rs.getInt("idProducto"), // idProducto
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
            return true;
        } catch (SQLException e) {
            System.out.println("Error al agregar producto al carrito: " + e.getMessage());
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
