package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceException;
import logica.*;

import logica.Usuario;
import org.eclipse.persistence.exceptions.DatabaseException;



public class ControladoraPersistencia {
    
    UsuarioJpaController usuJPA  = new UsuarioJpaController();
    PedidoJpaController pedidoJPA = new PedidoJpaController();
    ProductoJpaController producJPA = new ProductoJpaController();
    PostJpaController postJPA = new PostJpaController();
    ComentarioJpaController comentarioJPA = new ComentarioJpaController();

    public void crearUsuario(Usuario usu) throws Exception {
        try {
            usuJPA.create(usu);
        } catch (EntityExistsException e) {
            throw new Exception("El correo ya está registrado.", e);
        } catch (PersistenceException e) {
            Throwable cause = e.getCause();
            if (cause instanceof DatabaseException) {
                Throwable internalException = ((DatabaseException)cause).getInternalException();
                if (internalException instanceof java.sql.SQLIntegrityConstraintViolationException) {
                    throw new Exception("El correo ya está registrado.", internalException);
                }
            }
            throw new Exception("Error en la base de datos. Intenta de nuevo más tarde.", e);
        }
    }
    
    public void editarUsuario(Usuario usu) {
        try {
            usuJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Usuario> getUsuarios() {
        return usuJPA.findUsuarioEntities();
    }

    public void eliminarUsuario(String id) {
            try {
                usuJPA.destroy(Integer.parseInt(id));
            } catch (persistencia.exceptions.NonexistentEntityException ex) {
                Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
   

    public Usuario traerUsuario(int id) {
        return usuJPA.findUsuario(id);
    }

    public Usuario traerUsuario(String email) {
        EntityManager em = usuJPA.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT u FROM Usuario u WHERE u.correo = :email", 
                    Usuario.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
            System.out.println("No se encontró ningún usuario con el correo proporcionado: " + email);
            return null;  
        } finally {
            em.close();  
        }
    }

    public void crearProducto(Producto producto) {
        producJPA.create(producto);
    }

    public List<Producto> traerproducto() {
        return producJPA.findProductoEntities();
    }

    public Producto traerProductos (String id_producto) {
        return producJPA.findProducto(Integer.parseInt(id_producto));
    }

    public void editarProducto(Producto Producto) {
        try {
            producJPA.edit(Producto);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   public void eliminarProducto(String id) {
        try {
            producJPA.destroy(Integer.parseInt(id));
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearPedido(Pedido pedido) {
        pedidoJPA.create(pedido);
    }

    public List<Pedido> traerPedido() {
        return pedidoJPA.findPedidoEntities();
    }

    public Pedido traerPedidos(String id_pedido) {
        return pedidoJPA.findPedido(Integer.parseInt(id_pedido));
    }

    public void editarPedido(Pedido pedido) {
        try {
            pedidoJPA.edit(pedido);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Pedido> traerPedidoPorEmail(String email) {
        EntityManager em = pedidoJPA.getEntityManager();
        try {
            return em.createQuery("SELECT p FROM Prestamo p WHERE p.usuario.correo = :email", 
                    Pedido.class)
                     .setParameter("email", email)
                     .getResultList();
        } finally {
            em.close();
        }
    }
    
    
    //Métodos para Post:
    public void crearPost(Post post) {
        postJPA.create(post);
    }

    public void editarPost(Post post) {
        try {
            postJPA.edit(post);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarPost(int id) {
        try {
            postJPA.destroy(id);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Post> traerPosts() {
        return postJPA.findPostEntities();
    }

    public Post traerPost(int id) {
        return postJPA.findPost(id);
    }

    //Métodos para Comentario:
    public void crearComentario(Comentario comentario) {
        comentarioJPA.create(comentario);
    }

    public void eliminarComentario(int id) {
        try {
            comentarioJPA.destroy(id);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editarComentario(Comentario comentario) {
        try {
            comentarioJPA.edit(comentario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Comentario> traerComentarios() {
        return comentarioJPA.findComentarioEntities();
    }

    public Comentario traerComentario(int id) {
        return comentarioJPA.findComentario(id);
    }
}