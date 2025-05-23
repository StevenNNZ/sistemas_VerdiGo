<%@ page import="logica.Categoria, logica.Certificacion, java.util.List" %>
<%
List<Categoria> categorias = (List<Categoria>) session.getAttribute("listaCategorias");
List<Certificacion> certificaciones = (List<Certificacion>) session.getAttribute("listaCertificaciones");
%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
    <div class="main-container" id="container">
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

                            <!-- CONTENT AREA -->
                            <form class="section general-info p-3" action="svProducto" method="POST">
                                <div class="info">
                                    <h6 class="fs-3 mb-3">Información del Producto</h6>
                                    <div class="form">
                                        <div class="row">
                                            <!-- Nombre -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="nombre">Nombre</label>
                                                    <input type="text" class="form-control mb-3" id="nombre" name="nombre" placeholder="Nombre del producto" required minlength="1" maxlength="100">
                                                </div>
                                            </div>

                                            <!-- Descripción -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="descripcion">Descripción</label>
                                                    <input type="text" class="form-control mb-3" id="descripcion" name="descripcion" placeholder="Descripción del producto" required minlength="1" maxlength="255">
                                                </div>
                                            </div>

                                            <!-- Precio -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="precio">Precio</label>
                                                    <input type="number" step="0.01" class="form-control mb-3" id="precio" name="precio" placeholder="Precio" required min="0">
                                                </div>
                                            </div>

                                            <!-- Stock -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="stock">Stock</label>
                                                    <input type="number" class="form-control mb-3" id="stock" name="stock" placeholder="Cantidad en stock" required min="0">
                                                </div>
                                            </div>

                                            <!-- Categoría --> 
                                            <div class="col-md-6"> 
                                                <div class="form-group"> 
                                                    <label for="categoria">Categoría</label> 
                                                    <select class="form-control mb-3" name="idCategoria" id="categoria" required> 
                                                        <option value="">Seleccione</option> 
                                                        <% if (categorias != null) {
                                                        for (Categoria cat : categorias) {%> 
                                                        <option value="<%= cat.getId()%>"><%= cat.getNombre()%></option> 
                                                        <% }
                                                        } %> 
                                                    </select> 
                                                </div> 
                                            </div>
                                                
                                            <!-- Certificación --> 
                                            <div class="col-md-6"> 
                                                <div class="form-group"> 
                                                    <label for="certificacion">Certificación</label> 
                                                    <select class="form-control mb-3" name="idCertificacion" id="certificacion" required> 
                                                        <option value="">Seleccione</option> 
                                                        <% if (certificaciones != null) {
                                                        for (Certificacion cert : certificaciones) {%> 
                                                        <option value="<%= cert.getId()%>"><%= cert.getNombre()%></option> <% }
                                                        }%> 
                                                    </select> 
                                                </div> 
                                            </div>

                                            <!-- Impacto Ambiental -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="impactoAmbiental">Impacto Ambiental</label>
                                                    <input type="text" class="form-control mb-3" id="impactoAmbiental" name="impactoAmbiental" placeholder="Impacto ambiental del producto" minlength="1" maxlength="100">
                                                </div>
                                            </div>

                                            <!-- Botón Guardar -->
                                            <div class="col-md-12 mt-1">
                                                <div class="form-group text-end">
                                                    <button type="submit" class="btn btn-secondary">Guardar Producto</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>

                <div class="footer-wrapper">
                    <div class="footer-section f-section-1">
                        <p class="">Copyright © <span class="dynamic-year">2025</span> <a target="_blank"
                                href="https://designreset.com/cork-admin/">DesignReset</a>, All rights reserved.</p>
                    </div>
                    <div class="footer-section f-section-2">
                        <p class="">Coded with 
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart">
                                <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                </path>
                            </svg>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- SCRIPTS -->
    <%@ include file="./layout/scripts.jsp" %>
</body>

</html>