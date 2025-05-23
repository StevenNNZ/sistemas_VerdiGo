<%-- 
    Document   : listarCertificaciones
    Created on : 22/05/2025, 11:18:14 a. m.
    Author     : estiv
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="logica.Certificacion" %>

<!DOCTYPE html> <html lang="es"> <!-- Head -->
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

        <!-- BEGIN MAIN CONTAINER -->
        <div class="main-container" id="container">
            <div class="overlay"></div>
            <div class="search-overlay"></div>

            <!-- BEGIN SIDEBAR -->
            <%@ include file="./layout/sidebar.jsp" %>
            <!-- END SIDEBAR -->

            <!-- BEGIN CONTENT AREA -->
            <div id="content" class="main-content">
                <div class="layout-px-spacing">

                    <div class="middle-content container-xxl p-0">

                        <!-- BREADCRUMB -->
                        <%@ include file="./layout/breadcrumbs.jsp" %>
                        <!-- END BREADCRUMB -->

                        <!-- CONTENIDO -->
                        <div class="row layout-top-spacing">
                            <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
                                <div class="widget-content widget-content-area br-8">

                                    <%                                List<Certificacion> listaCertificaciones
                                                = (List<Certificacion>) session.getAttribute("listaCertificaciones");
                                        int cont = 1;
                                        if (listaCertificaciones != null && !listaCertificaciones.isEmpty()) {
                                    %>
                                    <table id="zero-config" class="table dt-table-hover" style="width:100%">
                                        <thead>
                                            <tr class="text-center">
                                                <th>#</th>
                                                <th>Nombre</th>
                                                <th class="no-content">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (Certificacion cert : listaCertificaciones) {
                                            %>
                                            <tr class="text-center">
                                                <td><%= cont++%></td>
                                                <td><%= cert.getNombre()%></td>
                                                <td>
                                                    <div class="btn-group text-center" role="group">
                                                        <!-- Editar -->
                                                        <form action="svEditarCertificacion" method="GET"
                                                              style="display:inline-block;">
                                                            <input type="hidden" name="id" value="<%= cert.getId()%>">
                                                            <button type="submit" class="btn btn-sm btn-outline-primary"
                                                                    title="Editar">
                                                                <i class="material-icons">edit</i>
                                                            </button>
                                                        </form>
                                                        <!-- Eliminar -->
                                                        <form action="svEliminarCertificacion" method="POST"
                                                              style="display:inline-block;">
                                                            <input type="hidden" name="id" value="<%= cert.getId()%>">
                                                            <button type="submit" class="btn btn-sm btn-outline-danger"
                                                                    title="Eliminar"
                                                                    onclick="return confirm('¿Eliminar esta certificación?')">
                                                                <i class="material-icons">delete</i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                    <% } else { %>
                                    <div class="alert alert-warning text-center">
                                        No hay certificaciones registradas.
                                    </div>
                                    <% }%>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <%@ include file="./layout/footer.jsp" %>
            </div>
        </div>

        <!-- SCRIPTS -->
        <%@ include file="./layout/scripts.jsp" %>

    </body> </html>