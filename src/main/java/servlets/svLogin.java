package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Usuario;
import utils.ResponseUtil;


@WebServlet(name = "svLogin", urlPatterns = {"/svLogin"})
public class svLogin extends HttpServlet {

     Controladora control = new Controladora();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("usuario");
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        boolean validacion = false;
        validacion = control.comprobarAcceso(email,password);
        
        if(validacion){
            // Traer el usuario completo desde la base de datos
            Usuario usuarioEnt = control.traerUsuario(email);
            
            //Traer la sesón del usuario que está actualmente
            HttpSession misession = request.getSession(true);
            
            
            // Guardar datos en sesión
            misession.setAttribute("email", email);
            misession.setAttribute("rol", usuarioEnt.getRol());
            misession.setAttribute("nombres", usuarioEnt.getNombres());
            
            
            response.sendRedirect("svPerfil");
            
        }else{
            ResponseUtil.sendAlert(response, "¡Oops!", "Usuario o contraseña incorrectos.", "error", "login.jsp");
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}