<%@page import="logica.Producto"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> <html lang="es"> <!-- Head -->
    <%@ include file="./layout/head.jsp" %>

    <body class="layout-boxed"> 
        
        <!-- BEGIN LOADER --> 
        <%@ include file="./layout/loader.jsp" %> <!-- END LOADER -->

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

                        <!-- BEGIN BREADCRUMBS -->
                        <%@ include file="./layout/breadcrumbs.jsp" %>
                        <!-- END BREADCRUMBS -->

                        <!-- CONTENT AREA -->
                        <div class="row layout-top-spacing">
                            <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
                                <div class="widget-content widget-content-area br-8">

                                    <%                                String rol = (String) request.getSession().getAttribute("rol");
                                        List<Producto> listaProducto = (List<Producto>) request.getSession().getAttribute("listaProductos");
                                    %>

                                    <% if ("administrador".equals(rol)) { %>
                                    <div class="mb-3 text-end">
                                        <a href="svCargarFormularioProducto" class="btn btn-primary">
                                            <i class="material-icons" style="font-size: 18px; vertical-align: middle;">add</i> Crear Producto
                                        </a>
                                    </div>
                                    <% } %>

                                    <% if (listaProducto != null && !listaProducto.isEmpty()) { %>
                                    <table id="zero-config" class="table dt-table-hover" style="width:100%">
                                        <thead>
                                            <tr class="text-center">
                                                <th>#</th>
                                                <th>Nombre</th>
                                                <th>Descripción</th>
                                                <th>Precio</th>
                                                <th>Stock</th>
                                                <th>Categoría</th>
                                                <th>Certificación</th>
                                                <th>Impacto Ambiental</th>
                                                    <% if ("administrador".equals(rol)) { %>
                                                <th class="no-content">Acciones</th>
                                                    <% } %>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int cont = 1;
                                                for (Producto producto : listaProducto) {
                                            %>
                                            <tr class="text-center">
                                                <td><%= cont%></td>
                                                <td><%= producto.getNombre()%></td>
                                                <td><%= producto.getDescripcion()%></td>
                                                <td>$<%= producto.getPrecio()%></td>
                                                <td><%= producto.getStock()%></td>
                                                <td><%= (producto.getCategoria() != null) ? producto.getCategoria().getNombre() : "Sin categoría"%></td>
                                                <td><%= (producto.getCertificacion() != null) ? producto.getCertificacion().getNombre() : "Sin certificación"%></td>
                                                <td><%= producto.getImpactoAmbiental()%> %</td>

                                                <% if ("administrador".equals(rol)) {%>
                                                <td>
                                                    <div class="btn-group text-center" role="group">
                                                        <form action="svEditarProducto" method="GET">
                                                            <button type="submit" class="btn btn-sm btn-outline-warning" title="Editar">
                                                                <i class="material-icons" style="font-size: 18px;">edit</i>
                                                            </button>
                                                            <input type="hidden" name="id" value="<%= producto.getId_producto()%>">
                                                        </form>
                                                        <form action="svEliminarProducto" method="POST">
                                                            <button type="submit" class="btn btn-sm btn-outline-danger" title="Eliminar">
                                                                <i class="material-icons" style="font-size: 18px;">delete</i>
                                                            </button>
                                                            <input type="hidden" name="idProducto" value="<%= producto.getId_producto()%>">
                                                        </form>
                                                    </div>
                                                </td>
                                                <% } %>
                                            </tr>
                                            <%
                                                    cont++;
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                    <% } else { %>
                                    <div class="alert alert-warning text-center">
                                        No hay productos registrados.
                                    </div>
                                    <% }%>

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