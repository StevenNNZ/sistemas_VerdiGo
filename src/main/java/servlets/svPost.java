package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Post;
import logica.Usuario;

/**
 *
 * @author estiv
 */
@WebServlet(name = "svPost", urlPatterns = {"/svPost"})
public class svPost extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Post> listaPosts = control.obtenerTodosLosPosts();

        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaPosts", listaPosts);

        String destino = request.getParameter("redirect");

        if (destino != null && !destino.isEmpty()) {
            response.sendRedirect(destino);
        } else {
            response.sendRedirect("verPosts.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        Post post = new Post();
        post.setTitulo(titulo);
        post.setContenido(contenido);
        post.setFecha(new Date());
        post.setAutor(usuario);

        control.crearPost(post);

        response.sendRedirect("svPost");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
