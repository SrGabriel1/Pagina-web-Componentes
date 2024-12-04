/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import controlador.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author abelc
 */
public class ModeloProducto extends Conexion {

    public ArrayList<Producto> getAllProducts() {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Llamada al procedimiento almacenado
            String sql = "CALL obtener_todos_los_productos()";
            pst = getConexion().prepareStatement(sql);
            rs = pst.executeQuery();  // Ejecutar la consulta

            while (rs.next()) {
                // Crear el objeto Producto usando el constructor con parámetros
                Producto producto = new Producto(
                        rs.getInt("idProducto"),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getFloat("precio"),
                        rs.getInt("stock"),
                        rs.getString("categoria"),
                        rs.getString("imagen")
                );

                // Añadir el producto al ArrayList
                productos.add(producto);
            }
        } catch (SQLException e) {
            System.out.println("Error en getAllProducts: " + e.getMessage());
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

    public ArrayList<Producto> getProductsByCategory(String categoria) {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Llamada al procedimiento almacenado para obtener productos por categoría
            String sql = "CALL obtener_productos_por_categoria(?)";  // Asumimos que el procedimiento toma la categoría como parámetro
            pst = getConexion().prepareStatement(sql);
            pst.setString(1, categoria);  // Establecemos la categoría que nos pasa el parámetro
            rs = pst.executeQuery();  // Ejecutar la consulta

            while (rs.next()) {
                // Crear el objeto Producto usando el constructor con parámetros
                Producto producto = new Producto(
                        rs.getInt("idProducto"),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getFloat("precio"),
                        rs.getInt("stock"),
                        rs.getString("categoria"),
                        rs.getString("imagen")
                );

                // Añadir el producto al ArrayList
                productos.add(producto);
            }
        } catch (SQLException e) {
            System.out.println("Error en getProductsByCategory: " + e.getMessage());
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

    public Producto getProductById(int idProducto) {
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM producto WHERE idProducto = ?";
            pst = getConexion().prepareStatement(sql);
            pst.setInt(1, idProducto);
            rs = pst.executeQuery();

            if (rs.next()) {
                producto = new Producto(
                        rs.getInt("idProducto"),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getFloat("precio"),
                        rs.getInt("stock"),
                        rs.getString("categoria"),
                        rs.getString("imagen")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error en getProductById: " + e.getMessage());
        } finally {
            try {
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
                System.out.println("Error al cerrar recursos en getProductById: " + e.getMessage());
            }
        }

        return producto;
    }

    public Producto getProductByName(String NombreProducto) {
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Consulta simple para obtener un producto por su ID
            String sql = "SELECT * FROM producto WHERE nombre = ?";
            pst = getConexion().prepareStatement(sql);
            pst.setString(1, NombreProducto);  // Establecemos el idProducto como parámetro
            rs = pst.executeQuery();  // Ejecutar la consulta

            if (rs.next()) {
                // Crear el objeto Producto usando el constructor con parámetros
                producto = new Producto(
                        rs.getInt("idProducto"),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getFloat("precio"),
                        rs.getInt("stock"),
                        rs.getString("categoria"),
                        rs.getString("imagen")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error en getProductByName: " + e.getMessage());
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
        return producto;
    }
}
