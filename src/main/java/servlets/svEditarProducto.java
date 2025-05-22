package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        String certificacion = request.getParameter("certificacion");
        String impactoAmbiental = request.getParameter("impactoAmbiental");

        // Validación de datos
        ValidadorProducto validador = new ValidadorProducto();
        validador.validarNombre(nombre);
        validador.validarDescripcion(descripcion);
        validador.validarPrecio(precio);
        validador.validarStock(stock);
        validador.validarCertificacion(certificacion);
        validador.validarImpactoAmbiental(impactoAmbiental);

        if (!validador.isValid()) {
            ResponseUtil.sendAlert(
                response, 
                "Error en los datos", 
                String.join("\\n", validador.getErrors()), 
                "error", 
                "crearProducto.jsp"
            );
            return;
        }

        // Recuperamos el producto desde sesión
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

        // Actualizamos datos del producto
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setPrecio(Double.parseDouble(precio));
        producto.setStock(Integer.parseInt(stock));
        producto.setCertificacion(certificacion);
        producto.setImpactoAmbiental(impactoAmbiental);

        try {
            control.editarProducto(producto);
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
                "svProducto"
            );
        }
    }
}
