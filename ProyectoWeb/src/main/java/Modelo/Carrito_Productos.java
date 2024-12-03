/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author abelc
 */
public class Carrito_Productos {

    int idCarritoProductos;
    int id_carrito;
    private Producto producto;
    int cantidad;
    float total;
    public Carrito_Productos() {
    }

    public Carrito_Productos(int idCarritoProductos, int id_carrito, Producto producto, int cantidad, float total) {
        this.idCarritoProductos = idCarritoProductos;
        this.id_carrito = id_carrito;
        this.producto = producto;
        this.cantidad = cantidad;
        this.total = total;
    }

    public Carrito_Productos(int idCarritoProductos, int id_carrito, Producto producto, int cantidad) {
        this.idCarritoProductos = idCarritoProductos;
        this.id_carrito = id_carrito;
        this.producto = producto;
        this.cantidad = cantidad;
    }


    public int getIdCarritoProductos() {
        return idCarritoProductos;
    }

    public void setIdCarritoProductos(int idCarritoProductos) {
        this.idCarritoProductos = idCarritoProductos;
    }

    public int getId_carrito() {
        return id_carrito;
    }

    public void setId_carrito(int id_carrito) {
        this.id_carrito = id_carrito;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    
    
}
