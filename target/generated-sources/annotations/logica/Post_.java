package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Comentario;
import logica.Usuario;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-05-22T09:55:35")
@StaticMetamodel(Post.class)
public class Post_ { 

    public static volatile SingularAttribute<Post, Date> fecha;
    public static volatile SingularAttribute<Post, String> contenido;
    public static volatile SingularAttribute<Post, String> titulo;
    public static volatile SingularAttribute<Post, String> imagenDestacada;
    public static volatile SingularAttribute<Post, Integer> id;
    public static volatile ListAttribute<Post, Comentario> comentarios;
    public static volatile SingularAttribute<Post, Usuario> autor;

}