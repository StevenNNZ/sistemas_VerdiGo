<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
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
    <div class="main-container" id="container">
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
                        <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
                            <div class="widget-content widget-content-area br-8">
                                <%
                                    List<Usuario> listaUsuarios = (List<Usuario>) request.getSession().getAttribute("listaUsuarios");
                                    if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
                                %>
                                <table id="zero-config" class="table dt-table-hover" style="width:100%">
                                    <thead>
                                        <tr class="text-center">
                                            <th>#</th>
                                            <th>Nombres</th>
                                            <th>Apellidos</th>
                                            <th>Correo</th>
                                            <th>Rol</th>
                                            <th class="no-content">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            int cont = 1;
                                            for (Usuario usuario : listaUsuarios) {
                                        %>
                                        <tr class="text-center">
                                            <td><%= cont %></td>
                                            <td><%= usuario.getNombres() %></td>
                                            <td><%= usuario.getApellidos() %></td>
                                            <td><%= usuario.getCorreo() %></td>
                                            <td><%= usuario.getRol() %></td>
                                            <td>
                                                <div class="btn-group text-center" role="group">
                                                    <!-- Botón Actualizar -->
                                                    <form action="svEditarUsuario" method="GET">
                                                        <button type="submit" class="btn btn-sm btn-outline-primary" title="Actualizar">
                                                            <i class="material-icons">edit</i>
                                                        </button>
                                                        <input type="hidden" name="id" value="<%= usuario.getId_usuario()%>">
                                                    </form>
                                                    <!-- Botón Eliminar -->
                                                    <form action="svEliminarUsuario" method="POST">
                                                        <button type="submit" class="btn btn-sm btn-outline-danger" title="Eliminar">
                                                            <i class="material-icons">delete</i>
                                                        </button>
                                                        <input type="hidden" name="id" value="<%= usuario.getId_usuario()%>">
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                                cont++;
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <%
                                    } else {
                                %>
                                <div class="alert alert-warning text-center">
                                    No hay usuarios registrados.
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <!-- CONTENT AREA -->
                </div>
            </div>
            <%@ include file="./layout/footer.jsp" %>
        </div>
    </div>

    <!-- SCRIPTS -->
    <%@ include file="./layout/scripts.jsp" %>
</body>
</html>