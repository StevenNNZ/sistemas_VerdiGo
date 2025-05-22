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
import logica.Controladora;
import logica.Usuario;
import utils.ResponseUtil;
import utils.ValidadorUsuario;

@WebServlet(name = "svEditarUsuario", urlPatterns = {"/svEditarUsuario"})
public class svEditarUsuario extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Usuario usuario = control.traerUsuario(Integer.parseInt(id));
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("usuarioEditar", usuario);
        
        response.sendRedirect("editarUsuario.jsp");
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Captura los parámetros enviados desde el formulario
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String password = request.getParameter("password");        
        String rol = request.getParameter("rol");

        
        ValidadorUsuario validator = new ValidadorUsuario();
        validator.validarNombre(nombres);
        validator.validarApellido(apellidos);
        validator.validarEmail(email);        
        validator.validarRol(rol);
        
        if(password != null){
            validator.validarPassword(password);
        }
        
        if (!validator.isValid()) {
            List<String> errors = validator.getErrors();
            StringBuilder errorMessageBuilder = new StringBuilder();
            for (String error : errors) {
                errorMessageBuilder.append(error).append("\\n");
            }
            
            ResponseUtil.sendAlert(
                    response, 
                    "¡No pudimos actualizar tus datos!", 
                    errorMessageBuilder.toString(), 
                    "error", 
                    "svUsuarios"
            );
            return;
        }
        
        Usuario usu = (Usuario) request.getSession().getAttribute("usuarioEditar");
        usu.setNombres(nombres);
        usu.setApellidos(apellidos);
        usu.setCorreo(email);
        usu.setRol(rol);

        if(password != null){
            usu.setContrasenia(password);
        }
        
         try {
            // Intenta crear al usuario y maneja posibles excepciones
            control.editarUsuario(usu);
            ResponseUtil.sendAlert(
                response, 
                "Usuario actualizado correctamente", 
                "", 
                "success", 
                "svUsuarios"
            );
        } catch (Exception e) {
            // Manejo de la Excepción
            ResponseUtil.sendAlert(
                response, 
                "Error", 
                e.getMessage(), 
                "error", 
                "svUsuarios"
            );
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
