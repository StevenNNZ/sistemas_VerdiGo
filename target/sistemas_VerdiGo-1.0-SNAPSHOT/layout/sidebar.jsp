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
                <a href="svProducto" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <div class="">
                        <span class="material-icons">menu_book</span>
                        <span>Productos</span>
                    </div>
                     <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                    </div>
                </a>
                <ul class="collapse submenu list-unstyled" id="apps1" data-bs-parent="#accordionExample">
                    
                    
                    <% if ("administrador".equals(request.getSession().getAttribute("rol"))) { %>
                        <!-- contenido para admin -->
                    <% } %>

                    
                    <li><a href="svProducto"> Ver productos </a></li>
                </ul>
            </li>

            <li class="menu">
                <a href="#apps2" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <div class="">
                        <span class="material-icons">bookmark</span>
                        <span>Categorías</span>
                    </div>
                     <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                    </div>
                </a>
                <ul class="collapse submenu list-unstyled" id="apps2" data-bs-parent="#accordionExample">
                    <li><a href="svReservaLibro"> Lista Categorías </a></li>
                </ul>
            </li>
            <% if ("administrador".equals(request.getSession().getAttribute("rol"))) { %>
            <li class="menu">
                <a href="#apps3" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <div class="">
                        <span class="material-icons">group</span>
                        <span>Usuarios</span>
                    </div>
                     <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                    </div>
                </a>
                <ul class="collapse submenu list-unstyled" id="apps3" data-bs-parent="#accordionExample">
                    <li><a href="svUsuarios"> Lista de Categorías </a></li>
                </ul>
            </li>
            <% } %>
        </ul>
    </nav>
</div>
<!--  END SIDEBAR  -->
