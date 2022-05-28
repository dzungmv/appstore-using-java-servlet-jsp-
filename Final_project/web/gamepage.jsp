<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Game page</title>
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
        </style>
    </head>

    <body>
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
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="index"
                               >Home
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a
                                class="nav-link waves-effect"
                                href="/category?category=0"
                                >Game</a
                            ><span class="sr-only">(current)</span>
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link waves-effect"
                                href="/category?category=1"
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
                                    <a class="dropdown-item" href="topup.jsp" >Deposit</a>
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

            <section class="text-center mb-4">
                <!--Grid row-->
                <div class="d-flex justify-content-between">
                    <h4 class="">All games</h4>
                    <a href="productcollection?category=0&collection=1" class="btn btn-see-more">See more</a>
                </div>
                <div class="row wow fadeIn">
                    <!--Grid column-->
                    
                    <c:forEach begin="0" end="3" var="i">
                        <a href="productdetail?id=${product[i].id}">
                            <div class="col-lg-3 col-md-6 mb-4">
                                <!--Card-->
                                <div class="card">
                                    <!--Card image-->
                                    <div class="view overlay">
                                        <img src="img/icon_products/${product[i].id}.png"
                                             class="card-img-top img-thumbnail" alt="" />
                                        <div class="mask rgba-white-slight"></div>
                                    </div>
                                    <!--Card image-->

                                    <!--Card content-->
                                    <div class="card-body text-center">
                                        <!--Category & Title-->
                                        <a href="" class="grey-text">
                                            <h5>${product[i].dev}</h5>
                                        </a>
                                        <h5>
                                            <strong>
                                                <a href="" class="dark-grey-text">${product[i].name}
                                                    <span class="badge badge-pill danger-color"></span>
                                                </a>
                                            </strong>
                                        </h5>

                                        <h4 class="font-weight-bold blue-text">
                                            <strong>
                                                <c:if test="${product[i].fee == 0}">
                                                    Free
                                                </c:if>

                                                <c:if test="${product[i].fee > 0}">
                                                    ${product[i].fee}
                                                </c:if></strong>

                                        </h4>        
                                        <c:forEach begin="1" end="5" var="j">
                                            <span class="fa fa-star
                                                <c:if test="${j <= product[i].rate}">
                                                    checked
                                                </c:if>
                                            "></span>
                                        </c:forEach>
                                    </div>

                                    <!--Card content-->
                                </div>
                                <!--Card-->
                            </div>
                        </a>
                    </c:forEach>
                </div>
                <!--Grid row-->

                <div class="d-flex justify-content-between">
                    <h4 class="">New release</h4>
                    <a href="productcollection?category=0&collection=2" class="btn btn-see-more">See more</a>
                </div>
                <!--Grid row-->
                <div class="row wow fadeIn">
                    <!--Grid column-->
                    <c:forEach begin="0" end="3" var="i">
                        <a href="productdetail?id=${newrelease[i].id}">
                            <div class="col-lg-3 col-md-6 mb-4">
                                <!--Card-->
                                <div class="card">
                                    <!--Card image-->
                                    <div class="view overlay">
                                        <img src="img/icon_products/${newrelease[i].id}.png"
                                             class="card-img-top img-thumbnail" alt="" />
                                        <div class="mask rgba-white-slight"></div>
                                    </div>
                                    <!--Card image-->

                                    <!--Card content-->
                                    <div class="card-body text-center">
                                        <!--Category & Title-->
                                        <a href="" class="grey-text">
                                            <h5>${newrelease[i].dev}</h5>
                                        </a>
                                        <h5>
                                            <strong>
                                                <a href="" class="dark-grey-text">${newrelease[i].name}
                                                    <span class="badge badge-pill danger-color"></span>
                                                </a>
                                            </strong>
                                        </h5>

                                        <h4 class="font-weight-bold blue-text">
                                            <strong>
                                                <c:if test="${newrelease[i].fee == 0}">
                                                    Free
                                                </c:if>

                                                <c:if test="${newrelease[i].fee > 0}">
                                                    ${newrelease[i].fee}
                                                </c:if></strong>

                                        </h4>        
                                        <c:forEach begin="1" end="5" var="j">
                                            <span class="fa fa-star
                                                <c:if test="${j <= newrelease[i].rate}">
                                                    checked
                                                </c:if>
                                            "></span>
                                        </c:forEach>
                                    </div>

                                    <!--Card content-->
                                </div>
                                <!--Card-->
                            </div>
                        </a>
                    </c:forEach>
                    <!--Grid column-->
                </div>
                <!--Grid row-->


                <div class="d-flex justify-content-between">
                    <h4 class="">Top download</h4>
                    <a href="productcollection?category=0&collection=3" class="btn btn-see-more">See more</a>
                </div>
                <div class="row wow fadeIn">
                    <!--Grid column-->
                    <c:forEach begin="0" end="3" var="i">
                        <a href="productdetail?id=${topdownload[i].id}">
                            <div class="col-lg-3 col-md-6 mb-4">
                                <!--Card-->
                                <div class="card">
                                    <!--Card image-->
                                    <div class="view overlay">
                                        <img src="img/icon_products/${topdownload[i].id}.png"
                                             class="card-img-top img-thumbnail" alt="" />
                                        <div class="mask rgba-white-slight"></div>
                                    </div>
                                    <!--Card image-->

                                    <!--Card content-->
                                    <div class="card-body text-center">
                                        <!--Category & Title-->
                                        <a href="" class="grey-text">
                                            <h5>${topdownload[i].dev}</h5>
                                        </a>
                                        <h5>
                                            <strong>
                                                <a href="" class="dark-grey-text">${topdownload[i].name}
                                                    <span class="badge badge-pill danger-color"></span>
                                                </a>
                                            </strong>
                                        </h5>

                                        <h4 class="font-weight-bold blue-text">
                                            <strong>
                                                <c:if test="${topdownload[i].fee == 0}">
                                                    Free
                                                </c:if>

                                                <c:if test="${topdownload[i].fee > 0}">
                                                    ${topdownload[i].fee}
                                                </c:if></strong>

                                        </h4>        
                                        <c:forEach begin="1" end="5" var="j">
                                            <span class="fa fa-star
                                                <c:if test="${j <= topdownload[i].rate}">
                                                    checked
                                                </c:if>
                                            "></span>
                                        </c:forEach>
                                    </div>

                                    <!--Card content-->
                                </div>
                                <!--Card-->
                            </div>
                        </a>
                    </c:forEach>
                    <!--Grid column-->
                </div>
            </section>
        </div>

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



        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
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