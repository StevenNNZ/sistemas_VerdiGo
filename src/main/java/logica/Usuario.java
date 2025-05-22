package logica;

import org.mindrot.jbcrypt.BCrypt;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_usuario;
    private String nombres;    
    private String apellidos;    
    
    @Column(nullable = false, unique = true)
    private String correo;
    private String contrasenia;
    private String rol;
    
    public Usuario(){
        
    }

    public Usuario(int id_usuario, String nombres, String apellidos, String correo, String contrasenia, String rol) {
        this.id_usuario = id_usuario;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.contrasenia = contrasenia;
        this.rol = rol;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasenia() {
        return contrasenia;
    }

  
    public void setContrasenia(String contrasenia) {
        this.contrasenia = BCrypt.hashpw(contrasenia, BCrypt.gensalt());
    }

    public boolean verificarContrasenia(String contrasenia) {
        return BCrypt.checkpw(contrasenia, this.contrasenia);
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
}
