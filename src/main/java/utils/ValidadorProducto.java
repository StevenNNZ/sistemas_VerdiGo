package utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class ValidadorProducto {

    private List<String> errors;

    public ValidadorProducto() {
        this.errors = new ArrayList<>();
    }

    public boolean validarTitulo(String titulo) {
        if (titulo == null || !Pattern.matches("[A-Za-z0-9\\s]{1,100}", titulo)) {
            errors.add("Título inválido: solo letras, números y espacios, 1-100 caracteres.");
            return false;
        }
        return true;
    }

    public boolean validarAutor(String autor) {
        if (autor == null || !Pattern.matches("[A-Za-z\\s]{1,100}", autor)) {
            errors.add("Autor inválido: solo letras y espacios, 1-100 caracteres.");
            return false;
        }
        return true;
    }

    public boolean validarAnio(String anio) {
        if (anio == null || !Pattern.matches("\\d{4}", anio)) {
            errors.add("Año inválido: debe ser un número de 4 dígitos.");
            return false;
        }
        return true;
    }

    public boolean validarISBN(String ISBN) {
        if (ISBN == null || !Pattern.matches("\\d{10}|\\d{13}", ISBN)) {
            errors.add("ISBN inválido: debe tener 10 o 13 dígitos numéricos.");
            return false;
        }
        return true;
    }

    public boolean validarGenero(String genero) {
        if (genero == null || !Pattern.matches("[A-Za-z\\s]{1,100}", genero)) {
            errors.add("Género inválido: solo letras y espacios, 1-100 caracteres.");
            return false;
        }
        return true;
    }

    public boolean validarDisponible(String disponible) {
        if (disponible == null || (!"true".equalsIgnoreCase(disponible) && !"false".equalsIgnoreCase(disponible))) {
            errors.add("Disponibilidad inválida: debe ser 'true' o 'false'.");
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

    public static void validarNombre(String nombre) {
        if (nombre == null || nombre.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre no puede estar vacío.");
        }
        if (nombre.length() < 3) {
            throw new IllegalArgumentException("El nombre debe tener al menos 3 caracteres.");
        }
    }

    public static void validarDescripcion(String descripcion) {
        if (descripcion == null || descripcion.trim().isEmpty()) {
            throw new IllegalArgumentException("La descripción no puede estar vacía.");
        }
        if (descripcion.length() < 10) {
            throw new IllegalArgumentException("La descripción debe tener al menos 10 caracteres.");
        }
    }

    public static void validarPrecio(String precioStr) {
        if (precioStr == null || precioStr.trim().isEmpty()) {
            throw new IllegalArgumentException("El precio no puede estar vacío.");
        }
        try {
            double precio = Double.parseDouble(precioStr);
            if (precio < 0) {
                throw new IllegalArgumentException("El precio no puede ser negativo.");
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("El precio debe ser un número válido.");
        }
    }

    public static void validarStock(String stockStr) {
        if (stockStr == null || stockStr.trim().isEmpty()) {
            throw new IllegalArgumentException("El stock no puede estar vacío.");
        }
        try {
            int stock = Integer.parseInt(stockStr);
            if (stock < 0) {
                throw new IllegalArgumentException("El stock no puede ser negativo.");
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("El stock debe ser un número entero válido.");
        }
    }

    public static void validarCertificacion(String certificacion) {
        if (certificacion == null || certificacion.trim().isEmpty()) {
            throw new IllegalArgumentException("La certificación no puede estar vacía.");
        }
        if (certificacion.length() < 3) {
            throw new IllegalArgumentException("La certificación debe tener al menos 3 caracteres.");
        }
    }

    public static void validarImpactoAmbiental(String impactoAmbiental) {
        if (impactoAmbiental == null || impactoAmbiental.trim().isEmpty()) {
            throw new IllegalArgumentException("El impacto ambiental no puede estar vacío.");
        }
        try {
            double porcentaje = Double.parseDouble(impactoAmbiental);
            if (porcentaje < 0 || porcentaje > 100) {
                throw new IllegalArgumentException("El impacto ambiental debe estar entre 0 y 100.");
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("El impacto ambiental debe ser un número válido.");
        }
    }

    public void validarIdCategoria(String idCategoria) {
        if (idCategoria == null || idCategoria.trim().isEmpty()) {
            errors.add("Debe seleccionar una categoría.");
            return;
        }
        try {
            int id = Integer.parseInt(idCategoria);
            if (id <= 0) {
                errors.add("Seleccione una categoría válida.");
            }
        } catch (NumberFormatException e) {
            errors.add("ID de categoría inválido.");
        }
    }

    public void validarIdCertificacion(String idCertificacion) {
        if (idCertificacion == null || idCertificacion.trim().isEmpty()) {
            errors.add("Debe seleccionar una certificación.");
            return;
        }
        try {
            int id = Integer.parseInt(idCertificacion);
            if (id <= 0) {
                errors.add("Seleccione una certificación válida.");
            }
        } catch (NumberFormatException e) {
            errors.add("ID de certificación inválido.");
        }
    }
}
