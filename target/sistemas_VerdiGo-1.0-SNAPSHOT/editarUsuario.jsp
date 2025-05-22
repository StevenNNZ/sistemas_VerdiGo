<%@ page import="logica.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<!-- Head -->
<%@ include file="./layout/head.jsp" %>

<body class="layout-boxed">

    <!-- BEGIN LOADER -->
    <%@ include file="./layout/loader.jsp" %>
    <!-- END LOADER -->

    <!-- Validación de sesión -->
    <%@ include file="./layout/validarSesion.jsp" %>
    <!-- Fin Validación de sesión -->

    <!-- BEGIN NAVBAR -->
    <%@ include file="./layout/navbar.jsp" %>
    <!-- END NAVBAR -->

    <!-- BEGIN MAIN CONTAINER -->
    <div class="main-container " id="container">
        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!-- BEGIN SIDEBAR -->
        <%@ include file="./layout/sidebar.jsp" %>
        <!-- END SIDEBAR -->

        <!-- BEGIN CONTENT AREA -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing layout-top-spacing">
                <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
                    <div class="widget-content widget-content-area br-8">
                        <div class="middle-content container-xxl p-0">

                            <!-- BEGIN BREADCRUMBS -->
                            <%@ include file="./layout/breadcrumbs.jsp" %>
                            <!-- END BREADCRUMBS -->

                            <% 
                                Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioEditar");
                                if (usuario != null) {
                            %>
                            <!-- CONTENT AREA -->
                            <form class="section general-info p-3" action="svEditarUsuario" method="POST">
                                <div class="info">
                                    <h6 class="fs-3 mb-3">Actualizar Información del Usuario</h6>
                                    <div class="form">
                                        <div class="row">
                                            <!-- Nombres -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="nombres">Nombres</label>
                                                    <input type="text" value="<%=usuario.getNombres() %>"
                                                        class="form-control mb-3" id="nombres" name="nombres"
                                                        placeholder="Nombres" required minlength="2" maxlength="50">
                                                </div>
                                            </div>

                                            <!-- Apellidos -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="apellidos">Apellidos</label>
                                                    <input type="text" value="<%=usuario.getApellidos() %>"
                                                        class="form-control mb-3" id="apellidos" name="apellidos"
                                                        placeholder="Apellidos" required minlength="2" maxlength="50">
                                                </div>
                                            </div>

                                            <!-- Correo Electrónico -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="email">Correo Electrónico</label>
                                                    <input type="email" value="<%=usuario.getCorreo() %>"
                                                        class="form-control mb-3" id="email" name="email"
                                                        placeholder="Correo Electrónico" required>
                                                </div>
                                            </div>

                                            <!-- Contraseña -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="contrasenia">Contraseña</label>
                                                    <input type="password" class="form-control mb-3" id="contrasenia"
                                                        name="contrasenia" placeholder="Contraseña"
                                                        minlength="8">
                                                </div>
                                            </div>

                                            <!-- Rol -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="rol">Rol</label>
                                                    <select class="form-select mb-3" id="rol" name="rol" required>
                                                        <option value="">Seleccione un rol</option>
                                                        <option value="administrador" <%= "administrador".equalsIgnoreCase(usuario.getRol()) ? "selected" : "" %>>Administrador</option>
                                                        <option value="usuario" <%= "usuario".equalsIgnoreCase(usuario.getRol()) ? "selected" : "" %>>Usuario</option>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                                    
                                            <input type="hidden" name="rol" value="<%= usuario.getRol() %>">

                                            <!-- Botón Guardar -->
                                            <div class="col-md-12 mt-1">
                                                <div class="form-group text-end">
                                                    <button type="submit" class="btn btn-secondary">Actualizar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <% 
                                } else { 
                            %>
                            <div class="alert alert-warning" role="alert">
                                Usuario no autenticado. Por favor, inicie sesión para ver su perfil.
                            </div>
                            <% 
                                } 
                            %>
                        </div>
                    </div>
                </div>
                <div class="footer-wrapper">
                    <div class="footer-section f-section-1">
                        <p class="">Copyright © <span class="dynamic-year">2025</span> <a target="_blank"
                                href="https://designreset.com/cork-admin/">DesignReset</a>, All rights reserved.</p>
                    </div>
                    <div class="footer-section f-section-2">
                        <p class="">Coded with <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart">
                                <path
                                    d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                </path>
                            </svg></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- SCRIPTS -->
    <%@ include file="./layout/scripts.jsp" %>
</body>

</html>