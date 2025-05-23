package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author estiv
 */
@WebServlet(name = "svCargarFormularioProducto", urlPatterns = {"/svCargarFormularioProducto"})
public class svCargarFormularioProducto extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Categoria> listaCategorias = control.traerCategorias();
        List<Certificacion> listaCertificaciones = control.traerCertificaciones();
        String destino = request.getParameter("redirect"); 

        HttpSession session = request.getSession();
        session.setAttribute("listaCategorias", listaCategorias);
        session.setAttribute("listaCertificaciones", listaCertificaciones);
        
        if (destino != null && !destino.isEmpty()) {
            response.sendRedirect(destino);
        } else {
            response.sendRedirect("crearProducto.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
