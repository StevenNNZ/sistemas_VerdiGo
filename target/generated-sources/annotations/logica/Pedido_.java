package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Producto;
import logica.Usuario;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-05-22T14:33:40")
@StaticMetamodel(Pedido.class)
public class Pedido_ { 

    public static volatile SingularAttribute<Pedido, Date> fecha_pedido;
    public static volatile SingularAttribute<Pedido, String> estado;
    public static volatile SingularAttribute<Pedido, Usuario> usuario;
    public static volatile SingularAttribute<Pedido, Producto> producto;
    public static volatile SingularAttribute<Pedido, Integer> id_pedido;
    public static volatile SingularAttribute<Pedido, Boolean> activo;

}