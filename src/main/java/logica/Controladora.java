package logica;

import java.util.ArrayList;
import java.util.List;
import persistencia.ControladoraPersistencia;
import persistencia.exceptions.NonexistentEntityException;


public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearUsuario (Usuario usu) throws Exception {
        controlPersis.crearUsuario(usu);
    }

    public List<Usuario> traerUsuarios() {
        return controlPersis.getUsuarios();
    }
    
    public Usuario traerUsuario(int id) {
        return controlPersis.traerUsuario(id);
    }
    
    public Usuario traerUsuario(String email) {
        return controlPersis.traerUsuario(email);
    }
    
    public void editarUsuario(Usuario usu){
        controlPersis.editarUsuario(usu);
    }
    
     public void eliminarUsuario(String id ) throws NonexistentEntityException{
        controlPersis.eliminarUsuario(id);
    }
    
    public boolean comprobarAcceso(String email, String contrasenia){
        List<Usuario> listaUsuario = new ArrayList<Usuario>();
        listaUsuario = controlPersis.getUsuarios();
        
        for(Usuario usu:listaUsuario){
            if(usu.getCorreo().equals(email)){
                if(usu.verificarContrasenia(contrasenia)){
                    return true;
                }
            }
        }
        
        return false;
    }

    public void crearProducto (Producto producto) {
        controlPersis.crearProducto(producto);
    }

    public List<Producto> traerProducto(int id) {
        return controlPersis.traerproducto();
    }

    public Producto traerProductos(String id) {
        return controlPersis.traerProductos(id);
    }

    public void editarProducto(Producto producto) {
        controlPersis.editarProducto(producto);
    }

    public void eliminarProducto(String id) throws NonexistentEntityException {
        controlPersis.eliminarProducto(id);
                
    }

    public void crearPedido(Pedido pedido) {
        controlPersis.crearPedido(pedido);
    }

    public List<Pedido> traerPedido(int idPedido) {
        return controlPersis.traerPedido();
    }

    public Pedido traerPedidos (String id) {
        return controlPersis.traerPedidos(id);
    }

    public void editarPedido(Pedido pedido) {
        controlPersis.editarPedido(pedido);
    }

    public List<Pedido> traerPedidoPorEmail(String email) {
        return controlPersis.traerPedidoPorEmail(email);
    }   
}
