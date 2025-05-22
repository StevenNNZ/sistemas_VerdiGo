<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*, logica.Usuario, logica.Post, logica.Comentario"%>

<%!
    String formatDate(Date fecha) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm");
        return sdf.format(fecha);
    }
%>

<%
    HttpSession sesion = request.getSession(false);
    Usuario usuarioSesion = (Usuario) sesion.getAttribute("usuario");
    List<Post> listaPosts = (List<Post>) sesion.getAttribute("listaPosts");
%>

<!DOCTYPE html> <html lang="es"> <%@ include file="./layout/head.jsp" %>


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
                    <div class="middle-content container-xxl p-0">

                        <!-- BREADCRUMB -->
                        <%@ include file="./layout/breadcrumbs.jsp" %>
                        <!-- BREADCRUMB END -->

                        <% if (listaPosts != null && !listaPosts.isEmpty()) {
                            for (Post post : listaPosts) {%>

                        <div class="row layout-top-spacing">
                            <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
                                <div class="card border-light bg-white rounded shadow-sm mb-4 p-4">

                                    <!-- POST HEADER -->
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <div class="d-flex align-items-center">
                                            <img src="assets/img/profile-30.png" class="rounded-circle me-3" width="45"/>
                                            <div>
                                                <h5 class="mb-0"><%= post.getAutor().getNombres()%> <%= post.getAutor().getApellidos()%></h5>
                                                <small class="text-muted"><%= formatDate(post.getFecha())%></small>
                                            </div>
                                        </div>

                                        <% if (usuarioSesion != null && usuarioSesion.getId_usuario() == post.getAutor().getId_usuario()) {%>
                                        <div class="ms-auto">
                                            <form action="svEditarPost" method="GET" class="d-inline">
                                                <input type="hidden" name="id" value="<%= post.getId()%>"/>
                                                <button class="btn btn-sm btn-outline-primary" title="Editar">
                                                    <i class="material-icons">edit</i>
                                                </button>
                                            </form>
                                            <form action="svEliminarPost" method="POST" class="d-inline">
                                                <input type="hidden" name="id" value="<%= post.getId()%>"/>
                                                <button class="btn btn-sm btn-outline-danger" title="Eliminar">
                                                    <i class="material-icons">delete</i>
                                                </button>
                                            </form>
                                        </div>
                                        <% }%>
                                    </div>

                                    <!-- POST CONTENT -->
                                    <h4 class="mb-2"><%= post.getTitulo()%></h4>
                                    <p class="mb-3 text-justify"><%= post.getContenido()%></p>

                                    <!-- COMMENTS -->
                                    <hr>
                                    <h6 class="text-muted mb-3">Comentarios (<%= post.getComentarios() != null ? post.getComentarios().size() : 0%>)</h6>

                                    <% if (post.getComentarios() != null) {
                                        for (Comentario c : post.getComentarios()) {%>
                                    <div class="d-flex mb-3 ps-3">
                                        <img src="assets/img/profile-24.jpeg" class="rounded-circle me-2" width="32" height="32"/>
                                        <div class="w-100">
                                            <div class="d-flex justify-content-between">
                                                <h6 class="mb-0"><%= c.getAutor().getNombres()%> <%= c.getAutor().getApellidos()%></h6>
                                                <small class="text-muted"><%= formatDate(c.getFecha())%></small>
                                            </div>
                                            <p class="mb-2"><%= c.getContenido()%></p>

                                            <% if (usuarioSesion != null && usuarioSesion.getId_usuario() == c.getAutor().getId_usuario()) {%>
                                            <form action="svEditarComentario" method="GET" class="d-inline">
                                                <input type="hidden" name="id" value="<%= c.getId()%>"/>
                                                <button class="btn btn-sm btn-outline-secondary">Editar</button>
                                            </form>
                                            <form action="svEliminarComentario" method="POST" class="d-inline">
                                                <input type="hidden" name="id" value="<%= c.getId()%>"/>
                                                <button class="btn btn-sm btn-outline-danger">Eliminar</button>
                                            </form>
                                            <% } %>
                                        </div>
                                    </div>
                                    <% }
                                    }%>

                                    <!-- CREATE COMMENT -->
                                    <form action="svComentario" method="POST" class="mt-4">
                                        <input type="hidden" name="postId" value="<%= post.getId()%>"/>
                                        <div class="mb-3">
                                            <label class="form-label">Agregar comentario</label>
                                            <textarea name="comentario" class="form-control" rows="2" required placeholder="Escribe algo..."></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-success">Publicar comentario</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <% }
                    } else { %>
                        <div class="alert alert-info text-center">No hay publicaciones disponibles.</div>
                        <% }%>
                    </div>
                </div>

                <%@ include file="./layout/footer.jsp" %>
            </div>
        </div>

        <%@ include file="./layout/scripts.jsp" %>
    </body>
</html>
