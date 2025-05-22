package servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import persistencia.exceptions.NonexistentEntityException;

@WebServlet(name = "svEliminarProducto", urlPatterns = {"/svEliminarProducto"})
public class svEliminarProducto extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idProductoStr = request.getParameter("idProducto");

        if (idProductoStr == null || idProductoStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto no proporcionado.");
            return;
        }

        try {
            int idProducto = Integer.parseInt(idProductoStr);
            try {
                control.eliminarProducto(idProductoStr); // Usas String porque tu método así lo espera
                // Puedes enviar un mensaje de éxito o redirigir a la lista
                response.sendRedirect("svProducto");
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(svEliminarProducto.class.getName()).log(Level.SEVERE, null, ex);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Producto no encontrado para eliminar.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto inválido.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para eliminar un producto";
    }
}
