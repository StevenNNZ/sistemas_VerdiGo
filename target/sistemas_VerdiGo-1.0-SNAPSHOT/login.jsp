<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<!-- Head -->
<%@ include file="./layout/head.jsp" %>
<body class="form dark">

    <!-- BEGIN LOADER -->
    <%@ include file="./layout/loader.jsp" %>
    <!--  END LOADER -->

    <div class="overlay"></div>

    <div class="auth-container d-flex">
        <div class="container mx-auto align-self-center">
            <div class="row">
                <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-8 col-12 d-flex flex-column align-self-center mx-auto">
                    <div class="card mt-3 mb-3">
                        <div class="card-body">
                            <header class="header navbar navbar-expand-sm expand-header">
                                <ul class="navbar-item flex-row ms-lg-auto ms-0">
                                    <li class="nav-item theme-toggle-item">
                                        <a href="javascript:void(0);" class="nav-link theme-toggle">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-moon dark-mode"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path></svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-sun light-mode"><circle cx="12" cy="12" r="5"></circle><line x1="12" y1="1" x2="12" y2="3"></line><line x1="12" y1="21" x2="12" y2="23"></line><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line><line x1="1" y1="12" x2="3" y2="12"></line><line x1="21" y1="12" x2="23" y2="12"></line><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line></svg>
                                        </a>
                                    </li>
                                </ul>
                            </header>
                            <form class="row g-3" action="svLogin" method="POST">
                                <div class="col-md-12 mb-3">
                                    <h2>Bienvenido a VerdiGO</h2>
                                    <p>Ingresa tu correo y contraseña</p>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Correo electrónico</label>
                                        <input type="email" id="email" name="email" class="form-control" 
                                               placeholder="nombre@ejemplo.com" 
                                               required 
                                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                               title="Ingrese un correo electrónico válido, por ejemplo: nombre@ejemplo.com">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-4">
                                        <label for="password" class="form-label">Contraseña</label>
                                        <input type="password" id="password" name="password" class="form-control"
                                               minlength="8" 
                                               maxlength="20"
                                               required 
                                               title="La contraseña debe tener entre 8 y 20 caracteres">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-4">
                                        <button class="btn btn-secondary w-100" type="submit">Ingresar</button>
                                    </div>
                                </div>
                                <div class="col-12 mt-4">
                                    <div class="">
                                        <div class="seperator">
                                            <hr>
                                            <div class="seperator-text"> <span>¿No tienes una cuenta?</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="text-center">
                                        <a href="registro.jsp" class="text-warning">Regístrate</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <p class="text-center">
            Consulta nuestra 
            <a href="javascript:void(0);" class="text-warning">política de privacidad</a> 
            y nuestros 
            <a href="javascript:void(0);" class="text-warning">términos y condiciones</a>.
        </p>
    </footer>
    
    <!-- SCRIPTS -->
    <%@ include file="./layout/scripts.jsp" %>
</body>
</html>