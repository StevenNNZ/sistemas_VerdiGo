<%-- 
    Document   : editarCategoria
    Created on : 22/05/2025, 1:46:42 p. m.
    Author     : estiv
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Categoria"%>
<%
    Categoria categoria = (Categoria) session.getAttribute("categoriaEditar");
    if (categoria == null) {
%>
<div class="alert alert-danger m-4">No se encontró la categoría a editar.</div>
<%
        return;
    }
%>

<!DOCTYPE html> <html lang="es"> <!-- Head -->
    <%@ include file="./layout/head.jsp" %>

    <body class="layout-boxed"> 
        <%@ include file="./layout/loader.jsp" %> 
        <%@ include file="./layout/validarSesion.jsp" %> 
        <%@ include file="./layout/navbar.jsp" %>


        <div class="main-container" id="container">
            <div class="overlay"></div>
            <div class="search-overlay"></div>
            <%@ include file="./layout/sidebar.jsp" %>

            <div id="content" class="main-content">
                <div class="layout-px-spacing layout-top-spacing">
                    <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
                        <div class="widget-content widget-content-area br-8">
                            <div class="middle-content container-xxl p-0">
                                <%@ include file="./layout/breadcrumbs.jsp" %>

                                <form class="section general-info p-3" action="svEditarCategoria" method="POST">
                                    <div class="info">
                                        <h6 class="fs-3 mb-3">Editar Categoría</h6>
                                        <div class="form">
                                            <div class="row">

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="nombre">Nombre</label>
                                                        <input type="text" class="form-control mb-3" id="nombre" name="nombre"
                                                               value="<%= categoria.getNombre()%>"
                                                               required minlength="2" maxlength="50" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mt-1">
                                                    <div class="form-group text-end">
                                                        <button type="submit" class="btn btn-secondary">Guardar Cambios</button>
                                                        <a href="svCategoria" class="btn btn-light ms-2">Cancelar</a>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                    <%@ include file="./layout/footer.jsp" %>
                </div>
            </div>
        </div>

        <%@ include file="./layout/scripts.jsp" %>

    </body> </html>