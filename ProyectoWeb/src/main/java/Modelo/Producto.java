
package Modelo;

public class Producto {
    
    private String imagen;
    private String descripcion;
    private double precioUnitario;


    public Producto(String imagen, String descripcion, double precioUnitario) {
        this.imagen = imagen;
        this.descripcion = descripcion;
        this.precioUnitario = precioUnitario;
    }

    public String getImagen() {
        return imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public double getPrecioTotal() {
        return precioUnitario;
    }
}
