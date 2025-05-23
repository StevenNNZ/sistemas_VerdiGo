<%-- 
    Document   : crearCategorias
    Created on : 22/05/2025, 11:16:02 a. m.
    Author     : estiv
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> <html lang="es"> <!-- Head -->
    <%@ include file="./layout/head.jsp" %>

    <body class="layout-boxed">

        <!-- BEGIN LOADER -->
        <%@ include file="./layout/loader.jsp" %>
        <!-- END LOADER -->

        <!-- Validación de sesión -->
        <%@ include file="./layout/validarSesion.jsp" %>
        <!-- END Validación de sesión -->

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

                                <!-- BREADCRUMB -->
                                <%@ include file="./layout/breadcrumbs.jsp" %>
                                <!-- END BREADCRUMB -->

                                <!-- FORMULARIO CATEGORIA -->
                                <form class="section general-info p-3" action="svCategoria" method="POST">
                                    <div class="info">
                                        <h6 class="fs-3 mb-3">Registrar Nueva Categoría</h6>
                                        <div class="form">
                                            <div class="row">

                                                <!-- Campo Nombre -->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="nombre">Nombre</label>
                                                        <input type="text" class="form-control mb-3" id="nombre" name="nombre"
                                                               placeholder="Nombre de la categoría"
                                                               required minlength="2" maxlength="50">
                                                    </div>
                                                </div>

                                                <!-- Botón Guardar -->
                                                <div class="col-md-12 mt-1">
                                                    <div class="form-group text-end">
                                                        <button type="submit" class="btn btn-secondary">Guardar Categoría</button>
                                                        <a href="svCategoria" class="btn btn-light ms-2">Cancelar</a>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- FORMULARIO END -->

                            </div>
                        </div>
                    </div>

                    <!-- FOOTER -->
                    <div class="footer-wrapper">
                        <div class="footer-section f-section-1">
                            <p class="">Copyright © <span class="dynamic-year">2025</span> 
                                <a target="_blank" href="https://designreset.com/cork-admin/">DesignReset</a>, All rights reserved.</p>
                        </div>
                        <div class="footer-section f-section-2">
                            <p class="">Coded with 
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                     stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart">
                                <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                                </svg>
                            </p>
                        </div>
                    </div>
                    <!-- END FOOTER -->

                </div>
            </div>
        </div>

        <!-- SCRIPTS -->
        <%@ include file="./layout/scripts.jsp" %>

    </body> </html>