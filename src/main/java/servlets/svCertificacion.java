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
import logica.Certificacion;
import logica.Controladora;

/**
 *
 * @author estiv
 */
@WebServlet(name = "svCertificacion", urlPatterns = {"/svCertificacion"})
public class svCertificacion extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Certificacion> lista = control.traerCertificaciones();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaCertificaciones", lista);
        response.sendRedirect("listarCertificaciones.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        Certificacion cert = new Certificacion();
        cert.setNombre(nombre);
        control.crearCertificacion(cert);
        response.sendRedirect("svCertificacion");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
