<%@page import="logica.Producto"%>
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
                            
                            <% 
                                Producto producto = (Producto) request.getSession().getAttribute("productoEditar");
                            %>

                            <!-- CONTENT AREA -->
                            <form class="section general-info p-3" action="svEditarProducto" method="POST">
                                <div class="info">
                                    <h6 class="fs-3 mb-3">Información del Producto</h6>
                                    <div class="form">
                                        <div class="row">

                                            <!-- Nombre -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="nombre">Nombre</label>
                                                    <input type="text" class="form-control mb-3" id="nombre" name="nombre" placeholder="Nombre del producto"
                                                           value="<%= producto != null ? producto.getNombre() : "" %>" required minlength="1" maxlength="100">
                                                </div>
                                            </div>

                                            <!-- Descripción -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="descripcion">Descripción</label>
                                                    <input type="text" class="form-control mb-3" id="descripcion" name="descripcion" placeholder="Descripción"
                                                           value="<%= producto != null ? producto.getDescripcion() : "" %>" required minlength="1" maxlength="255">
                                                </div>
                                            </div>

                                            <!-- Precio -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="precio">Precio</label>
                                                    <input type="number" step="0.01" class="form-control mb-3" id="precio" name="precio" placeholder="Precio"
                                                           value="<%= producto != null ? String.valueOf(producto.getPrecio()) : "" %>"
                                                </div>
                                            </div>

                                            <!-- Stock -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="stock">Stock</label>
                                                    <input type="number" class="form-control mb-3" id="stock" name="stock" placeholder="Cantidad en stock"
                                                           value="<%= producto != null ? String.valueOf(producto.getStock()) : "" %>"
                                                </div>
                                            </div>

                                            <!-- Certificación -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="certificacion">Certificación</label>
                                                    <input type="text" class="form-control mb-3" id="certificacion" name="certificacion" placeholder="Certificación"
                                                           value="<%= producto != null ? producto.getCertificacion() : "" %>" minlength="1" maxlength="100">
                                                </div>
                                            </div>

                                            <!-- Impacto Ambiental -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="impactoAmbiental">Impacto Ambiental</label>
                                                    <input type="text" class="form-control mb-3" id="impactoAmbiental" name="impactoAmbiental" placeholder="Impacto Ambiental"
                                                           value="<%= producto != null ? producto.getImpactoAmbiental() : "" %>" minlength="1" maxlength="100">
                                                </div>
                                            </div>

                                            <!-- Botón Guardar -->
                                            <div class="col-md-12 mt-1">
                                                <div class="form-group text-end">
                                                    <input type="hidden" name="id" value="<%= producto != null ? producto.getId_producto() : "" %>">
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