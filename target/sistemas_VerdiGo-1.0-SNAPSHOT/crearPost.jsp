<%-- 
    Document   : crearPost
    Created on : 22/05/2025, 9:00:20 a. m.
    Author     : estiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Usuario"%>
<%@ include file="./layout/head.jsp" %>

<!DOCTYPE html> 
<html lang="es"> 
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
                            <div class="middle-content container-xxl p-3">
                                <!-- BEGIN BREADCRUMBS -->
                                <%@ include file="./layout/breadcrumbs.jsp" %>
                                <!-- END BREADCRUMBS -->
                                
                                <form action="svPost" method="POST">
                                    <div class="row mb-4 layout-spacing layout-top-spacing">

                                        <!-- Columna izquierda: contenido -->
                                        <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                <div class="row mb-4">
                                                    <div class="col-sm-12">
                                                        <label for="tituloPost">Título del Post</label>
                                                        <input type="text" name="titulo" class="form-control" id="tituloPost" placeholder="Escribe un título..." required minlength="5">
                                                    </div>
                                                </div>

                                                <div class="row mb-4">
                                                    <div class="col-sm-12">
                                                        <label for="contenido">Contenido</label>
                                                        <textarea class="form-control" name="contenido" id="contenido" rows="10" placeholder="Escribe el contenido aquí..." required minlength="10"></textarea>
                                                    </div>
                                                </div>
                                        </div>

                                        <!-- Columna derecha: extras -->
                                        <div class="col-xxl-3 col-xl-12 col-lg-12 col-md-12 col-sm-12 mt-xxl-0 mt-4">
                                            <div class="widget-content widget-content-area blog-create-section">

                                                <div class="row">
                                                    <div class="col-xxl-12 col-sm-4 col-12 mx-auto">
                                                        <button type="submit" class="btn btn-success w-100">Publicar Post</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <%@ include file="./layout/footer.jsp" %>
            </div>
        </div>
        <%@ include file="./layout/scripts.jsp" %>
    </body> 
</html>