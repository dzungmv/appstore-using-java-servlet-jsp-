<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<c:redirect url="./index"></c:redirect>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"
            />
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet" />
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="./css/style.css"/>
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
                        <li class="nav-item active">
                            <a class="nav-link waves-effect" href="index"
                               >Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link waves-effect"
                                href="/category?category=0"
                                >Game</a
                            >
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
                                    <a class="dropdown-item" href="topup.jsp" >Top up</a>
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

        <!--Carousel Wrapper-->
        <div
            id="carousel-example-1z"
            class="carousel slide carousel-fade pt-4"
            data-ride="carousel"
            >
            <!--Indicators-->
            <ol class="carousel-indicators">
                <li
                    data-target="#carousel-example-1z"
                    data-slide-to="0"
                    class="active"
                    ></li>
                <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                <li data-target="#carousel-example-1z" data-slide-to="2"></li>
            </ol>
            <!--/.Indicators-->

            <!--Slides-->
            <div class="carousel-inner" role="listbox">
                <!--First slide-->
                <div class="carousel-item active">
                    <div
                        class="view"
                        style="
                        background-image: url('https://images3.alphacoders.com/109/thumb-1920-1099404.jpg');
                        background-repeat: no-repeat;
                        background-size: cover;
                        "
                        >
                        <!-- Mask & flexbox options-->
                        <div
                            class="rgba-black-strong d-flex justify-content-center align-items-center"
                            >
                            <!-- Content -->
                            <!-- <div class="text-center white-text mx-5 wow fadeIn">
                              <h1 class="mb-4">
                                <strong>Wellcome to Store</strong>
                              </h1>
              
                              <p>
                                <strong>Best & free guide of responsive web design</strong>
                              </p>
              
                              <p class="mb-4 d-none d-md-block">
                                <strong
                                  >The most comprehensive tutorial for the Bootstrap 4. Loved
                                  by over 500 000 users. Video and written versions available.
                                  Create your own, stunning website.</strong
                                >
                              </p>
              
                              <a
                                target="_blank"
                                href="https://mdbootstrap.com/education/bootstrap/"
                                class="btn btn-outline-white btn-lg"
                                >Start free tutorial
                                <i class="fas fa-graduation-cap ml-2"></i>
                              </a>
                            </div> -->
                            <!-- Content -->
                        </div>
                        <!-- Mask & flexbox options-->
                    </div>
                </div>
                <!--/First slide-->

                <!--Second slide-->
                <div class="carousel-item">
                    <div
                        class="view"
                        style="
                        background-image: url('https://images3.alphacoders.com/699/thumb-1920-699057.png');
                        background-repeat: no-repeat;
                        background-size: cover;
                        "
                        >
                        <!-- Mask & flexbox options-->
                        <div
                            class="rgba-black-strong d-flex justify-content-center align-items-center"
                            >
                        </div>
                        <!-- Mask & flexbox options-->
                    </div>
                </div>
                <!--/Second slide-->

                <!--Third slide-->
                <div class="carousel-item">
                    <div
                        class="view"
                        style="
                        background-image: url('https://images7.alphacoders.com/367/thumb-1920-367839.jpg');
                        background-repeat: no-repeat;
                        background-size: cover;
                        "
                        >
                        <!-- Mask & flexbox options-->
                        <div
                            class=" rgba-black-strong d-flex justify-content-center align-items-center"
                            >
                        </div>
                        <!-- Mask & flexbox options-->
                    </div>
                </div>
                <!--/Third slide-->
            </div>
            <!--/.Slides-->

            <!--Controls-->
            <a
                class="carousel-control-prev"
                href="#carousel-example-1z"
                role="button"
                data-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a
                class="carousel-control-next"
                href="#carousel-example-1z"
                role="button"
                data-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <!--/.Controls-->
        </div>
        <!--/.Carousel Wrapper-->

        <!--Main layout-->
        <main>
            <div class="container">
                <!--Navbar-->
                <nav
                    class="navbar navbar-expand-lg navbar-dark mdb-color lighten-3 mt-3 mb-5"
                    >
                    <!-- Navbar brand -->
                    <!--<span class="navbar-brand">Categories:</span>-->

                    <!-- Collapse button -->
                    <!--                    <button
                                            class="navbar-toggler"
                                            type="button"
                                            data-toggle="collapse"
                                            data-target="#basicExampleNav"
                                            aria-controls="basicExampleNav"
                                            aria-expanded="false"
                                            aria-label="Toggle navigation"
                                            >
                                            <span class="navbar-toggler-icon"></span>
                                        </button>-->

                    <!-- Collapsible content -->
                    <div class="collapse navbar-collapse" id="basicExampleNav">
                        <!-- Links -->
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#"
                                   >All
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Top Chart</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">New Releases</a>
                            </li>
                        </ul>
                        <!-- Links -->

                        <form class="form-inline" action="/search">
                            <div class="md-form my-0">
                                <input
                                    class="form-control mr-sm-2"
                                    type="text"
                                    placeholder="Search"
                                    aria-label="Search"
                                    name="txtSearch"
                                    />
                            </div>
                        </form>
                    </div>
                    <!-- Collapsible content -->
                </nav>
                <!--/.Navbar-->

                <!--Section: Products v.3-->
                <section class="text-center mb-4">
                    <!--Grid row-->
                    <div class="row wow fadeIn" id="product-content">
                        <c:forEach items="${listP}" var="o">
                            <!--Grid column-->
                            <div class="col-lg-3 col-md-6 mb-4">
                                <a href="productdetail?id=${o.id}">
                                    <!--Card-->
                                    <div class="card">
                                        <!--Card image-->
                                        <div class="view overlay">
                                            <img
                                                src="./img/icon_products/${o.id}.png"
                                                class="card-img-top img-size img-thumbnail"
                                                alt="">
                                            <div class="mask rgba-white-slight"></div>
                                        </div>
                                        <!--Card image-->

                                        <!--Card content-->
                                        <div class="card-body text-center">
                                            <!--Category & Title-->
                                            <a href="" class="grey-text">
                                                <h5>${o.dev}</h5>
                                            </a>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text"
                                                       >${o.name}
                                                        <span class="badge badge-pill danger-color"></span>
                                                    </a>
                                                </strong>
                                            </h5>

                                            <h4 class="font-weight-bold blue-text">
                                                <strong>
                                                    <c:if test="${o.fee == 0}">
                                                        Free
                                                    </c:if>
                                                    <c:if test="${o.fee != 0}">
                                                        ${o.fee}
                                                    </c:if>
                                                </strong>
                                            </h4>
                                        </div>
                                        <!--Card content-->
                                    </div>
                                    <!--Card-->
                                </a>
                            </div>
                            <!--Grid column-->
                        </c:forEach>
                    </div>
                    <!--Grid row-->
                </section>
                <!--Section: Products v.3-->

                <!--Pagination-->
                <nav class="d-flex justify-content-center wow fadeIn">
                    <ul class="pagination pg-blue">
                        <!--Arrow left-->
                        <li class="page-item ${tag == 1?"disabled":""}">
                            <a class="page-link" href="search?page=${tag-1}&txtSearch=${txtSearch}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>

                        <c:forEach begin="1" end="${numP}" var="i">
                            <li class="page-item ${tag == i?"active":""}">
                                <a class="page-link " href="search?page=${i}&txtSearch=${txtSearch}">${i}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item ${tag == numP?"disabled":""}">
                            <a class="page-link" href="search?page=${tag+1}&txtSearch=${txtSearch}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!--Pagination-->
            </div>
        </main>
        <!--Main layout-->

        <!--Footer-->
        <footer class="page-footer text-center font-small mt-4 wow fadeIn">
            <!--Call to action-->

            <hr class="my-4" />

            <!-- Social icons -->
            <div class="pb-4">
                <a href="">
                    <i class="fab fa-facebook-f mr-3"></i>
                </a>

                <a href="">
                    <i class="fab fa-twitter mr-3"></i>
                </a>

                <a href="">
                    <i class="fab fa-youtube mr-3"></i>
                </a>

                <a href="">
                    <i class="fab fa-google-plus-g mr-3"></i>
                </a>

                <a href="">
                    <i class="fab fa-dribbble mr-3"></i>
                </a>

                <a href="">
                    <i class="fab fa-pinterest mr-3"></i>
                </a>

                <a href="">
                    <i class="fab fa-github mr-3"></i>
                </a>

                <a href="">
                    <i class="fab fa-codepen mr-3"></i>
                </a>
            </div>
            <!-- Social icons -->

            <!--Copyright-->
            <div class="footer-copyright py-3">
                © 2022 Copyright:
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
        <script type="text/javascript" src="js/main.js"></script>


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
                        <form action="changepassword" onsubmit="return checkFormChangePassword()">
                            <div class="text-danger" id="error-message"></div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">New password:</label>
                                <input type="text" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">New confirm password:</label>
                                <input type="text" class="form-control" id="repassword" name="repassword" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-modal" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary btn-modal">Change</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
