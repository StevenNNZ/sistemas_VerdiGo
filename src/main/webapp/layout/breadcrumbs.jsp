<%-- 
    Document   : breadcrumbs
    Created on : 9/03/2025, 10:27:55 p. m.
    Author     : estiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  BEGIN BREADCRUMBS  -->
<div class="secondary-nav">
    <div class="breadcrumbs-container" data-page-heading="Analytics">
        <header class="header navbar navbar-expand-sm">
            <a href="javascript:void(0);" class="btn-toggle sidebarCollapse" data-placement="bottom">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
            </a>
            <div class="d-flex breadcrumb-content">
                <div class="page-header">

                    <div class="page-title">
                    </div>

                    <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">VerdiGo</a></li>
                            <%
                                // Obtener la URI completa (ejemplo: "/clinica_Odontologica/listadoUsuarios.jsp")
                                String uri = request.getRequestURI();

                                // Extraer solo el nombre del archivo (listadoUsuarios.jsp)
                                String pageName = uri.substring(uri.lastIndexOf("/") + 1);

                                // Eliminar la extensión ".jsp" si la tiene
                                if (pageName.endsWith(".jsp")) {
                                    pageName = pageName.replace(".jsp", "");
                                }
                            %>

                            <li class="breadcrumb-item active" aria-current="page"><%= pageName %></li>
                        </ol>
                    </nav>

                </div>
            </div>
        </header>
    </div>
</div>
<!--  END BREADCRUMBS  -->    
