package utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class ValidadorUsuario {
    
    private List<String> errors;

    public ValidadorUsuario() {
        this.errors = new ArrayList<>();
    }

    public boolean validarNombre(String nombre) {
        if (nombre == null || !Pattern.matches("[A-Za-z\\s]{2,50}", nombre)) {
            errors.add("Nombre inválido: solo letras y espacios, 2-50 caracteres.");
            return false;
        }
        return true;
    }

    public boolean validarApellido(String apellido) {
        if (apellido == null || !Pattern.matches("[A-Za-z\\s]{2,50}", apellido)) {
            errors.add("Apellido inválido: solo letras y espacios, 2-50 caracteres.");
            return false;
        }
        return true;
    }

    public boolean validarEmail(String email) {
        if (email == null || !Pattern.matches("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,6}$", email)) {
            errors.add("Correo electrónico inválido.");
            return false;
        }
        return true;
    }
    
    public boolean validarRol(String rol) {
        if (rol == null || rol.isBlank()) {
            errors.add("El rol no puede ser nulo.");
            return false;
        }

        // Convertiendo el rol a minúsculas para la validación
        String rolLowerCase = rol.toLowerCase();

        // Validar si el rol es "administrador" o "usuario"
        if (!"administrador".equals(rolLowerCase) && !"usuario".equals(rolLowerCase)) {
            errors.add("El rol debe ser 'administrador' o 'usuario'.");
            return false;
        }

        return true;
    }

    public boolean validarPassword(String password) {
        if (password == null || !Pattern.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,20}$", password)) {
            errors.add("Contraseña inválida: debe tener entre 8 y 20 caracteres, incluir una mayúscula, una minúscula y un dígito.");
            return false;
        }
        return true;
    }
    
    public boolean isValid() {
        return errors.isEmpty();
    }

    public List<String> getErrors() {
        return errors;
    }
}