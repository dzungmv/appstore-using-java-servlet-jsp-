<%@page import="Model.Product"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*"%>

<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Product product = (Product) request.getAttribute("productDetail");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Product</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet" />
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet" />

        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/731/731985.png" type="image/x-icon">
        <link rel="stylesheet" href="css/style.css" />


    </head>

    <body>
        <c:if test="${productDetail.isApproved == 0}">
            <c:if test="${sessionScope.account.isAdmin != 1 && sessionScope.account.isDev != 1}">
                <c:redirect url="./index"></c:redirect>
            </c:if>
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

        <!--Main layout-->
        <main class="mt-5 pt-4">
            <div class="container dark-grey-text mt-5">
                <!--Grid row-->
                <div class="row wow fadeIn">
                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <img src="img/icon_products/${productDetail.id}.png" class="img-fluid" alt="" />
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <!--Content-->
                        <div class="p-4">
                            <!-- <div class="mb-3">
                                <a href="">
                                  <span class="badge purple mr-1">Category 2</span>
                                </a>
                                <a href="">
                                  <span class="badge blue mr-1">New</span>
                                </a>
                                <a href="">
                                  <span class="badge red mr-1">Bestseller</span>
                                </a>
                              </div> -->

                            <p class="lead">

                            <div class="d-flex justify-content-between">
                                <span>
                                    <c:if test="${productDetail.fee == 0}">
                                        Free
                                    </c:if>

                                    <c:if test="${productDetail.fee > 0}">
                                        ${productDetail.fee}
                                    </c:if>
                                </span>

                                <c:if test="${isWishlist == 0}">
                                    <div id="wishlist">
                                        <a onclick="WishlistHandling(${productDetail.id}, 0, ${sessionScope.account.id})" style="color:rgb(103, 157, 55);">
                                            <i class="far fa-bookmark"></i> &nbsp Add to wishlist</a>
                                    </div>
                                </c:if>

                                <c:if test="${isWishlist == 1}">
                                    <div id="wishlist">
                                        <a id="wishlist" onclick="WishlistHandling(${productDetail.id}, 1, ${sessionScope.account.id})" style="color:rgb(103, 157, 55);">
                                            <i class="fa fa-bookmark"></i> &nbsp Remove to wishlist</a>                                       
                                    </div>

                                </c:if>

                            </div>
                            </p>

                            <div class="d-flex justify-content-between">

                                <p class="lead font-weight-bold">${productDetail.name}</p>
                                <div>
                                    <c:forEach begin="1" end="5" var="i">
                                        <span class="fa fa-star
                                              <c:if test="${i <= productDetail.rate}">
                                                  checked
                                              </c:if>
                                              "></span>
                                    </c:forEach>

                                    <p>${productDetail.downloadCount} &nbsp;<i class="fas fa-users"></i></p>
                                </div>

                            </div>

                            <p>
                                ${productDetail.description}
                            </p>
                            <c:if test="${productDetail.fee == 0 || ispurchase == 1}">
                                <a href="download?idP=${productDetail.id}&idU=${sessionScope.account.id}">
                                    <button class="btn btn-primary btn-md my-0 p"
                                            style="text-transform: none; background-color: rgb(103, 157, 55) !important;">
                                        Download
                                    </button>
                                </a>
                            </c:if>

                            <div id="cart">
                                <c:if test="${productDetail.fee > 0 && ispurchase == 0}">
                                    <c:if test="${isCart == 0}">
                                        <a onclick="CartHandling(${productDetail.id}, 0, ${sessionScope.account.id})">
                                            <button class="btn btn-md my-0 p" style="text-transform: none"> <i class="fas fa-cart-plus"></i>Add to
                                                cart</button>
                                        </a>
                                    </c:if>
                                    <c:if test="${isCart == 1}">
                                        <a onclick="CartHandling(${productDetail.id}, 1, ${sessionScope.account.id})">
                                            <button class="btn btn-md my-0 p" style="text-transform: none"> <i class="fas fa-cart-plus"></i>Remove to
                                                cart</button>
                                        </a>
                                    </c:if>
                                </c:if>
                            </div>

                        </div>
                        <!--Content-->
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->

                <hr />

                <!--Grid row-->
                <div class="row wow fadeIn">
                    <!--Grid column-->
                    <c:forEach begin="1" end="3" var="i">
                        <div class="col-lg-4 col-md-12 mb-4">
                            <img src="img/Screenshot/${productDetail.id}_${i}.png" class="img-fluid" alt="" />
                        </div>
                    </c:forEach>
                    <!--Grid column-->
                </div>

                <div class="row d-flex justify-content-center wow fadeIn">
                    <!--Grid column-->
                    <div class="col-md-6 text-center">
                        <h4 class="my-4 h4">Additional information</h4>

                        <div>
                            <c:if test="${productDetail.categories == 0}">
                                <p>Game</p>
                            </c:if>
                            <c:if test="${productDetail.categories == 1}">
                                <p>Apps</p>
                            </c:if>

                            <p>${productDetail.dev}</p>
                            <p>Size: ${productDetail.size} MB</p>
                            <% out.print("<p>Release: "+sdf.format(product.getRelease())); %>
                        </div>
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->
            </div>
        </main>
        <!--Main layout-->
        <hr width="50%" align="center" />

        <div class="d-flex justify-content-center row">

            <div class="col-md-8">
                <h4>Review</h4>
                <div class="d-flex flex-column comment-section">
                    <c:forEach items="${rateList}" var="o">
                        <div class="bg-white p-2">
                            <div class="d-flex flex-row user-info"><img class="rounded-circle"
                                                                        src="https://yt3.ggpht.com/ytc/AKedOLQf5MBcFSDzo2FeZIXSqafCvdRMGjW2C-0j8RpD=s900-c-k-c0x00ffffff-no-rj"
                                                                        width="40">
                                <div class="d-flex flex-column justify-content-start ml-2"><span
                                        class="d-block font-weight-bold name">Anonymous</span><span class="date text-black-50">
                                        <c:forEach begin="1" end="5" var="i">
                                            <span class="fa fa-star
                                                  <c:if test="${i <= o.rating}">
                                                      checked
                                                  </c:if>
                                                  "></span>
                                        </c:forEach>
                                    </span></div>
                            </div>
                            <div class="mt-2">
                                <p class="comment-text">${o.comment}</p>
                            </div>
                        </div>
                    </c:forEach>
                    <form method="POST" action="./postcomment?id=${productDetail.id}">
                        <div class="bg p-2">
                            <div class="flex-row align-items-start">

                                <div class="d-flex flex-column justify-content-start ml-2">
                                    <span class="d-block font-weight-bold name">
                                        <textarea placeholder="Write your comment..." required class="form-control ml-1 shadow-none textarea" name="comment"></textarea>
                                    </span>
                                    <span class="star-rating star-5">
                                        <input type="radio" name="rating" value="1" required><i></i>
                                        <input type="radio" name="rating" value="2"><i></i>
                                        <input type="radio" name="rating" value="3"><i></i>
                                        <input type="radio" name="rating" value="4"><i></i>
                                        <input type="radio" name="rating" value="5"><i></i>
                                    </span>

                                </div>

                            </div>

                            <div class="mt-2 text-right"><button class="btn btn-primary btn-sm shadow-none" type="submit">Post
                                    comment</button></div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!--More Similar-->
        <div class="container mt-2">
            <div class="d-flex justify-content-center row ">
                <h4>
                    More similar
                </h4>

                <section class="text-center mb-4">
                    <!--Grid row-->
                    <div class="row wow fadeIn">
                        <!--Grid column-->
                        <c:forEach items="${similars}" var="o">
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
                </section>
            </div>
        </div>

        <!--Footer-->
        <footer class="page-footer text-center font-small mt-4 wow fadeIn">

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
                © 2019 Copyright:
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
//            $('.rate').one('click', function () {
//            var $this = $(this);
//            $this.addClass('rate checked').siblings().removeClass('rate checked');
//            $this.prevAll().removeClass('rate').addClass("rate checked");
//            });

            function WishlistHandling(idP, flag, idU) {
                if (!idU) {
                    window.location.href = "login.jsp"
                }
                if (flag === 0) {
                    handlingByAjax(idP, "/addwishlist", 1);
                } else {
                    handlingByAjax(idP, "/removewishlist", 1);
                }
            }

            function CartHandling(idP, flag, idU) {
                if (!idU) {
                    window.location.href = "login.jsp"
                }
                if (flag === 0) {
                    handlingByAjax(idP, "/addcart", 1);
                } else {
                    handlingByAjax(idP, "/removecart", 1);
                }
            }

            function handlingByAjax(idP, url, flag) {
                $.ajax({
                    url: url,
                    type: "get",
                    data: {
                        idProduct: idP,
                        flag: flag,
                    },
                    success: function (data) {
                        if (url === "/addwishlist") {
                            alert('Add to wishlist successful');
                            document.getElementById("wishlist").innerHTML = data;
                        } else if (url === "/removewishlist") {
                            alert('Remove from wishlist successful');
                            document.getElementById("wishlist").innerHTML = data;
                        } else if (url === "/addcart") {
                            alert('Add to cart successful');
                            document.getElementById("cart").innerHTML = data;
                        } else if (url === "/removecart") {
                            alert('Remove from cart successful');
                            document.getElementById("cart").innerHTML = data;
                        }
                    },
                    error: function (xhr) {}
                });
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