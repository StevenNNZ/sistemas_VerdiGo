<%-- 
    Document   : editarComentario
    Created on : 22/05/2025, 10:24:51 a. m.
    Author     : estiv
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Comentario"%>
<%@ include file="./layout/head.jsp" %>
<%
    Comentario comentario = (Comentario) session.getAttribute("comentarioEditar");
    if (comentario == null) {
        response.sendRedirect("svPost");
        return;
    }
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

                            <form action="svEditarComentario" method="POST">
                                <div class="row mb-4 layout-spacing layout-top-spacing">
                                    <div class="col-12">
                                        <label for="contenido">Editar Comentario</label>
                                        <textarea class="form-control" name="contenido" id="contenido"
                                                  rows="6" required minlength="3"><%= comentario.getContenido() %></textarea>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-warning w-100">Guardar Comentario</button>
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
