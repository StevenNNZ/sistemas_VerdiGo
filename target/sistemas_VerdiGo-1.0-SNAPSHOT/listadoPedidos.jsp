<%@page import="logica.Usuario"%>
<%@page import="logica.Producto"%>
<%@page import="logica.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                                    List<Pedido> listaPrestamos = (List<Pedido>) request.getSession().getAttribute("listaPedido");
                                    if (listaPrestamos != null && !listaPrestamos.isEmpty()) {
                                %>
                                <table id="zero-config" class="table dt-table-hover" style="width:100%">
                                    <thead>
                                        <tr class="text-center">
                                            <th>#</th>
                                            <th>Fecha de Préstamo</th>
                                            <th>Fecha de Devolución</th>
                                            <th>Activo</th>
                                            <th>Título del Libro</th>
                                            <th>Autor del Libro</th>
                                            <th>Nombres del Usuario</th>
                                            <th>Correo del Usuario</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            int cont = 1;
                                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                            for (Pedido pedido : listaPrestamos) {
                                                Producto producto = pedido .getProducto();
                                                Usuario usuario = pedido.getUsuario();
                                        %>
                                        <tr class="text-center">
                                            <td><%= cont %></td>
                                            <td><%= sdf.format(pedido.getFecha_pedido()) %></td>
                                            <td><%= pedido.isActivo() ? "Sí" : "No" %></td>
                                            <td><%= producto.getNombre() %></td>
                                            <td><%= producto.getDescripcion() %></td>
                                            <td><%= usuario.getNombres() %></td>
                                            <td><%= usuario.getCorreo() %></td>
                                            <td>
                                                <form action="svDevolverLibro" method="POST">
                                                    <button type="submit" 
                                                        class="btn btn-sm <%= pedido.isActivo() ? "btn-outline-success" : "btn-dark" %>" 
                                                        title="Devolver libro"
                                                        <%= pedido.isActivo() ? "" : "disabled" %>>
                                                        <i class="material-icons" style="font-size: 18px;">rotate_left</i>
                                                    </button>
                                                    <input type="hidden" name="idPrestamo" value="<%= pedido.getId_pedido()%>">
                                                    <input type="hidden" name="idLibro" value="<%= producto.getId_producto()%>">
                                                </form>
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
                                    No hay préstamos registrados.
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