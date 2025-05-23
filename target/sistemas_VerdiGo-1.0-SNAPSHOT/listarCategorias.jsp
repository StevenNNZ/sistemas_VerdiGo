<%-- 
    Document   : listarCategorias
    Created on : 22/05/2025, 11:16:11 a. m.
    Author     : estiv
--%>

<%@page import="logica.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

                <!-- CONTENT AREA -->
                <div class="row layout-top-spacing">
                    <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
                        <div class="widget-content widget-content-area br-8">


                            <%
                                List<Categoria> listaCategorias = (List<Categoria>) session.getAttribute("listaCategorias");
                                if (listaCategorias != null && !listaCategorias.isEmpty()) {
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
                                        int cont = 1;
                                        for (Categoria categoria : listaCategorias) {
                                    %>
                                    <tr class="text-center">
                                        <td><%= cont %></td>
                                        <td><%= categoria.getNombre() %></td>
                                        <td>
                                            <div class="btn-group text-center" role="group">
                                                <!-- Botón Actualizar -->
                                                <form action="svEditarCategoria" method="GET" style="display:inline-block;">
                                                    <input type="hidden" name="id" value="<%= categoria.getId() %>">
                                                    <button type="submit" class="btn btn-sm btn-outline-primary" title="Editar">
                                                        <i class="material-icons">edit</i>
                                                    </button>
                                                </form>
                                                <!-- Botón Eliminar -->
                                                <form action="svEliminarCategoria" method="POST" style="display:inline-block;">
                                                    <input type="hidden" name="id" value="<%= categoria.getId() %>">
                                                    <button type="submit" class="btn btn-sm btn-outline-danger" title="Eliminar">
                                                        <i class="material-icons">delete</i>
                                                    </button>
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
                                No hay categorías registradas.
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <!-- END CONTENT AREA -->

            </div>
        </div>
        <%@ include file="./layout/footer.jsp" %>
    </div>
</div>

<!-- SCRIPTS -->
<%@ include file="./layout/scripts.jsp" %>

</body> </html>