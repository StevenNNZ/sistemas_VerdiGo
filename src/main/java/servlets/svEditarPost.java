package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Post;

/**
 *
 * @author estiv
 */
@WebServlet(name = "svEditarPost", urlPatterns = {"/svEditarPost"})
public class svEditarPost extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Post post = control.buscarPost(Integer.parseInt(id));
        HttpSession sesion = request.getSession();
        sesion.setAttribute("postEditar", post);
        response.sendRedirect("editarPost.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");

        Post post = (Post) request.getSession().getAttribute("postEditar");

        post.setTitulo(titulo);
        post.setContenido(contenido);
        post.setFecha(new Date());

        try {
            control.editarPost(post);
            response.sendRedirect("svPost");
        } catch (Exception e) {
            response.sendRedirect("editarPost.jsp?error=1");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
