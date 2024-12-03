/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import Modelo.ModeloProducto;
import Modelo.Producto;
import java.util.ArrayList;

/**
 *
 * @author abelc
 */
public class ControladorProducto {
    
    public String getProductos() {
        ModeloProducto mp = new ModeloProducto();
        StringBuilder htmlcode = new StringBuilder();

        // Obtener todos los productos
        ArrayList<Producto> productos = mp.getAllProducts();
        
        for (Producto producto : productos) {
            htmlcode.append("<div class=\"col-md-3 col-sm-4 col-xs-6 mb-4 product\" data-category=\"")
                    .append(producto.getCategoria()).append("\">")
                    .append("<a href=\"#\" class=\"product-link\" data-name=\"").append(producto.getNombre())
                    .append("\" data-description=\"").append(producto.getDescripcion())
                    .append("\" data-stock=\"").append(producto.getStock())
                    .append("\" data-price=\"$").append(producto.getPrecio()).append("\">")
                    .append("<img src=\"").append(producto.getImagen()).append("\" alt=\"").append(producto.getNombre())
                    .append("\" class=\"img-fluid\" style=\"object-fit: cover; height: 200px; width: 100%;\">")
                    .append("</a>")
                    .append("<p class=\"text-center\">$").append(producto.getPrecio()).append("</p>")
                    .append("</div>");
        }
        System.out.println(htmlcode.toString());
        return htmlcode.toString();
    }
    
    public String getProductosCategoria(String categoria) {
        ModeloProducto mp = new ModeloProducto();
        StringBuilder htmlcode = new StringBuilder();

        // Obtener productos por categoría
        ArrayList<Producto> productos = mp.getProductsByCategory(categoria);
        
        for (Producto producto : productos) {
            htmlcode.append("<div class=\"col-md-3 col-sm-4 col-xs-6 mb-4 product\" data-category=\"")
                    .append(producto.getCategoria()).append("\">")
                    .append("<a href=\"#\" class=\"product-link\" data-name=\"").append(producto.getNombre())
                    .append("\" data-description=\"").append(producto.getDescripcion())
                    .append("\" data-stock=\"").append(producto.getStock())
                    .append("\" data-price=\"$").append(producto.getPrecio()).append("\">")
                    .append("<img src=\"").append(producto.getImagen()).append("\" alt=\"").append(producto.getNombre())
                    .append("\" class=\"img-fluid\" style=\"object-fit: cover; height: 200px; width: 100%;\">")
                    .append("</a>")
                    .append("<p class=\"text-center\">$").append(producto.getPrecio()).append("</p>")
                    .append("</div>");
        }
        
        return htmlcode.toString();
    }
    
    public Producto getProducto(int id) {
        return new ModeloProducto().getProductById(id);
    }

    public Producto getProducto(String nombre) {
        return new ModeloProducto().getProductByName(nombre);
    }
    
}
