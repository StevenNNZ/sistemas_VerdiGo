
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Usuario;
import utils.ResponseUtil;
import utils.ValidadorUsuario;



 @WebServlet(name = "svRegistro", urlPatterns = {"/svRegistro"})
public class svRegistro extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// Captura los parámetros enviados desde el formulario

        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        ValidadorUsuario validator = new ValidadorUsuario();
        validator.validarNombre(nombres);
        validator.validarApellido(apellidos);
        validator.validarEmail(email);
        validator.validarPassword(password);

        if (!validator.isValid()) {
            List<String> errors = validator.getErrors();
            StringBuilder errorMessageBuilder = new StringBuilder();
            for (String error : errors) {
                errorMessageBuilder.append(error).append("\\n");
            }

            ResponseUtil.sendAlert(
                    response,
                    "¡No pudimos crear tu registro!",
                    errorMessageBuilder.toString(),
                    "error",
                    "register.jsp"
            );
            return;
        }

        Usuario usu = new Usuario();
        usu.setNombres(nombres);
        usu.setApellidos(apellidos);
        usu.setCorreo(email);
        usu.setContrasenia(password);
        usu.setRol("usuario");

        try {
            // Intenta crear al usuario y maneja posibles excepciones
            control.crearUsuario(usu);
            ResponseUtil.sendAlert(
                    response,
                    "Usuario creado correctamente",
                    "Inicia sesión para solicitar libros disponibles.",
                    "success",
                    "login.jsp"
            );
        } catch (Exception e) {
            // Manejo de la Excepción
            ResponseUtil.sendAlert(
                    response,
                    "Error",
                    e.getMessage(),
                    "error",
                    "registro.jsp"
            );
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
