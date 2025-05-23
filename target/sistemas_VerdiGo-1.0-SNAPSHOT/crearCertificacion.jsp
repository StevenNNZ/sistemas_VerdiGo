<%-- 
    Document   : crearCertificacion
    Created on : 22/05/2025, 11:18:03 a. m.
    Author     : estiv
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> <html lang="es"> 
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
                    <div class="col-xl-12 col-lg-12 layout-spacing">
                        <div class="widget-content widget-content-area br-8">
                            <div class="middle-content container-xxl p-0">
                                <%@ include file="./layout/breadcrumbs.jsp" %>

                                <form class="section general-info p-3" action="svCertificacion" method="POST">
                                    <div class="info">
                                        <h6 class="fs-3 mb-3">Registrar nueva certificación</h6>
                                        <div class="form">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="nombre">Nombre</label>
                                                        <input type="text" class="form-control mb-3" id="nombre" name="nombre"
                                                               placeholder="Nombre de la certificación" required minlength="2" maxlength="50" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 text-end">
                                                    <button type="submit" class="btn btn-secondary">Guardar</button>
                                                    <a href="svCertificacion" class="btn btn-light ms-2">Cancelar</a>
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

        </div> <%@ include file="./layout/scripts.jsp" %> </body> </html>