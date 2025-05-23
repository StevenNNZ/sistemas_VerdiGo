
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "svEditarCategoria", urlPatterns = {"/svEditarCategoria"})
public class svEditarCategoria extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Categoria categoria = control.traerCategoria(id);

        if (categoria != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("categoriaEditar", categoria);
            response.sendRedirect("editarCategoria.jsp");
        } else {
            // redirige con error, o muestra mensaje
            response.sendRedirect("svCategoria?error=CategoriaNoEncontrada");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String nombre = request.getParameter("nombre");
        Categoria categoria = (Categoria) request.getSession().getAttribute("categoriaEditar");

        categoria.setNombre(nombre);
        control.editarCategoria(categoria);
        request.getSession().removeAttribute("categoriaEditar");

        response.sendRedirect("svCategoria");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
