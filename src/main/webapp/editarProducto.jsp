<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.Producto, logica.Categoria, logica.Certificacion"%>
<%@page import="java.util.List"%>

<%
    Producto producto = (Producto) session.getAttribute("productoEditar");
    List<Categoria> categorias = (List<Categoria>) session.getAttribute("listaCategorias");
    List<Certificacion> certificaciones = (List<Certificacion>) session.getAttribute("listaCertificaciones");
%>

<!DOCTYPE html> 
<html lang="es"> 
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

                                <form class="section general-info p-3" action="svEditarProducto" method="POST">
                                    <div class="info">
                                        <h6 class="fs-3 mb-3">Editar Producto</h6>
                                        <div class="form">
                                            <div class="row">

                                                <!-- Nombre -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="nombre">Nombre</label>
                                                        <input type="text" class="form-control mb-3" id="nombre" name="nombre"
                                                               value="<%= producto != null ? producto.getNombre() : ""%>"
                                                               placeholder="Nombre del producto" required>
                                                    </div>
                                                </div>

                                                <!-- Descripción -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="descripcion">Descripción</label>
                                                        <input type="text" class="form-control mb-3" id="descripcion" name="descripcion"
                                                               value="<%= producto != null ? producto.getDescripcion() : ""%>"
                                                               placeholder="Descripción del producto" required>
                                                    </div>
                                                </div>

                                                <!-- Precio -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="precio">Precio</label>
                                                        <input type="number" step="0.01" class="form-control mb-3" id="precio" name="precio"
                                                               value="<%= producto != null ? producto.getPrecio() : ""%>"
                                                               placeholder="Precio" required>
                                                    </div>
                                                </div>

                                                <!-- Stock -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="stock">Stock</label>
                                                        <input type="number" class="form-control mb-3" id="stock" name="stock"
                                                               value="<%= producto != null ? producto.getStock() : ""%>"
                                                               placeholder="Cantidad en stock" required>
                                                    </div>
                                                </div>

                                                <!-- Categoría -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="idCategoria">Categoría</label>
                                                        <select class="form-control mb-3" id="idCategoria" name="idCategoria" required>
                                                            <option value="">Seleccione</option>
                                                            <% if (categorias != null) {
                                                                    for (Categoria cat : categorias) {
                                                                        boolean selected = producto != null
                                                                                && producto.getCategoria() != null
                                                                                && producto.getCategoria().getId() == cat.getId();
                                                            %>
                                                            <option value="<%= cat.getId()%>" <%= selected ? "selected" : ""%>>
                                                                <%= cat.getNombre()%>
                                                            </option>
                                                            <% }
                                                                } %>
                                                        </select>
                                                    </div>
                                                </div>

                                                <!-- Certificación -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="idCertificacion">Certificación</label>
                                                        <select class="form-control mb-3" id="idCertificacion" name="idCertificacion" required>
                                                            <option value="">Seleccione</option>
                                                            <% if (certificaciones != null) {
                                                                    for (Certificacion cert : certificaciones) {
                                                                        boolean selected = producto != null
                                                                                && producto.getCertificacion() != null
                                                                                && producto.getCertificacion().getId() == cert.getId();
                                                            %>
                                                            <option value="<%= cert.getId()%>" <%= selected ? "selected" : ""%>>
                                                                <%= cert.getNombre()%>
                                                            </option>
                                                            <% }
                                                                }%>
                                                        </select>
                                                    </div>
                                                </div>

                                                <!-- Impacto Ambiental -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="impactoAmbiental">Impacto ambiental (%)</label>
                                                        <input type="text" class="form-control mb-3" id="impactoAmbiental" name="impactoAmbiental"
                                                               value="<%= producto != null ? producto.getImpactoAmbiental() : ""%>"
                                                               placeholder="Impacto ambiental" required>
                                                    </div>
                                                </div>

                                                <!-- Botón de guardar -->
                                                <div class="col-md-12 mt-1">
                                                    <div class="form-group text-end">
                                                        <input type="hidden" name="idProducto" value="<%= producto != null ? producto.getId_producto() : ""%>">
                                                        <button type="submit" class="btn btn-secondary">Guardar Cambios</button>
                                                        <a href="svProducto" class="btn btn-light ms-2">Cancelar</a>
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