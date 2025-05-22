package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author estiv
 */

@Entity
public class Pedido implements Serializable {
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_pedido;
    private Date fecha_pedido;
    private String estado;
    private boolean activo;
    
    @OneToOne
    private Usuario usuario;
    
    @OneToOne
    private Producto producto;
    
    public Pedido() {
    }
    
        public Pedido(int id_pedido, Date fecha_pedido, String estado, boolean activo, Usuario usuario, Producto producto) {
        this.id_pedido = id_pedido;
        this.fecha_pedido = fecha_pedido;
        this.estado = estado;
        this.activo = activo;
        this.usuario = usuario;
        this.producto = producto;
    }
    
    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public Date getFecha_pedido() {
        return fecha_pedido;
    }

    public void setFecha_pedido(Date fecha_pedido) {
        this.fecha_pedido = fecha_pedido;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }



    
}
   