/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import logica.*;

/**
 *
 * @author estiv
 */
@WebServlet(name = "svComentario", urlPatterns = {"/svComentario"})
public class svComentario extends HttpServlet {
    
    Controladora control = new Controladora();

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String contenido = request.getParameter("comentario");
        int idPost = Integer.parseInt(request.getParameter("postId"));

        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        Post post = control.buscarPost(idPost);

        Comentario comentario = new Comentario();
        comentario.setAutor(usuario);
        comentario.setPost(post);
        comentario.setContenido(contenido);
        comentario.setFecha(new Date());

        control.crearComentario(comentario);

        response.sendRedirect("svPost");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
