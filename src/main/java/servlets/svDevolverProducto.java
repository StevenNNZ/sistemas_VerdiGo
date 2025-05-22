package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Producto;
import logica.Pedido;
import utils.ResponseUtil;

@WebServlet(name = "svDevolverProducto", urlPatterns = {"/svDevolverProducto"})
public class svDevolverProducto extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtenemos los parámetros del producto y el pedido
        String idPedidoStr = request.getParameter("idPedido");
        String idProductoStr = request.getParameter("idProducto");

        if (idPedidoStr != null && idProductoStr != null) {
            try {
                int idPedido = Integer.parseInt(idPedidoStr);
                int idProducto = Integer.parseInt(idProductoStr);

                Pedido pedido = (Pedido) control.traerPedido(idPedido);
                Producto producto = (Producto) control.traerProducto(idProducto);

                if (producto != null && pedido != null) {
                    // Actualizamos el producto (por ejemplo, aumentamos el stock)
                    producto.setStock(producto.getStock() + 1);

                    // Si quieres también podrías actualizar más datos aquí si aplica.

                    // Marcamos el pedido como inactivo o "devuelto"
                    pedido.setActivo(false);

                    // Guardamos cambios en la base de datos
                    control.editarProducto(producto);
                    control.editarPedido(pedido);

                    ResponseUtil.sendAlert(
                        response, 
                        "Producto devuelto correctamente", 
                        "", 
                        "success", 
                        "svListarPedidos" // Puedes cambiarlo al servlet de tu flujo
                    );
                } else {
                    ResponseUtil.sendAlert(
                        response, 
                        "Producto o pedido no encontrado", 
                        "", 
                        "error", 
                        ""
                    );
                }
            } catch (NumberFormatException e) {
                ResponseUtil.sendAlert(
                    response, 
                    "ID inválido", 
                    "", 
                    "error", 
                    ""
                );
            }
        } else {
            ResponseUtil.sendAlert(
                response, 
                "Datos incompletos", 
                "", 
                "error", 
                ""
            );
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para devolver un producto";
    }
}
