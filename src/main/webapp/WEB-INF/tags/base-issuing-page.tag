<%@tag description="Base issuing page" pageEncoding="UTF-8"%>
<%@attribute name="footer" fragment="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Contap - facturar</title>

    <!-- Fontfaces CSS-->
    <link href="../assets/css/font-face.css" rel="stylesheet" media="all">
    <link href="../assets/plugins/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="../assets/plugins/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="../assets/fonts/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="../assets/plugins/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="../assets/plugins/wow/animate.css" rel="stylesheet" media="all">
    <link href="../assets/plugins/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="../assets/plugins/slick/slick.css" rel="stylesheet" media="all">
    <link href="../assets/plugins/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="../assets/plugins/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="../assets/css/theme.css" rel="stylesheet" media="all">

    <link href="../assets/css/loader.css" rel="stylesheet" media="all">

    <!-- Roboto -->
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">

    <!-- Jquery JS-->
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/jquery/jquery-ui.min.js"></script>
    <script src="../assets/plugins/jquery/jquery.number.min.js"></script>

    <link href="../assets/plugins/air-datepicker/css/datepicker.min.css" rel="stylesheet">
    <script src="../assets/plugins/air-datepicker/js/datepicker.min.js"></script>
    <script src="../assets/plugins/air-datepicker/js/i18n/datepicker.en.js"></script>
    <script src="../assets/plugins/air-datepicker/js/i18n/datepicker.es.js"></script>
</head>

<body>

<input type="hidden" id="nitJson" value="${nitJson}" />

<input type="hidden" id="currencyListJson" value="${currencyListJson}">

<input type="hidden" id="taxableUnits" value="${taxableUnits}">

