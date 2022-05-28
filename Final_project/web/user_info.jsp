<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
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

            body {
                margin: 2rem;
            }

            .table-wishlist table {
                width: 100%;
            }

            .table-wishlist thead {
                border-bottom: 1px solid #e5e5e5;
                margin-bottom: 5px;
            }

            .table-wishlist thead tr th {
                padding: 8px 0 18px;
                color: #484848;
                font-size: 15px;
                font-weight: 400;
            }

            .table-wishlist tr td {
                padding: 25px 0;
                vertical-align: middle;
            }

            .table-wishlist tr td .img-product {
                width: 72px;
                float: left;
                margin-left: 8px;
                margin-right: 31px;
                line-height: 63px;
            }

            .table-wishlist tr td .img-product img {
                width: 100%;
            }

            .table-wishlist tr td .name-product {
                font-size: 15px;
                color: #484848;
                padding-top: 8px;
                line-height: 24px;
                width: 50%;
            }

            .table-wishlist tr td.price {
                font-weight: 600;
            }

            .table-wishlist tr td .quanlity {
                position: relative;
            }

            .total {
                font-size: 24px;
                font-weight: 600;
                color: #8660e9;
            }

            .display-flex {
                display: flex;
            }

            .align-center {
                align-items: center;
            }

            .round-black-btn {
                border-radius: 25px;
                background: #212529;
                color: #fff;
                padding: 5px 20px;
                display: inline-block;
                border: solid 2px #212529;
                transition: all 0.5s ease-in-out 0s;
                cursor: pointer;
                font-size: 14px;
            }

            .round-black-btn:hover,
            .round-black-btn:focus {
                background: transparent;
                color: #212529;
                text-decoration: none;
            }

            .mb-10 {
                margin-bottom: 10px !important;
            }

            .mt-30 {
                margin-top: 30px !important;
            }

            .d-block {
                display: block;
            }

            .custom-form label {
                font-size: 14px;
                line-height: 14px;
            }

            .pretty.p-default {
                margin-bottom: 15px;
            }

            .pretty input:checked~.state.p-primary-o label:before,
            .pretty.p-toggle .state.p-primary-o label:before {
                border-color: #8660e9;
            }

            .pretty.p-default:not(.p-fill) input:checked~.state.p-primary-o label:after {
                background-color: #8660e9 !important;
            }

            .main-heading.border-b {
                border-bottom: solid 1px #ededed;
                padding-bottom: 15px;
                margin-bottom: 20px !important;
            }

            .custom-form .pretty .state label {
                padding-left: 6px;
            }

            .custom-form .pretty .state label:before {
                top: 1px;
            }

            .custom-form .pretty .state label:after {
                top: 1px;
            }

            .custom-form .form-control {
                font-size: 14px;
                height: 38px;
            }

            .custom-form .form-control:focus {
                box-shadow: none;
            }

            .custom-form textarea.form-control {
                height: auto;
            }

            .mt-40 {
                margin-top: 40px !important;
            }

            .in-stock-box {
                background: #ff0000;
                font-size: 12px;
                text-align: center;
                border-radius: 25px;
                padding: 4px 15px;
                display: inline-block;
                color: #fff;
            }

            .trash-icon {
                font-size: 20px;
                color: #212529;
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account == null}">
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
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="index"
                               >Home
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


        <div class="container game-page-home">
            <div class="container">
                <hr>
                <div class="row">
                    <div class="col-md-2 mb-3">
                        <ul class="nav nav-pills flex-column" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                   aria-controls="home" aria-selected="true">Account</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                                   aria-controls="profile" aria-selected="false">Order history</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" id="wishlist-tab" data-toggle="tab" href="#wishlist" role="tab"
                                   aria-controls="wishlist" aria-selected="false">My wishlist</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.col-md-4 -->
                    <div class="col-md-10">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h4 class="font-weight-bold">Overview</h4>
                                <table class="table table-borderless">
                                    <thead>
                                        <tr>
                                            <th scope="col">Username</th>
                                            <th scope="col">Full name</th>
                                            <th scope="col">Date of birth</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">Phone number</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Money Available</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">${info.username}</th>
                                            <td>${info.fullname}</td>
                                            <td>${info.dob}</td>
                                            <td>${info.address}</td>
                                            <td>${info.phone}</td>
                                            <td>${info.mail}</td>
                                            <td>${info.money}</td>
                                            <td>
                                                <a href="edituser?id=${info.id}" id="edit-product" style="color: rgb(66, 186, 150);">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h4 class="font-weight-bold">Order history</h4>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col">Time</th>
                                            <th scope="col">Product</th>
                                            <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${purchaselist.size()-1 >= 0}">
                                            <c:forEach begin="0" end="${purchaselist.size()-1}" var="i">
                                                <tr>
                                                    <th scope="row">${purchaselist[i].purchaseDate}</th>
                                                    <td>${productpurchase[i].name}</td>
                                                    <td>${purchaselist[i].price}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="wishlist" role="tabpanel" aria-labelledby="wishlist-tab">
                                <h4 class="font-weight-bold">My Wishlist</h4>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-wishlist">
                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th width="45%">Product Name</th>
                                                        <th width="15%">Unit Price</th>
                                                        <th width="15%"></th>
                                                        <th width="10%"></th>
                                                    </tr>
                                                </thead>
                                                <tbody id="wishlist-list">
                                                    <c:if test="${productList.size()-1 >= 0}">
                                                        <c:forEach begin="0" end="${productList.size()-1}" var="i">
                                                            <tr>
                                                                <td width="45%">
                                                                    <a href="productdetail?id=${productList[i].id}">
                                                                        <div class="display-flex align-center">
                                                                            <div class="img-product">
                                                                                <img src="./img/icon_products/${productList[i].id}.png"
                                                                                     alt="" class="mCS_img_loaded">
                                                                            </div>
                                                                            <div class="name-product">
                                                                                ${productList[i].name}
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </td>
                                                                <td width="15%" class="price">
                                                                    <c:if test="${productList[i].fee == 0}">
                                                                        Free
                                                                    </c:if>
                                                                    <c:if test="${productList[i].fee != 0}">
                                                                        ${productList[i].fee}
                                                                    </c:if>
                                                                </td>
                                                                <td width="15%">
                                                                    <c:if test="${productList[i].fee == 0 || isPurchase[i] == 1}">
                                                                        <a href="download?idP=${productList[i].id}&idU=${sessionScope.account.id}">
                                                                            <button class="round-black-btn small-btn"
                                                                                    style="text-transform: none; background-color: rgb(103, 157, 55) !important;">
                                                                                Download
                                                                            </button>
                                                                        </a>
                                                                    </c:if>
                                                                    <c:if test="${productList[i].fee > 0 && isPurchase[i] == 0}">
                                                                        <a>
                                                                            <button class="round-black-btn small-btn"
                                                                                    style="text-transform: none">
                                                                                Add to cart</button>
                                                                        </a>
                                                                    </c:if>
                                                                </td>

                                                                <td width="10%" class="text-center" onclick="removeWishList(${productList[i].id})">
                                                                    <a class="trash-icon"style="color: #ff0000;">
                                                                        <i class="far fa-trash-alt"></i></a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col-md-8 -->
                </div>



            </div>
            <!-- /.container -->
        </div>




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

        <script>
            function removeWishList(idP) {
                $.ajax({
                    url: "/removewishlist",
                    type: "get",
                    data: {
                        idProduct: idP,
                        flag: 2
                    },
                    success: function (data) {
                        alert('Remove successful');
                        document.getElementById('wishlist-list').innerHTML = data;
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