package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Certificacion;
import logica.Controladora;

/**
 *
 * @author estiv
 */
@WebServlet(name = "svEditarCertificacion", urlPatterns = {"/svEditarCertificacion"})
public class svEditarCertificacion extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Certificacion cert = control.traerCertificacion(id);
        if (cert != null) {
            request.getSession().setAttribute("certEditar", cert);
            response.sendRedirect("editarCertificacion.jsp");
        } else {
            response.sendRedirect("svCertificacion");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        Certificacion cert = (Certificacion) request.getSession().getAttribute("certEditar");
        cert.setNombre(nombre);
        control.editarCertificacion(cert);
        request.getSession().removeAttribute("certEditar");
        response.sendRedirect("svCertificacion");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
