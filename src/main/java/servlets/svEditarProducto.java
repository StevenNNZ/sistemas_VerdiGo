package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Categoria;
import logica.Certificacion;
import logica.Controladora;
import logica.Producto;
import utils.ResponseUtil;
import utils.ValidadorProducto;

@WebServlet(name = "svEditarProducto", urlPatterns = {"/svEditarProducto"})
public class svEditarProducto extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        //Cargamos las categorias y certificaciones de bd
        List<Categoria> listaCategorias = control.traerCategorias();
        List<Certificacion> listaCertificaciones = control.traerCertificaciones();
        String destino = request.getParameter("redirect"); 

        HttpSession session = request.getSession();
        session.setAttribute("listaCategorias", listaCategorias);
        session.setAttribute("listaCertificaciones", listaCertificaciones);
        
        // Ahora traerProducto devuelve lista, por eso recibimos una lista:
        List<Producto> productos = control.traerProducto(id);

        if (productos != null && !productos.isEmpty()) {
            // Usamos el primer producto de la lista (debería ser solo uno con ese id)
            Producto producto = productos.get(0);

            HttpSession miSession = request.getSession();
            miSession.setAttribute("productoEditar", producto);
            response.sendRedirect("editarProducto.jsp");
        } else {
            ResponseUtil.sendAlert(
                    response,
                    "Producto no encontrado",
                    "No se encontró un producto con ID " + id,
                    "error",
                    "svProducto"
            );
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String precio = request.getParameter("precio");
        String stock = request.getParameter("stock");
        String impactoAmbiental = request.getParameter("impactoAmbiental");
        String idCategoria = request.getParameter("idCategoria");
        String idCertificacion = request.getParameter("idCertificacion");

// Validación
        ValidadorProducto validador = new ValidadorProducto();
        validador.validarNombre(nombre);
        validador.validarDescripcion(descripcion);
        validador.validarPrecio(precio);
        validador.validarStock(stock);
        validador.validarImpactoAmbiental(impactoAmbiental);
        validador.validarIdCategoria(idCategoria);
        validador.validarIdCertificacion(idCertificacion);

        if (!validador.isValid()) {
            ResponseUtil.sendAlert(
                    response,
                    "Error en los datos",
                    String.join("\\n", validador.getErrors()),
                    "error",
                    "editarProducto.jsp"
            );
            return;
        }

        Producto producto = (Producto) request.getSession().getAttribute("productoEditar");
        if (producto == null) {
            ResponseUtil.sendAlert(
                    response,
                    "Error",
                    "No se encontró el producto en sesión para editar.",
                    "error",
                    "svProducto"
            );
            return;
        }

// Obtener objetos asociados
        int idCat = Integer.parseInt(idCategoria);
        int idCert = Integer.parseInt(idCertificacion);

        Categoria categoria = control.traerCategoria(idCat);
        Certificacion certificacion = control.traerCertificacion(idCert);

// Actualizar producto
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setPrecio(Double.parseDouble(precio));
        producto.setStock(Integer.parseInt(stock));
        producto.setImpactoAmbiental(impactoAmbiental);
        producto.setCategoria(categoria);
        producto.setCertificacion(certificacion);

        try {
            control.editarProducto(producto);
            request.getSession().removeAttribute("productoEditar");
            ResponseUtil.sendAlert(
                    response,
                    "Producto actualizado",
                    "El producto se actualizó correctamente",
                    "success",
                    "svProducto"
            );
        } catch (Exception e) {
            ResponseUtil.sendAlert(
                    response,
                    "Error al actualizar",
                    e.getMessage(),
                    "error",
                    "editarProducto.jsp"
            );
        }
    }
}
