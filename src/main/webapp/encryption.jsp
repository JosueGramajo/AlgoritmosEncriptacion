<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    <!-- Required meta tags-->
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

    <!-- Fontfaces CSS-->
    <link href="assets/css/font-face.css" rel="stylesheet" media="all">
    <link href="assets/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="assets/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="assets/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="assets/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="assets/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="assets/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="assets/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="assets/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="assets/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="assets/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="assets/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="assets/css/theme.css" rel="stylesheet" media="all">

    <!-- Jquery JS-->
    <script src="assets/vendor/jquery-3.2.1.min.js"></script>
    <script src="assets/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="assets/vendor/counter-up/jquery.counterup.min.js"></script>

</head>

<body class="animsition">
<div class="page-wrapper">

    <!-- HEADER DESKTOP-->
    <header class="header-desktop3 d-none d-lg-block">
        <div class="section__content section__content--p35">
            <div class="header3-wrap">
                <div class="header__logo">
                    <a>
                        <img src="assets/images/icon/umg.png" alt="CoolAdmin" />
                    </a>
                </div>

                <div class="header__tool">
                    <div class="account-wrap">
                        <div class="account-item account-item--style2 clearfix js-item-menu">
                            <div class="content">
                                <label style="color: white;">Josue Gramajo / 0900-16-3067</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- END HEADER DESKTOP-->

    <!-- HEADER MOBILE-->
    <header class="header-mobile header-mobile-2 d-block d-lg-none">
        <div class="header-mobile__bar">
            <div class="container-fluid">
                <div class="header-mobile-inner">
                    <a class="logo">
                        <img src="assets/images/icon/umg.png" alt="CoolAdmin" />
                    </a>
                </div>
            </div>
        </div>

    </header>
    <div class="sub-header-mobile-2 d-block d-lg-none">
        <div class="header__tool">
            <div class="account-wrap">
                <div class="account-item account-item--style2 clearfix js-item-menu">
                    <div class="content">
                        <label style="color: black;">Josue Gramajo / 0900-16-3067</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END HEADER MOBILE -->

    <!-- PAGE CONTENT-->
    <div class="page-content--bgf7">

        <br><br>

        <!-- WELCOME-->
        <section class="welcome p-t-10">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="title-4">Algoritmos de encriptación</h1>
                        <hr class="line-seprate">
                    </div>
                </div>
            </div>
        </section>
        <!-- END WELCOME-->


        <!-- DATA TABLE-->
        <section class="p-t-20">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h3 class="title-5 m-b-35">Encriptación</h3>

                        <div class="form-group">
                            <label class="form-label" for="encryption-type-select">Seleccione el tipo de encriptacion</label>
                            <select class="form-control" id="encryption-type-select">
                                <option value="-1"></option>
                                <option value="1">Cajas</option>
                                <option value="2">Matrices</option>
                            </select>
                        </div>

                        <div class="form-group" id="text-to-encrypt-div">
                            <label for="data-to-encrypt-input" class=" form-control-label">Ingrese texto a encriptar</label>
                            <input type="text" id="data-to-encrypt-input" class="form-control"/>
                        </div>
                        <script>
                            $("#text-to-encrypt-div").hide();
                        </script>

                        <div class="form-group" id="box-key">
                            <label for="box-key-input">Ingrese la clave (máximo 10 caracteres)</label>
                            <input type="text" id="box-key-input" class="form-control" maxlength="10"/>
                        </div>
                        <script>
                            $("#box-key").hide();
                        </script>

                        <div class="form-group" id="matrix-key">
                            <label>Ingrese la matriz de llave</label>
                            <br>

                            <input id="m1" type="text" name="field00" size="3" class="input-border">
                            <input id="m2" type="text" name="field01" size="3" class="input-border">
                            <input id="m3" type="text" name="field02" size="3" class="input-border">
                            <br>
                            <input id="m4" type="text" name="field10" size="3" class="input-border">
                            <input id="m5" type="text" name="field11" size="3" class="input-border">
                            <input id="m6" type="text" name="field12" size="3" class="input-border">
                            <br>
                            <input id="m7" type="text" name="field20" size="3" class="input-border">
                            <input id="m8" type="text" name="field21" size="3" class="input-border">
                            <input id="m9" type="text" name="field22" size="3" class="input-border">

                            <br><br>
                            <button id="random-key-button" class="btn btn-secondary btn-sm">Generar clave aleatoria</button>
                        </div>
                        <script>
                            $("#matrix-key").hide();
                        </script>

                        <hr>

                        <div id="button">
                            <button id="encrypt-button" class="btn btn-primary btn-lg">Encriptar</button>
                        </div>

                        <div id="loader" class="col-xs-6">
                            <svg class="spinner" width="45px" height="45px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg" style="margin-right: 5px;">
                                <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
                            </svg>
                        </div>
                        <script>
                            $("#loader").hide();
                        </script>
                    </div>
                </div>


                <div class="row" id="result-div">
                    <div class="col-md-8">
                        <br><br><hr>

                        <h3 class="title-5 m-b-35">Resultado</h3>

                        <div class="form-group">
                            <label class="form-label" for="encryption-type-select">Texto encriptado:</label>
                            <br>
                            <h4 id="encrypted-result-label"></h4>
                        </div>

                        <br>

                        <label class="form-label">Solucion</label>
                        <table class="table table-bordered" id="result-table">
                            <thead>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>

                        <br>
                        <button id="downloadFileButton" type="submit" class="btn btn-success">Exportar resultado como archivo de texto</button>

                    </div>
                </div>
                <script>
                    $("#result-div").hide();
                </script>


                <div class="row" id="matrix-result-div">
                    <div class="col-md-8">
                        <br><br><hr>

                        <h3 class="title-5 m-b-35">Resultado</h3>

                        <h5>Matriz llave</h5>
                        <table class="table table-bordered" id="key-table">
                            <tbody>
                            </tbody>
                        </table>

                        <br><br>

                        <h5>Matriz texto</h5>
                        <table class="table table-bordered" id="text-table">
                            <tbody>
                            </tbody>
                        </table>

                        <br><hr>

                        <h5>Resultado</h5>
                        <table class="table table-bordered" id="matrix-result-table">
                            <tbody>
                            </tbody>
                        </table>

                        <br>
                        <button id="matrixDownloadFileButton" type="submit" class="btn btn-success">Exportar resultado como archivo de texto</button>

                    </div>
                </div>
                <script>
                    $("#matrix-result-div").hide();
                </script>
            </div>
        </section>
        <!-- END DATA TABLE-->

        <!-- COPYRIGHT-->
        <section class="p-t-60 p-b-20">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="copyright">
                            <p>Copyright © 2020 Josue Gramajo. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END COPYRIGHT-->
    </div>

</div>

<!-- Bootstrap JS-->
<script src="assets/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="assets/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="assets/vendor/slick/slick.min.js">
</script>
<script src="assets/vendor/wow/wow.min.js"></script>
<script src="assets/vendor/animsition/animsition.min.js"></script>
<script src="assets/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
</script>

<script src="assets/vendor/circle-progress/circle-progress.min.js"></script>
<script src="assets/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="assets/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="assets/vendor/select2/select2.min.js">
</script>

<!-- Main JS-->
<script src="assets/js/main.js"></script>

<script src="assets/js/encryption-utils.js"></script>

</body>

</html>
<!-- end document-->
