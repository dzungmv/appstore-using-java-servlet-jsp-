<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
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
            .btn-create {
                color: #fff;
                box-shadow: none;
                padding: 8px 25px;
                width: 12%;
                border: none;
                border-radius: 20px;
                background-image: linear-gradient(to right, #6ee2f5, #6454f0);
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account == null}">
            <c:redirect url="./index.jsp"></c:redirect>
        </c:if>
        <c:if test="${sessionScope.account.isAdmin == 0}">
            <c:redirect url="./userinfo"></c:redirect>
        </c:if>

        <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
            <div class="container">
                <!-- Brand -->
                <a class="navbar-brand waves-effect" href="index">
                    <strong class="blue-text">Store</strong>
                </a>

                <!-- Collapse -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Links -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="index">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="gamepage.jsp">Game</a
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
                                href="top_downloads.jsp"
                                >Top download</a
                            >
                        </li>
                        <li class="nav-item">
                            <a
                                class="nav-link waves-effect"
                                href="aboutus.jsp"
                                target="_blank"
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
                                    <a class="dropdown-item" href="manager_app.jsp">Manager Apps</a>
                                </div>
                            </li>
                        </c:if>
                    </ul>

                    <!-- Right -->
                    <ul class="navbar-nav nav-flex-icons">
                        <li class="nav-item">
                            <a class="nav-link waves-effect" href="cart.jsp">
                                <i class="fas fa-shopping-cart"></i>
                                <span class="clearfix d-none d-sm-inline-block">Cart</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="https://www.facebook.com/mdbootstrap" class="nav-link waves-effect" target="_blank">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="https://twitter.com/MDBootstrap" class="nav-link waves-effect" target="_blank">
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
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hello ${sessionScope.account.username}
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="" data-toggle="modal" data-target="#change-password-modal">Change password</a>
                                    <div class="dropdown-divider"></div>
                                    <c:if test="${sessionScope.account.isAdmin != 1}">
                                        <a class="dropdown-item" href="userinfo">User Info</a>
                                    </c:if>
                                    <c:if test="${sessionScope.account.isAdmin == 1}">
                                        <a class="dropdown-item" href="admin.jsp">Admin</a>
                                    </c:if>
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
            <div class="row">
                <div class="col-md-2 mb-3">
                    <ul class="nav nav-pills flex-column" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">User</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">App</a>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Order history</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="request-tab" data-toggle="tab" href="#request" role="tab" aria-controls="request-tab" aria-selected="false">Request apps</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="money-card" data-toggle="tab" href="#card" role="tab"
                               aria-controls="money-card" aria-selected="false">Money card</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" id="money-card" data-toggle="tab" href="#manage-card" role="tab"
                               aria-controls="manage-money-card" aria-selected="false">Manage Money card</a>
                        </li>
                    </ul>
                </div>
                <!-- /.col-md-4 -->
                <div class="col-md-10">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <h4 class="font-weight-bold">All Users</h4>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Full name</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Phone number</th>
                                        <th scope="col">Email</th>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody id="manage-user-admin">
                                    <c:if test="${totalUser - 1 >= 0}">
                                        <c:forEach begin="0" end="${totalUser-1}" var="i">
                                            <tr>
                                                <th scope="row">
                                                    <c:if test="${usersL[i].isDev == 1}">
                                                        <p style="color: rgb(91, 19, 91)">Dev &nbsp<i class="fas fa-user-edit"></i></p>
                                                        </c:if>
                                                        <c:if test="${usersL[i].isDev != 1}">
                                                        <a onclick="UpgradeDevHandling('${usersL[i].username}')" href="" data-toggle="modal" data-target="#modal-upgrade-user">                                                
                                                            <p style="color: green">User &nbsp<i class="fas fa-user-edit"></i></p>
                                                        </a>
                                                    </c:if>
                                                </th>
                                                <th>${usersL[i].username}</th>
                                                <td>${userinfo[i].fullname}</td>
                                                <td>${userinfo[i].address}</td>
                                                <td>${userinfo[i].phone}</td>
                                                <td>${userinfo[i].mail}</td>
                                                <td>
                                                    <a onclick="blockUserHandling(${usersL[i].isBlock}, '${usersL[i].username}')" href="" data-toggle="modal" style="color: gray;"
                                                       data-target="#modal-block-user">
                                                        <i class="fas fa-ban"></i>
                                                        <c:if test="${usersL[i].isBlock == 1}">
                                                            unBlock
                                                        </c:if>
                                                        <c:if test="${usersL[i].isBlock == 0}">
                                                            Block
                                                        </c:if>
                                                    </a>
                                                </td>
                                                <td> <a onclick="deleteUserHandling('${usersL[i].username}')" data-toggle="modal" style="color: red;"
                                                        data-target="#modal-delete-user">
                                                        <i class="fas fa-trash"></i>Delete
                                                    </a></td>                                      
                                            </tr>
                                        </c:forEach>
                                    </c:if>
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
                                        <th scope="col">User</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${purchaseHistory.size()-1 >= 0}">
                                        <c:forEach begin="0" end="${purchaseHistory.size()-1}" var="i">
                                            <tr>
                                                <th>${purchaseHistory[i].purchaseDate}</th>
                                                <td>${purchaseProduct[i].name}</td>
                                                <td>${purchaseUserinfo[i].fullname}</td>
                                                <td>${purchaseHistory[i].price}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                            <h4 class="font-weight-bold">App</h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Developer</th>
                                        <th scope="col">Fee</th>
                                        <th scope="col">Descriptions</th>
                                        <th scope="col">Ratings</th>
                                        <th scope="col">Downloads</th>
                                        <th scope="col">Size</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody id="product-manager">
                                    <c:forEach items="${productL}" var="o">
                                        <tr>
                                            <th scope="row">${o.id}</th>
                                            <td>${o.name}</td>
                                            <td>
                                                <c:if test="${o.categories == 0}">
                                                    <p>Game</p>
                                                </c:if>
                                                <c:if test="${o.categories == 1}">
                                                    <p>Apps</p>
                                                </c:if>
                                            </td>
                                            <td>${o.dev}</td>
                                            <td>
                                                <c:if test="${o.fee == 0}">
                                                    Free
                                                </c:if>
                                                <c:if test="${o.fee != 0}">
                                                    $${o.fee}
                                                </c:if>
                                            </td>
                                            <td>${o.description}</td>
                                            <td>${o.rate}</td>
                                            <td>${o.downloadCount}</td>
                                            <td>${o.size} MB</td>
                                            <td> <a onclick="deleteProductHandling(${o.id}, '${o.dev}')" data-toggle="modal" style="color: red; text-decoration: underline;" data-target="#modal-delete-app">
                                                    Delete
                                                </a></td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>

                        <div class="tab-pane fade" id="request" role="tabpanel" aria-labelledby="request-tab">
                            <h4 class="font-weight-bold">Request app</h4>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name App</th>
                                        <th scope="col">
                                            App
                                        </th>
                                        <th scope="col">

                                        </th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody id="product-approved">
                                    <c:forEach items="${prodApproved}" var="o">
                                        <tr>
                                            <th scope="row">${o.id}</th>
                                            <th>${o.name}</th>
                                            <td>
                                                <a href="productdetail?id=${o.id}" style="text-decoration: underline;" target="blank">Details</a>

                                            <td>
                                                <a onclick="approvedProductHandling(${o.id}, '${o.dev}', 1)" data-toggle="modal" style="color: rgb(66, 186, 150); text-decoration: underline;" data-target="#modal-accept-app">
                                                    Accept
                                                </a>
                                            </td>
                                            <td> <a onclick="approvedProductHandling(${o.id}, '${o.dev}', 0)" data-toggle="modal" style="color: red; text-decoration: underline;" data-target="#modal-accept-app">
                                                    Decline
                                                </a></td>
                                        </tr>
                                    </c:forEach>


                                </tbody>
                            </table>

                        </div>

                        <div class="tab-pane fade" id="card" role="tabpanel" aria-labelledby="money-card">
                            <h4 class="font-weight-bold">Create money card</h4>
                            <form action="/createcard" method="post">
                                <div class="form-group">
                                    <select class="form-control" name="denominations">
                                        <option>50000</option>
                                        <option>100000</option>
                                        <option>200000</option>
                                        <option>500000</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="quantity">Quantity</label>
                                    <input type="quantity" name="quantity" id="quantity" class="form-control" />
                                </div>

                                <div class="form-group">
                                    <div class="d-flex justify-content-end">
                                        <button class="btn btn-create">Create</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                        
                        <div class="tab-pane fade" id="manage-card" role="tabpanel" aria-labelledby="profile-tab">
                            <h4 class="font-weight-bold">Order history</h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">Denominations</th>
                                        <th scope="col">Recharge code</th>
                                    </tr>
                                </thead>
                                <tbody>                                    
                                        <c:forEach items="${card}" var="o">
                                            <tr>
                                                <th scope="row">${o.denominations}</th>
                                                <th>${o.rechargeCode}</th>
                                            </tr>
                                        </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <!-- /.col-md-8 -->
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
            function deleteUserHandling(username) {
                document.getElementById("confirm-delete").onclick = function () {
                    $.ajax({
                        url: "/deleteuser",
                        type: "get",
                        data: {
                            username: username
                        },
                        success: function (data) {
                            $('#modal-delete-user').modal('hide');
                            document.getElementById("manage-user-admin").innerHTML = data;
                        },
                        error: function (xhr) {}
                    });
                };
            }

            function blockUserHandling(isBlock, username) {
                if (isBlock == 0) {
                    $("#modal-block-user .modal-body").text("Are you sure want to block this user?");
                } else {
                    $("#modal-block-user .modal-body").text("Are you sure want to unblock this user?");
                }
                document.getElementById("confirm-block").onclick = function () {
                    $.ajax({
                        url: "/blockuser",
                        type: "get",
                        data: {
                            isBlock: isBlock,
                            username: username,
                            flag: 0
                        },
                        success: function (data) {
                            $('#modal-block-user').modal('hide');
                            document.getElementById("manage-user-admin").innerHTML = data;
                        },
                        error: function (xhr) {}
                    });
                };
            }

            function UpgradeDevHandling(username) {
                document.getElementById("confirm-upgrade").onclick = function () {
                    $.ajax({
                        url: "/upgradedev",
                        type: "get",
                        data: {
                            username: username
                        },
                        success: function (data) {
                            $('#modal-upgrade-user').modal('hide');
                            document.getElementById("manage-user-admin").innerHTML = data;
                        },
                        error: function (xhr) {}
                    });
                };
            }

            function deleteProductHandling(idP, username) {
                document.getElementById("confirm-delete-product").onclick = function () {
                    $.ajax({
                        url: "/deleteapp",
                        type: "get",
                        data: {
                            idP: idP,
                            username: username,
                            flag: 0
                        },
                        success: function (data) {
                            $('#modal-delete-app').modal('hide');
                            document.getElementById("product-manager").innerHTML = data;
                        },
                        error: function (xhr) {}
                    });
                };
            }

            function approvedProductHandling(idP, dev, isApproved) {
                let url = (isApproved === 1) ? "/approvedproduct" : "/deleteapp";

                if (isApproved === 1) {
                    $("#modal-accept-app .modal-body").text("Are you sure you want to accept this app?");
                } else {
                    $("#modal-accept-app .modal-body").text("Are you sure you want to decline this app?");
                }
                document.getElementById("btn-product-approved").onclick = function () {
                    $.ajax({
                        url: url,
                        type: "get",
                        data: {
                            idP: idP,
                            username: dev,
                            flag: 2
                        },
                        success: function (data) {
                            $('#modal-accept-app').modal('hide');
                            document.getElementById("product-approved").innerHTML = data;
                        },
                        error: function (xhr) {}
                    });
                }
            }
        </script>

        <!-- Modal change password -->
        <div class="modal fade" id="change-password-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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


        <!-- modal-accept-app -->
        <div class="modal fade" id="modal-accept-app" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Accept app</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary1" data-dismiss="modal">Close</button>
                        <button id="btn-product-approved" type="button" class="btn btn-success">Confirm</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal upgrade user -->
        <div class="modal fade" id="modal-upgrade-user" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Upgrade user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure want to upgrade this user to developer?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-modal" data-dismiss="modal">Close</button>
                        <button id="confirm-upgrade" type="button" class="btn btn-success btn-modal">Upgrade</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal block user -->
        <div class="modal fade" id="modal-block-user" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Block user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-modal" data-dismiss="modal">Close</button>
                        <button id="confirm-block" type="button" class="btn btn-danger btn-modal">Block</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal-delete-user -->
        <div class="modal fade" id="modal-delete-user" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure want to delete this user?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-modal" data-dismiss="modal">Close</button>
                        <button type="button" id="confirm-delete" class="btn btn-danger btn-modal">Delete</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal-delete-app -->
        <div class="modal fade" id="modal-delete-app" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete app</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure want to delete this app?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-modal" data-dismiss="modal">Close</button>
                        <button type="button" id="confirm-delete-product" class="btn btn-danger btn-modal">Delete</button>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>