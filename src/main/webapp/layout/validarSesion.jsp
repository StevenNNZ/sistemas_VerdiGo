<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession misession = request.getSession(false); // No crea sesión nueva si no existe
    if (misession == null || misession.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return; // Detiene el resto de la ejecución
    }
%>
