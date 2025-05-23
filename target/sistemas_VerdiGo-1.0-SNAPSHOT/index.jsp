<%@page import="java.util.List"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- END Validación de sesión -->

        <!-- BEGIN NAVBAR -->
        <%@ include file="./layout/navbar.jsp" %>
        <!-- END NAVBAR -->

        <!-- STYLES -->
        <style>
            .welcome-banner {
                background: linear-gradient(135deg, #4CAF50, #81C784);
                border-radius: 15px;
                color: white;
                padding: 40px 30px;
                margin-bottom: 30px;
                box-shadow: 0 4px 20px rgba(76, 175, 80, 0.3);
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .welcome-banner h1 {
                font-size: 2.3rem;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .welcome-banner p {
                font-size: 1.1rem;
                opacity: 0.9;
                margin: 0;
            }

            .feature-card {
                border: none;
                border-radius: 12px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
                transition: all 0.3s ease;
                background-color: #f4f8f5;
            }

            .feature-card:hover {
                box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
                transform: translateY(-5px);
            }

            .feature-card .icon {
                font-size: 40px;
                color: #4CAF50;
            }

            .feature-card .content h5 {
                font-weight: 600;
                font-size: 1.2rem;
            }

            .feature-card .content p {
                margin-bottom: 15px;
                color: #555;
            }

            .btn-verdi {
                background-color: #4CAF50;
                border: none;
                color: white;
                font-weight: 500;
                padding: 8px 16px;
                border-radius: 6px;
            }

            .btn-verdi:hover {
                background-color: #43A047;
            }
        </style>

        <!-- BEGIN MAIN CONTAINER -->
        <div class="main-container" id="container">
            <div class="overlay"></div>
            <div class="search-overlay"></div>

            <!-- SIDEBAR -->
            <%@ include file="./layout/sidebar.jsp" %>

            <!-- CONTENT -->
            <div id="content" class="main-content">
                <div class="layout-px-spacing layout-top-spacing">
                    <div class="middle-content container-xxl p-0">

                        <%@ include file="./layout/breadcrumbs.jsp" %>

                        <!-- Banner superior -->
                        <div class="welcome-banner">
                            <div>
                                <h1 class="text-white">¡Bienvenido a VerdiGo! 🍃</h1>
                                <p class="text-white">Gestión inteligente de productos ecológicos, certificados y sostenibles.</p>
                            </div>
                        </div>

                        <!-- Cards de navegación -->
                        <div class="row">

                            <!-- Categorías -->
                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 mb-4">
                                <div class="card feature-card p-4 text-center">
                                    <div class="icon mb-3">
                                        <i class="material-icons">category</i>
                                    </div>
                                    <div class="content">
                                        <h5>Categorías</h5>
                                        <p>Organiza tus productos según su tipo.</p>
                                        <a href="svCategoria" class="btn btn-verdi">Ver Categorías</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Certificaciones -->
                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 mb-4">
                                <div class="card feature-card p-4 text-center">
                                    <div class="icon mb-3">
                                        <i class="material-icons">verified</i>
                                    </div>
                                    <div class="content">
                                        <h5>Certificaciones</h5>
                                        <p>Controla las certificaciones de tus productos ECO.</p>
                                        <a href="svCertificacion" class="btn btn-verdi">Ver Certificaciones</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Productos -->
                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 mb-4">
                                <div class="card feature-card p-4 text-center">
                                    <div class="icon mb-3">
                                        <i class="material-icons">inventory_2</i>
                                    </div>
                                    <div class="content">
                                        <h5>Productos</h5>
                                        <p>Gestiona tu inventario de productos ecológicos.</p>
                                        <a href="svProducto" class="btn btn-verdi">Ver Productos</a>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

                <!-- FOOTER -->
                <div class="footer-wrapper">
                    <div class="footer-section f-section-1">
                        <p class="">VerdiGo © <span class="dynamic-year">2025</span> - Todos los derechos reservados.</p>
                    </div>
                    <div class="footer-section f-section-2">
                        <p class="">Desarrollado con 
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                 viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                 class="feather feather-heart">
                            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12
                                  21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" />
                            </svg> con pasión verde.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- SCRIPTS -->
        <%@ include file="./layout/scripts.jsp" %>
    </body>
</html>
