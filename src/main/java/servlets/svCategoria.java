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
import logica.Controladora;

/**
 *
 * @author estiv
 */
@WebServlet(name = "svCategoria", urlPatterns = {"/svCategoria"})
public class svCategoria extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Categoria> listaCategorias = control.traerCategorias();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaCategorias", listaCategorias);
        response.sendRedirect("listarCategorias.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        Categoria categoria = new Categoria();
        categoria.setNombre(nombre);
        control.crearCategoria(categoria);
        response.sendRedirect("svCategoria");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