<div class="page-wrapper">
    <!-- HEADER AND SIDEBAR MOBILE-->
    <header class="header-mobile d-block d-lg-none">
        <div class="header-mobile__bar">
            <div class="container-fluid">
                <div class="header-mobile-inner">
                    <a class="logo" href="index.html">
                        <img src="../assets/images/logos/logo-dark-small.png" alt="CoolAdmin" />
                    </a>
                    <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                    </button>
                </div>
            </div>
        </div>

        <nav class="navbar-mobile">
            <div class="container-fluid">
                <ul class="navbar-mobile__list list-unstyled">

                    <li>
                        <a href="/dashboard"><i class="fas fa-home"></i>Dashboard</a>
                    </li>

                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fa fa-file-text"></i>Emitir documentos</a>
                        <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                            <c:forEach var="item" items="${menuItems}">
                                <li>
                                    <a href="${item.url}">${item.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>

                    <c:if test="${role == 1}">
                        <li>
                            <a href="/loteOperador"><i class="fa fa-th" aria-hidden="true"></i>Emision por lote</a>
                        </li>
                    </c:if>
                    <c:if test="${(role == 2) || (role == 5)}">
                        <li>
                            <a href="/loteAdmin"><i class="fa fa-th" aria-hidden="true"></i>Emision por lote</a>
                        </li>
                    </c:if>

                    <li>
                        <a href="/consultarDte"><i class="fas fa-search"></i>Consultar DTE</a>
                    </li>

                    <li>
                        <a href="/anularDtePage"><i class="fas fa-ban"></i>Anular DTE</a>
                    </li>

                    <c:if test="${(role == 2) || (role == 5)}">
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fa fa-briefcase" aria-hidden="true"></i>Administración</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="/admin/usuarios">Administración de usuarios</a>
                                </li>
                                <li>
                                    <a href="/admin/productos">Administración de productos</a>
                                </li>
                                <li>
                                    <a href="/admin/clientes">Administración de clientes</a>
                                </li>
                            </ul>
                        </li>

                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fa fa-cogs" aria-hidden="true"></i>Configuraciones</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="/admin/opcionales">Opcionales</a>
                                </li>

                                <li>
                                    <a href="/admin/detalles">Detalles item</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${role == 3}">
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fa fa-moon-o"></i>Certificador</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="/user-management">Manejo de usuarios</a>
                                </li>
                                <li>
                                    <a href="/emitter-management">Manejo de emisores</a>
                                </li>
                                <li>
                                    <a href="/emitter-contract-selection">Manejo de contrato</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${(role == 4) || (role == 5)}">
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fa fa-handshake-o"></i>Usuario multiempresa</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="/multi-management">Cambiar empresa</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>

    </header>
    <!-- END HEADER MOBILE-->

    <!-- MENU SIDEBAR-->
    <aside class="menu-sidebar d-none d-lg-block">
        <div class="logo">
            <a href="#">
                <img src="../assets/images/logos/logo-dark-small.png" alt="Cool Admin" />
            </a>
        </div>
        <div class="menu-sidebar__content js-scrollbar1">
            <nav class="navbar-sidebar">
                <ul class="list-unstyled navbar__list">

                    <li class="${dashboardActive}has-sub">
                        <a href="/dashboard"><i class="fa fa-home" aria-hidden="true"></i>Dashboard</a>
                    </li>

                    <li class="${issueActive}has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fa fa-file-text"></i>Emitir documentos</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <c:forEach var="item" items="${menuItems}">
                                <li>
                                    <a href="${item.url}">${item.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>

                    <c:if test="${role == 1}">
                        <li class="${lotActive}has-sub">
                            <a href="/loteOperador"><i class="fa fa-th" aria-hidden="true"></i>Emision por lote</a>
                        </li>
                    </c:if>
                    <c:if test="${(role == 2) || (role == 5)}">
                        <li class="${lotActive}has-sub">
                            <a href="/loteAdmin"><i class="fa fa-th" aria-hidden="true"></i>Emision por lote</a>
                        </li>
                    </c:if>

                    <li class="${queryActive}has-sub">
                        <a href="/consultarDte"><i class="fas fa-search"></i>Consultar DTE</a>
                    </li>

                    <li class="${cancellationActive}has-sub">
                        <a href="/anularDtePage"><i class="fas fa-ban"></i>Anular DTE</a>
                    </li>

                    <c:if test="${(role == 2) || (role == 5)}">
                        <li class="${adminActive}has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fa fa-briefcase"></i>Administración</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="/admin/usuarios">Administración de usuarios</a>
                                </li>
                                <li>
                                    <a href="/admin/productos">Administración de productos</a>
                                </li>
                                <li>
                                    <a href="/admin/clientes">Administración de clientes</a>
                                </li>
                            </ul>
                        </li>


                        <li class="${configActive}has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fa fa-cogs"></i>Configuraciones</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="/admin/opcionales">Opcionales</a>
                                </li>
                                <li>
                                    <a href="/admin/detalles">Detalles item</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${role == 3}">
                        <li class="${certifierActive}has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fa fa-moon-o"></i>Certificador</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="/user-management">Manejo de usuarios</a>
                                </li>
                                <li>
                                    <a href="/emitter-management">Manejo de emisores</a>
                                </li>
                                <li>
                                    <a href="/emitter-contract-selection">Manejo de contrato</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${(role == 4) || (role == 5)}">
                        <li class="${multiActive}has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fa fa-handshake-o"></i>Usuario multiempresa</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="/multi-management">Cambiar empresa</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </aside>
    <!-- END MENU SIDEBAR-->

    <!-- PAGE CONTAINER-->
    <div class="page-container">
        <!-- HEADER DESKTOP-->
        <header class="header-desktop">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="header-wrap">
                        <form class="form-header" action="" method="POST">
                            <!--<input class="au-input au-input--xl" type="text" name="search" placeholder="Buscar..." />
                            <button class="au-btn--submit" type="submit">
                                <i class="zmdi zmdi-search"></i>
                            </button>-->

                            <p><strong>Emisor actual:</strong> ${emitterNIT} - ${emitterName}</p>
                        </form>

                        <div class="header-button">

                            <!--
                            <div class="noti-wrap">
                                <div class="noti__item js-item-menu">
                                    <i class="zmdi zmdi-notifications"></i>
                                    <span class="quantity">3</span>
                                    <div class="notifi-dropdown js-dropdown">
                                        <div class="notifi__title">
                                            <p>You have 3 Notifications</p>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c1 img-cir img-40">
                                                <i class="zmdi zmdi-email-open"></i>
                                            </div>
                                            <div class="content">
                                                <p>You got a email notification</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c2 img-cir img-40">
                                                <i class="zmdi zmdi-account-box"></i>
                                            </div>
                                            <div class="content">
                                                <p>Your account has been blocked</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c3 img-cir img-40">
                                                <i class="zmdi zmdi-file-text"></i>
                                            </div>
                                            <div class="content">
                                                <p>You got a new file</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__footer">
                                            <a href="#">All notifications</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            -->


                            <div class="account-wrap">
                                <div class="account-item clearfix js-item-menu">
                                    <div class="image">
                                        <img src="../assets/images/profile/${avatarPicture}" alt="${userName}" />
                                    </div>
                                    <div class="content">
                                        <a class="js-acc-btn" href="#">${userName}</a>
                                    </div>
                                    <div class="account-dropdown js-dropdown">
                                        <div class="info clearfix">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="../assets/images/profile/${avatarPicture}" alt="${userName}" />
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h5 class="name">
                                                    <a href="#">${userName}</a>
                                                </h5>
                                                <span class="email">${userEmail}</span>
                                            </div>
                                        </div>

                                        <!--
                                        <div class="account-dropdown__body">
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-account"></i>Account</a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-settings"></i>Setting</a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-money-box"></i>Billing</a>
                                            </div>
                                        </div>
                                        -->

                                        <div class="account-dropdown__footer">
                                            <a href="/logout"><i class="zmdi zmdi-power"></i>Cerrar sesión</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- HEADER DESKTOP-->

        <!-- MAIN CONTENT-->
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <jsp:doBody/>
                            </div> <!-- .card -->
                        </div><!--/.col-->
                        <div id="pagefooter" class="col-12">
                            <jsp:invoke fragment="footer"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="copyright">
                                <hr>
                                <h6>Contacto de soporte:</h6>
                                <p><i class="fa fa-phone" aria-hidden="true"></i>  PBX: 2507-9000</p>
                                <p><i class="fa fa-envelope" aria-hidden="true"></i>  Email: soporte@facturas.gt</p>
                                <br>
                                <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT-->
        <!-- END PAGE CONTAINER-->
    </div>

</div>

<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Error</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label id="lblBody"></label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLongTitle">Informacion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label id="lblBodySuccess"></label>
            </div>
            <div class="modal-footer">
                <button id="success-modal-accept" type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="itemDetailsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detalles item linea X</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <c:set var="contains1" value="false" />
                        <c:forEach var="item" items="${details}">
                            <c:if test="${item.number eq 1}">
                                <c:set var="contains1" value="true" />
                                <label for="item-detail-1" class="col-form-label">${item.label}</label>
                            </c:if>
                        </c:forEach>

                        <c:if test="${contains1 eq false}">
                            <label for="item-detail-1" class="col-form-label">Detalle 1:</label>
                        </c:if>

                        <input type="text" class="form-control" id="item-detail-1">
                    </div>
                    <div class="form-group">
                        <c:set var="contains1" value="false" />
                        <c:forEach var="item" items="${details}">
                            <c:if test="${item.number eq 2}">
                                <c:set var="contains1" value="true" />
                                <label for="item-detail-2" class="col-form-label">${item.label}</label>
                            </c:if>
                        </c:forEach>

                        <c:if test="${contains1 eq false}">
                            <label for="item-detail-2" class="col-form-label">Detalle 2:</label>
                        </c:if>

                        <input type="text" class="form-control" id="item-detail-2">
                    </div>
                    <div class="form-group">
                        <c:set var="contains1" value="false" />
                        <c:forEach var="item" items="${details}">
                            <c:if test="${item.number eq 3}">
                                <c:set var="contains1" value="true" />
                                <label for="item-detail-3" class="col-form-label">${item.label}</label>
                            </c:if>
                        </c:forEach>

                        <c:if test="${contains1 eq false}">
                            <label for="item-detail-3" class="col-form-label">Detalle 3:</label>
                        </c:if>

                        <input type="text" class="form-control" id="item-detail-3">
                    </div>
                    <div class="form-group">
                        <c:set var="contains1" value="false" />
                        <c:forEach var="item" items="${details}">
                            <c:if test="${item.number eq 4}">
                                <c:set var="contains1" value="true" />
                                <label for="item-detail-4" class="col-form-label">${item.label}</label>
                            </c:if>
                        </c:forEach>

                        <c:if test="${contains1 eq false}">
                            <label for="item-detail-4" class="col-form-label">Detalle 4:</label>
                        </c:if>
                        <input type="text" class="form-control" id="item-detail-4">
                    </div>
                    <div class="form-group">
                        <c:set var="contains1" value="false" />
                        <c:forEach var="item" items="${details}">
                            <c:if test="${item.number eq 5}">
                                <c:set var="contains1" value="true" />
                                <label for="item-detail-5" class="col-form-label">${item.label}</label>
                            </c:if>
                        </c:forEach>

                        <c:if test="${contains1 eq false}">
                            <label for="item-detail-5" class="col-form-label">Detalle 5:</label>
                        </c:if>
                        <input type="text" class="form-control" id="item-detail-5">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button id="save-details-button" type="button" class="btn btn-primary">Guardar</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="taxModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar impuesto</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="tax-calculation">
                    <div class="form-group">
                        <label for="tax-select" class="col-form-label">Seleccione impuesto:</label>
                        <select name="select" id="tax-select" class="form-control">
                            <option value=""></option>
                            <option value="IVA_EXENTO">Producto exento de IVA</option>
                            <option value="PETROLEO">Petróleo</option>
                            <option value="TURISMO HOSPEDAJE">Turismo hospedaje</option>
                            <option value="TURISMO PASAJES">Turismo pasajes</option>
                            <option value="BOMBEROS">Bomberos</option>
                            <option value="TIMBRE DE PRENSA">Timbre de prensa</option>
                            <option value="TASA MUNICIPAL">Tasa municipal</option>
                            <option value="BEBIDAS ALCOHOLICAS">Bebidas alcohólicas</option>
                            <option value="TABACO">Tabaco</option>
                            <option value="CEMENTO">Cemento</option>
                            <option value="BEBIDAS NO ALCOHOLICAS">Bebidas no alcohólicas</option>
                            <option value="TARIFA PORTUARIA">Tarifa portuaria</option>
                        </select>
                    </div>

                    <div id="oil_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="tax-select" class="col-form-label">Unidad gravable:</label>
                                <select name="select" id="oil-tax-select" class="form-control">
                                    <option value="1">Gasolina superior Q4.70</option>
                                    <option value="2">Gasolina regular Q4.60</option>
                                    <option value="3">Gasolina de aviación Q4.70</option>
                                    <option value="4">Diésel Q1.30</option>
                                    <option value="5">Gas Oil Q1.30</option>
                                    <option value="6">Kerosina avjet turbo fuel Q0.50</option>
                                    <option value="7">Nafta Q0.50</option>
                                    <option value="8">Fuel Oil (Bunker C) Q0.00</option>
                                    <option value="9">Gas licuado granel Q0.50</option>
                                    <option value="10">Gas licuado carburación Q0.50</option>
                                    <option value="11">Petróleo crudo combustible Q0.00</option>
                                    <option value="12">Otros combustibles Q0.00</option>
                                    <option value="13">Asfaltos Q0.00</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="oilAmount" class="col-form-label">Cantidad:</label>
                                <input id="oilAmount" class="form-control" type="number" value="0" min="0" step="any" />
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#oil_options").hide();
                    </script>


                    <div id="host_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="tax-select" class="col-form-label">Unidad gravable:</label>
                                <select name="select" id="host-tax-select" class="form-control">
                                    <option value="1">Hospedaje 10.00%</option>
                                    <option value="2">Hospedaje Exento 0%</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#host_options").hide();
                    </script>

                    <div id="passage_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="tax-select" class="col-form-label">Unidad gravable:</label>
                                <select name="select" id="passage-tax-select" class="form-control">
                                    <option value="1">Salida vía aérea USD30.00</option>
                                    <option value="2">Salida vía marítima USD10.00</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="passageAmount" class="col-form-label">Cantidad:</label>
                                <input id="passageAmount" class="form-control" type="number" value="0" min="0" step="any" />
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#passage_options").hide();
                    </script>

                    <div id="factor_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label id="factorLbl" class="col-form-label">Factor: %</label>
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#factor_options").hide();
                    </script>

                    <div id="town_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="townCode" class="col-form-label">Código unidad gravable:</label>
                                <input id="townCode" class="form-control" type="number" value="0" min="0" step="1" />
                            </div>
                            <div class="col">
                                <label for="townAmount" class="col-form-label">Monto impuesto:</label>
                                <input id="townAmount" class="form-control" type="number" value="0" min="0" step="any" />
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#town_options").hide();
                    </script>

                    <div id="alcoholic_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="alcoholic-tax-select" class="col-form-label">Unidad gravable:</label>
                                <select name="select" id="alcoholic-tax-select" class="form-control">
                                    <option value="1">Cervezas y otras bebidas 6.00%</option>
                                    <option value="2">Vinos 7.50%</option>
                                    <option value="3">Vino espumoso 7.50%</option>
                                    <option value="4">Vino vermouth 7.50%</option>
                                    <option value="5">Sidras 7.50%</option>
                                    <option value="6">Bebidas alcohólicas destiladas 8.50%</option>
                                    <option value="7">Bebidas alcohólicas mezcladas 7.50%</option>
                                    <option value="8">Otras bebidas fermentadas 7.50%</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="alcoholicAmount" class="col-form-label">Cantidad:</label>
                                <input id="alcoholicAmount" class="form-control" type="number" value="0" min="0" step="any" />
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#alcoholic_options").hide();
                    </script>

                    <div id="tobacco_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="tobacco-tax-select" class="col-form-label">Unidad gravable:</label>
                                <select name="select" id="tobacco-tax-select" class="form-control">
                                    <option value="1">Precio de fábrica por 100%</option>
                                    <option value="2">Precio sugerido al consumidor por 75%</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="tobaccoAmount" class="col-form-label">Cantidad:</label>
                                <input id="tobaccoAmount" class="form-control" type="number" value="0" min="0" step="any" />
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#tobacco_options").hide();
                    </script>

                    <div id="concrete_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="concrete-tax-select" class="col-form-label">Unidad gravable:</label>
                                <select name="select" id="concrete-tax-select" class="form-control">
                                    <option value="1">Bolsa de 42.5 kgs Q1.50</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="concreteAmount" class="col-form-label">Cantidad:</label>
                                <input id="concreteAmount" class="form-control" type="number" value="0" min="0" step="any" />
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#concrete_options").hide();
                    </script>

                    <div id="non_alcoholic_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="non-alcoholic-tax-select" class="col-form-label">Unidad gravable:</label>
                                <select name="select" id="non-alcoholic-tax-select" class="form-control">
                                    <option value="1">Bebidas gaseosas y jarabes Q0.18</option>
                                    <option value="2">Bebidas isotónicas o deportivas Q0.12</option>
                                    <option value="3">Jugos y néctares Q0.10</option>
                                    <option value="4">Bebidas de yogur Q0.10</option>
                                    <option value="5">Agua natural envasada Q0.08</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="nonAlcoholicAmount" class="col-form-label">Cantidad:</label>
                                <input id="nonAlcoholicAmount" class="form-control" type="number" value="0" min="0" step="any" />
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#non_alcoholic_options").hide();
                    </script>

                    <div id="port_fee_options" class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="port-fee-tax-select" class="col-form-label">Unidad gravable:</label>
                                <select name="select" id="port-fee-tax-select" class="form-control">
                                    <option value="1">Tarifa Portuaria $0.05</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="portFeeAmount" class="col-form-label">Cantidad:</label>
                                <input id="portFeeAmount" class="form-control" type="number" value="0" min="0" step="any" />
                            </div>
                        </div>
                    </div>
                    <script>
                        $("#port_fee_options").hide();
                    </script>

                    <div class="modal-footer">
                        <button id="add-tax" type="button" class="btn btn-primary">Agregar impuesto</button>
                    </div>
                </div>

                <div id="calculated-tax" class="form-group">
                    <label id="calculated-tax-type">Tipo impuesto: %</label><br>
                    <label id="calculated-tax-factor">Factor: %</label><br>
                    <label id="calculated-tax-name">Nombre: %</label><br>
                    <label id="calculated-tax-amount">Cantidad: %</label><br>
                    <label id="calculated-tax-total">Total: %</label><br><br>

                    <button id="remove-tax" type="button" class="btn btn-danger">Quitar impuesto</button>
                </div>
                <script>
                    $("#calculated-tax").hide();
                </script>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="emailModalLabel">Envio correo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Dirección de correo electrónico:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="email-cc-type-select" class="col-form-label">Tipo de copia del correo:</label>
                        <select name="select" id="email-cc-type-select" class="form-control">
                            <option value="1">Copia normal</option>
                            <option value="2">Copia oculta</option>
                        </select>
                    </div>
                    <div id="cc-div" class="form-group">
                        <label for="cc-recipient-name" class="col-form-label">CC:</label>
                        <input type="text" class="form-control" id="cc-recipient-name">
                    </div>
                    <div id="cco-div" class="form-group">
                        <label for="cco-recipient-name" class="col-form-label">CCO:</label>
                        <input type="text" class="form-control" id="cco-recipient-name">
                    </div>
                    <script>
                        $("#cco-div").hide();
                    </script>
                </form>
            </div>
            <div class="modal-footer" id="email-send-options">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button id="send-email-button" type="button" class="btn btn-primary">Enviar</button>
            </div>
            <div class="modal-footer" id="email-loader">
                <svg class="spinner" width="45px" height="45px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg" style="margin-right: 5px;">
                    <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
                </svg>
            </div>
            <script>
                $("#email-loader").hide();
            </script>
        </div>
    </div>
</div>

<div id="clientSelectionModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Ingrese alguno de los siguientes campos para realizar la busqueda:</label>
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">NIT:</label>
                        <input type="text" class="form-control" id="client-nit">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="client-name">
                    </div>
                    <div class="form-group">
                        <label for="cc-recipient-name" class="col-form-label">Codigo:</label>
                        <input type="text" class="form-control" id="client-code">
                    </div>
                    <div class="col-4">
                        <button id="search-client-button" type="button" class="btn btn-success">Buscar</button>
                    </div>

                    <table class="table">
                        <thead>
                        <tr>
                            <th>NIT</th>
                            <th>Nombre</th>
                            <th>Codigo</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>9577199-9</td>
                            <td>Josue Gramajo</td>
                            <td>C001</td>
                            <td><button class="btn btn-primary">Seleccionar</button></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer" id="options">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
            <div class="modal-footer" id="client-loader">
                <svg class="spinner" width="45px" height="45px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg" style="margin-right: 5px;">
                    <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
                </svg>
            </div>
            <script>
                $("#client-loader").hide();
            </script>
        </div>
    </div>
</div>

<!-- Bootstrap JS-->
<script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
<script src="../assets/plugins/moment/moment.js"></script>
<script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="../assets/plugins/slick/slick.min.js">
</script>
<script src="../assets/plugins/wow/wow.min.js"></script>
<script src="../assets/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<script src="../assets/plugins/counter-up/jquery.waypoints.min.js"></script>
<script src="../assets/plugins/counter-up/jquery.counterup.min.js">
</script>
<script src="../assets/plugins/circle-progress/circle-progress.min.js"></script>
<script src="../assets/plugins/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="../assets/plugins/chartjs/Chart.bundle.min.js"></script>
<script src="../assets/plugins/select2/select2.min.js"></script>

<!-- Main JS-->
<script src="../assets/js/cool-admin.js"></script>

</body>

</html>
<!-- end document-->
