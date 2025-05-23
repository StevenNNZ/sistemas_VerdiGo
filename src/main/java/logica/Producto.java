package logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author estiv
 */
@Entity
public class Producto implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_producto;
    private String nombre;
    private String descripcion;
    private double precio;
    private int stock;
    private String impactoAmbiental;

    @ManyToOne
    private Categoria categoria;

    @ManyToOne
    private Certificacion certificacion;

    public Producto() {
    }

    public Producto(int id_producto, String nombre, String descripcion, double precio, int stock, String impactoAmbiental, Categoria categoria, Certificacion certificacion) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.impactoAmbiental = impactoAmbiental;
        this.categoria = categoria;
        this.certificacion = certificacion;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Certificacion getCertificacion() {
        return certificacion;
    }

    public void setCertificacion(Certificacion certificacion) {
        this.certificacion = certificacion;
    }

    public String getImpactoAmbiental() {
        return impactoAmbiental;
    }

    public void setImpactoAmbiental(String impactoAmbiental) {
        this.impactoAmbiental = impactoAmbiental;
    }

}
