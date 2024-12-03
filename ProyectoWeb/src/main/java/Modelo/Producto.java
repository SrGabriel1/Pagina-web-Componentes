
package Modelo;

public class Producto {
  
    private int idProducto;
    private String nombre;
    private String descripcion;
    private float precio;
    private int stock;
    private String categoria;
    private String imagen;

    // Constructor
    public Producto(int idProducto, String nombre, String descripcion, float precio, int stock, String categoria, String imagen) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.categoria = categoria;
        this.imagen = imagen;
    }

    public Producto(String imagen, String descripcion, float precio) {
        this.descripcion = descripcion;
        this.precio = precio;
        this.imagen = imagen;
    }

   

    
    
    // Getters y Setters
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
