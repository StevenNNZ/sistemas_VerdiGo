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

@WebServlet(name = "svProducto", urlPatterns = {"/svProducto"})
public class svProducto extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Manejo de dos escenarios:
        // 1. Listar todos los productos
        // 2. Obtener un producto específico por ID

        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            // Caso: Obtener un producto específico
            try {
                Producto producto = control.traerProductos(idParam);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("productoDetalle", producto);
                response.sendRedirect("detalleProducto.jsp");
            } catch (Exception e) {
                ResponseUtil.sendAlert(
                        response,
                        "Error",
                        "Producto no encontrado",
                        "error",
                        "listadoProductos.jsp"
                );
            }
        } else {
            // Caso: Listar todos los productos
            List<Producto> listaProductos = control.traerProducto(0); // Usamos 0 como valor por defecto
            HttpSession sesion = request.getSession();
            sesion.setAttribute("listaProductos", listaProductos);

            String destino = request.getParameter("redirect");
            if (destino != null && !destino.isEmpty()) {
                response.sendRedirect(destino);
            } else {
                response.sendRedirect("listadoProductos.jsp");
            }
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

// Validar
        ValidadorProducto validador = new ValidadorProducto();
        validador.validarNombre(nombre);
        validador.validarDescripcion(descripcion);
        validador.validarPrecio(precio);
        validador.validarStock(stock);
        validador.validarImpactoAmbiental(impactoAmbiental);
        validador.validarIdCategoria(idCategoria);        
        validador.validarIdCertificacion(idCertificacion);

        // Si hay errores
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

        // Buscar categoría y certificación
        int idCat = Integer.parseInt(idCategoria);
        int idCert = Integer.parseInt(idCertificacion);

        Categoria categoria = control.traerCategoria(idCat);
        Certificacion certificacion = control.traerCertificacion(idCert);

        if (categoria == null || certificacion == null) {
            ResponseUtil.sendAlert(
                    response,
                    "Error de relaciones",
                    "No se pudo encontrar la categoría o la certificación seleccionada.",
                    "error",
                    "crearProducto.jsp"
            );
            return;
        }

        try {
            Producto producto = new Producto();
            producto.setNombre(nombre);
            producto.setDescripcion(descripcion);
            producto.setPrecio(Double.parseDouble(precio));
            producto.setStock(Integer.parseInt(stock));
            producto.setImpactoAmbiental(impactoAmbiental);
            producto.setCategoria(categoria);
            producto.setCertificacion(certificacion);

            control.crearProducto(producto);

            ResponseUtil.sendAlert(
                    response,
                    "Producto creado",
                    "El producto se registró correctamente",
                    "success",
                    "crearProducto.jsp"
            );
        } catch (Exception e) {
            ResponseUtil.sendAlert(
                    response,
                    "Error al guardar producto",
                    e.getMessage(),
                    "error",
                    "crearProducto.jsp"
            );
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gestión de productos";
    }
}
