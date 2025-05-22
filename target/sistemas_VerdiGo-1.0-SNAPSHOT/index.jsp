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
    <!--  END LOADER -->
    
    <!-- Validación de sesión -->
    <%@ include file="./layout/validarSesion.jsp" %>
    <!-- Fin Validación de sesión -->
    
    <!--  BEGIN NAVBAR  -->
    <%@ include file="./layout/navbar.jsp" %>
     <!--  END NAVBAR  -->
    
     <!--  BEGIN MAIN CONTAINER  -->
     <div class="main-container " id="container">
         <div class="overlay"></div>
        <div class="search-overlay"></div>
        
            <!--  BEGIN SIDEBAR  -->
            <%@ include file="./layout/sidebar.jsp" %>
             <!--  END SIDEBAR  -->
             
             <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="middle-content container-xxl p-0">

                    <!--  BEGIN BREADCRUMBS  -->
                   <%@ include file="./layout/breadcrumbs.jsp" %>
                    <!--  END BREADCRUMBS  -->    
    
                    <!-- CONTENT AREA -->
                    <div class="row layout-top-spacing">

                        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
                            <div class="widget-content widget-content-area br-8">
                                
                                <h1 class="fs-3 mb-3 p-3">¡Explora nuestros productos"</h1>
                                
                            </div>
                        </div>
                        
                    </div>
                    <!-- CONTENT AREA -->

                </div>

            </div>

            <div class="footer-wrapper">
                <div class="footer-section f-section-1">
                    <p class="">Copyright © <span class="dynamic-year">2025</span> <a target="_blank" href="https://designreset.com/cork-admin/">DesignReset</a>, All rights reserved.</p>
                </div>
                <div class="footer-section f-section-2">
                    <p class="">Coded with <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></p>
                </div>
            </div>
            
        </div>
     </div>
                    
    <!-- SCRIPTS -->
    <%@ include file="./layout/scripts.jsp" %>
</body>
</html>
