<%-- 
    Document   : sidebar
    Created on : 9/03/2025, 10:27:21 p. m.
    Author     : estiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!--  BEGIN SIDEBAR  -->
<div class="sidebar-wrapper sidebar-theme">

    <nav id="sidebar">

        <div class="navbar-nav theme-brand flex-row  text-center">
            <div class="nav-logo">
                <div class="nav-item theme-logo">
                    <a href="./index.html">
                        <img src="assets/img/logo.svg" class="navbar-logo" alt="logo">
                    </a>
                </div>
                <div class="nav-item theme-text">
                    <a href="./index.html" class="nav-link"> VerdiGo </a>
                </div>
            </div>
            <div class="nav-item sidebar-toggle">
                <div class="btn-toggle sidebarCollapse">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevrons-left"><polyline points="11 17 6 12 11 7"></polyline><polyline points="18 17 13 12 18 7"></polyline></svg>
                </div>
            </div>
        </div>
        <div class="shadow-bottom"></div>
        <ul class="list-unstyled menu-categories" id="accordionExample">
            <li class="menu menu-heading">
                <div class="heading">
                    <span class="material-icons">remove</span>
                    <span>APPLICATIONS</span>
                </div>
            </li>

            <li class="menu mt-3">
                <a href="svProducto" class="dropdown-toggle">
                    <div class="">
                        <span class="material-icons">inventory_2 </span>
                        <span>Productos</span>
                    </div>
                </a>
            </li>

            <li class="menu">
                <a href="#apps2" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <div class="">
                        <span class="material-icons">label </span>
                        <span>Categorías</span>
                    </div>
                     <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                    </div>
                </a>
                <ul class="collapse submenu list-unstyled" id="apps2" data-bs-parent="#accordionExample">
                    <li><a href="svCategoria"> Lista Categorías </a></li>
                    
                    
                    <% if ("administrador".equals(request.getSession().getAttribute("rol"))) { %>
                    <li><a href="crearCategorias.jsp"> Crear Categorías </a></li>
                    <% } %>
                </ul>
            </li>
                
                <li class="menu">
                <a href="#apps3" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <div class="">
                        <span class="material-icons">verified </span>
                        <span>Certificaciones</span>
                    </div>
                     <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                    </div>
                </a>
                <ul class="collapse submenu list-unstyled" id="apps3" data-bs-parent="#accordionExample">
                    <li><a href="svCertificacion"> Lista Certificaciones </a></li>
                    
                    <% if ("administrador".equals(request.getSession().getAttribute("rol"))) { %>
                    <li><a href="crearCertificacion.jsp"> Crear Certificaciones </a></li>
                    <% } %>
                </ul>
            </li>
                
                
            <li class="menu">
                <a href="#apps4" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <div class="">
                        <span class="material-icons">article </span>
                        <span>Posts</span>
                    </div>
                     <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                    </div>
                </a>
                <ul class="collapse submenu list-unstyled" id="apps4" data-bs-parent="#accordionExample">
                    <li><a href="svPost"> Ver Posts </a></li>                    
                    <li><a href="crearPost.jsp"> Nuevo Post </a></li>
                    
                    <!--
                    <% if ("administrador".equals(request.getSession().getAttribute("rol"))) { %>
                        <li><a href="svReservaLibro"> Listar Post </a></li>
                    <% } %>
                    -->
                </ul>
            </li>
            <% if ("administrador".equals(request.getSession().getAttribute("rol"))) { %>
            <li class="menu">
                <a href="svUsuarios" class="dropdown-toggle">
                    <div class="">
                        <span class="material-icons">group</span>
                        <span>Usuarios</span>
                    </div>
                </a>
            </li>
            <% } %>
        </ul>
    </nav>
</div>
<!--  END SIDEBAR  -->
