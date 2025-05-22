<%-- 
    Document   : editarPost
    Created on : 22/05/2025, 10:25:28 a. m.
    Author     : estiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Post"%>
<%@ include file="./layout/head.jsp" %>
<%
    Post post = (Post) session.getAttribute("postEditar");
%>
<!DOCTYPE html>
<html lang="es">
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
                        <div class="middle-content container-xxl p-3">
                            <%@ include file="./layout/breadcrumbs.jsp" %>

                            <form action="svEditarPost" method="POST">
                                <input type="hidden" name="id" value="<%= post.getId() %>">

                                <div class="row mb-4 layout-spacing layout-top-spacing">
                                    <div class="col-xxl-9">
                                        <div class="row mb-4">
                                            <div class="col-sm-12">
                                                <label for="tituloPost">Título del Post</label>
                                                <input type="text" name="titulo" class="form-control" id="tituloPost"
                                                       value="<%= post.getTitulo() %>" required minlength="5">
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col-sm-12">
                                                <label for="contenido">Contenido</label>
                                                <textarea class="form-control" name="contenido" id="contenido"
                                                          rows="10" required minlength="10"><%= post.getContenido() %></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xxl-3 mt-xxl-0 mt-4">
                                        <div class="widget-content widget-content-area blog-create-section">
                                            <div class="row">
                                                <div class="col-12">
                                                    <button type="submit" class="btn btn-warning w-100">Guardar Cambios</button>
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
