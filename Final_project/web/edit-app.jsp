<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Edit app</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet" />
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet" />
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/731/731985.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/style.css">
        <style type="text/css">
            html,
            body,
            header,
            .carousel {
                height: 60vh;
            }

            @media (max-width: 740px) {

                html,
                body,
                header,
                .carousel {
                    height: 100vh;
                }
            }

            @media (min-width: 800px) and (max-width: 850px) {

                html,
                body,
                header,
                .carousel {
                    height: 100vh;
                }
            }

            .btn-update {
                color: #fff;
                box-shadow: none;
                padding: 8px 25px;
                width: 10%;
                border: none;
                border-radius: 20px;
                background-image: linear-gradient(to right, #6ee2f5, #6454f0);
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account == null && sessionScope.accoount.isdev != 1}">
            <c:redirect url="./index"></c:redirect>
        </c:if>

        <nav
            class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar"
            >
            <div class="container">
                <!-- Brand -->
                <a class="navbar-brand waves-effect" href="index">
                    <strong class="blue-text">Store</strong>
                </a>

                <!-- Collapse -->
                <button
                    class="navbar-toggler"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Links -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link waves-effect" href="index"
                               >Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link waves-effect"
                                href="gamepage.jsp"
                                >Game</a
                            >
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link waves-effect"
                                href="apppage.jsp"
                                >App</a
                            >
                        </li>

                        <li class="nav-item">
                            <a
                                class="nav-link waves-effect"
                                href="about_us.jsp"
                                >About us</a
                            >
                        </li>

                        <c:if test="${sessionScope.account.isDev == 1}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">Developers
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="" data-toggle="modal" data-target="#upload-modal">Upload Apps</a>
                                    <!-- <div class="dropdown-divider"></div> -->
                                    <a class="dropdown-item" href="manageapp">Manager Apps</a>
                                </div>
                            </li>
                        </c:if>
                    </ul>

                    <!-- Right -->
                    <ul class="navbar-nav nav-flex-icons">
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="cart">
                                <i class="fas fa-shopping-cart"></i>
                                <span class="clearfix d-none d-sm-inline-block">Cart</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a
                                href=""
                                class="nav-link waves-effect"
                                >
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a
                                href=""
                                class="nav-link waves-effect"
                                >
                                <i class="fab fa-twitter"></i>
                            </a>
                        </li>
                        <li class="nav-item">

                            <c:if test="${sessionScope.account == null}">
                            <li class="nav-item">
                                <a href="login.jsp" class="nav-link waves-effect">
                                    Login
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hello ${sessionScope.account.username}
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="" data-toggle="modal" data-target="#change-password-modal">Change password</a>
                                    <div class="dropdown-divider"></div>
                                    <c:if test="${sessionScope.account.isAdmin != 1}">
                                        <a class="dropdown-item" href="userinfo">User Info</a>
                                    </c:if>
                                    <c:if test="${sessionScope.account.isAdmin == 1}">
                                        <a class="dropdown-item" href="admin">Admin</a>
                                    </c:if>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="" data-toggle="modal" data-target="#top-up-modal">Top up</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout">Log out</a>
                                </div>
                            </li>
                        </c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Navbar -->
        <div class="container game-page-home">
            <form action="/editapp?id=${product.id}" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="app-name">App Names</label>
                    <input type="text" name="app-name" id="app-name" class="form-control" value="${product.name}"/>
                </div>

                <div class="form-group">
                    <label class="radio-inline">
                        <input type="radio" name="category" id="app" value="app" 
                            <c:if test="${product.categories == 1}">
                                checked
                            </c:if>
                        >
                        App
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="category" id="game" value="game"
                            <c:if test="${product.categories == 0}">
                                checked
                            </c:if>
                        > Game
                    </label>
                </div>

                <div class="form-group">
                    <label for="fee">Fee</label>
                    <input type="text" name="fee" id="fee" class="form-control" value="${product.fee}"/>
                </div>

                <div class="form-group">
                    <label for="des">Description</label>
                    <textarea name="des" id="des" class="form-control">${product.description}</textarea>
                </div>

                <div class="form-group">
                    <div class="d-flex justify-content-between">
                        <div class="form-group">
                            <input name="cbicon" class="form-label font-weight-bold" type="checkbox" value="" id="checkbox-icon" onchange="changeFile()">
                            <label class="form-label font-weight-bold" for="image">Change Icon</label><br>
                            <input type="file" name="icon" id="icon-image" accept=".png, .jpg" disabled/>
                        </div>

                        <div class="form-group">
                            <input name="cbinstall" class="form-label font-weight-bold" type="checkbox" value="" id="checkbox-install" onchange="changeFile()">
                            <label class="form-label font-weight-bold" for="image">Change Install File</label><br>
                            <input type="file" name="install" id="install-file" accept=".zip, .rar" disabled/>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <input name="cbscreenshot" class="form-label font-weight-bold" type="checkbox" value="" id="checkbox-screenshot" onchange="changeFile()">
                        <label class="form-label font-weight-bold" for="image">Change Screenshot</label><br>
                        <div class="d-flex justify-content-between">
                            <input type="file" name="screenshot1" id="screenshot1" accept=".png, .jpg" disabled/>
                            <input type="file" name="screenshot2" id="screenshot2" accept=".png, .jpg" disabled/>
                            <input type="file" name="screenshot3" id="screenshot3" accept=".png, .jpg" disabled/>
                        </div>
                    </div>
                    
                </div>

                <div class="form-group">
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-update">Update</button>
                    </div>
                </div>
            </form>
        </div>




        <!--Footer-->
        <footer class="page-footer text-center font-small mt-4 wow fadeIn">
            <!--Call to action-->

            <hr class="my-4" />

            <!-- Social icons -->
            <div class="pb-4">
                <a href="https://www.facebook.com/mdbootstrap" target="_blank">
                    <i class="fab fa-facebook-f mr-3"></i>
                </a>

                <a href="https://twitter.com/MDBootstrap" target="_blank">
                    <i class="fab fa-twitter mr-3"></i>
                </a>

                <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
                    <i class="fab fa-youtube mr-3"></i>
                </a>

                <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
                    <i class="fab fa-google-plus-g mr-3"></i>
                </a>

                <a href="https://dribbble.com/mdbootstrap" target="_blank">
                    <i class="fab fa-dribbble mr-3"></i>
                </a>

                <a href="https://pinterest.com/mdbootstrap" target="_blank">
                    <i class="fab fa-pinterest mr-3"></i>
                </a>

                <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
                    <i class="fab fa-github mr-3"></i>
                </a>

                <a href="http://codepen.io/mdbootstrap/" target="_blank">
                    <i class="fab fa-codepen mr-3"></i>
                </a>
            </div>
            <!-- Social icons -->

            <!--Copyright-->
            <div class="footer-copyright py-3">
                Â© 2022 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/" target="_blank">
                    Ton Duc Thang University
                </a>
            </div>
            <!--/.Copyright-->
        </footer>
        <!--/.Footer-->

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>
            
        <script>
            function changeFile(field){
                if (document.getElementById("checkbox-icon").checked === true){
                    document.getElementById("icon-image").disabled = false;
                } else {
                    document.getElementById("icon-image").disabled = true;
                }
                
                if (document.getElementById("checkbox-install").checked === true){
                    document.getElementById("install-file").disabled = false;
                } else {
                    document.getElementById("install-file").disabled = true;
                }
                
                if (document.getElementById("checkbox-screenshot").checked === true){
                    document.getElementById("screenshot1").disabled = false;
                    document.getElementById("screenshot2").disabled = false;
                    document.getElementById("screenshot3").disabled = false;
                } else {
                    document.getElementById("screenshot1").disabled = true;
                    document.getElementById("screenshot2").disabled = true;
                    document.getElementById("screenshot3").disabled = true;
                }
            }
        </script>
        
        <!-- Modal change password -->
        <div class="modal fade" id="change-password-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Change password</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">New password:</label>
                                <input type="text" class="form-control" id="recipient-name">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">New confirm password:</label>
                                <input type="text" class="form-control" id="recipient-name">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Change</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal updload app -->
        <div class="modal fade" id="upload-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Upload app</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="/addproduct" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="font-weight-bold" for="app-name">App Names</label>
                                <input type="text" name="app-name" id="app-name" class="form-control" required />
                            </div>

                            <div class="form-group">
                                <label class="radio-inline">
                                    <input type="radio" name="category" id="app" value="app" checked required>
                                    App
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="category" id="game" value="game" required> Game
                                </label>
                            </div>

                            <div class="d-flex justify-content-between">
                                <div class="form-group">
                                    <label class="form-label font-weight-bold" for="image">Upload Icon</label><br>
                                    <input type="file" name="icon" id="image" accept=".png, .jpg" required />
                                </div>

                                <div class="form-group">
                                    <label class="form-label font-weight-bold" for="image">Upload Install File</label><br>
                                    <input type="file" name="install" id="image" accept=".zip, .rar" required />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="form-label font-weight-bold" for="image">Upload Screenshot</label><br>
                                <div class="d-flex justify-content-between">
                                    <input type="file" name="screenshot1" id="image" accept=".png, .jpg" required />
                                    <input type="file" name="screenshot2" id="image" accept=".png, .jpg" required />
                                    <input type="file" name="screenshot3" id="image" accept=".png, .jpg" required />
                                </div>
                            </div>



                            <div class="form-group">
                                <label class="font-weight-bold" for="fee">Fee</label>
                                <input type="text" name="fee" id="fee" class="form-control" required />
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold" for="des">Description</label>
                                <textarea name="des" id="des" class="form-control" required></textarea>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-modal" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary btn-modal">Upload</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>