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
import logica.Comentario;
import logica.Controladora;

/**
 *
 * @author estiv
 */
@WebServlet(name = "svEditarComentario", urlPatterns = {"/svEditarComentario"})
public class svEditarComentario extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Comentario comentario = control.buscarComentario(id);

        HttpSession sesion = request.getSession();
        sesion.setAttribute("comentarioEditar", comentario);

        response.sendRedirect("editarComentario.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String contenido = request.getParameter("contenido");
        Comentario comentario = (Comentario) request.getSession().getAttribute("comentarioEditar");

        comentario.setContenido(contenido);
        comentario.setFecha(new Date());

        control.editarComentario(comentario);

        response.sendRedirect("svPost");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
