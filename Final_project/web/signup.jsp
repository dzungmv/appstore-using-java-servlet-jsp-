<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="/font/fontawesome/css/all.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">

        <style>
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                overflow: hidden;
                background-color: #F0F2F5;
     
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.account != null}">
            <c:redirect url="./index"></c:redirect>
        </c:if>
        <section id="login-form">
            <div class="container">
                <div class="row content-signup">
                    <div class="col-md-6 mb3">
                        <img src="img/login.png" alt="" class="img-login">
                    </div>
                    <div class="col-md-6">
                        <h1 class="font-weight-bold mb-3 text-center font-logo">Store</h1>
                        <div class="text-danger">
                            ${message}
                        </div>
                        <form action="./signup" method="post" id="loginForm">
                            <div class="form-group">
                                <label for="name">Your name</label>
                                <input type="text" name="name" id="name" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" name="email" id="email" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" id="username" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div>

                            <div class="form-group" align="left">
                                <input type="checkbox" name="cbagree" value="ischecked"> I agree to the terms of service
                            </div>
                            
                            <div class="form-group">
                                <button class="btn btn-login">Sign up</button>
                            </div>
                            
                            <hr width="70%" />
                            <div class="form-group">
                                <p class="text-center">Already have an account? <a href="login.jsp">Login</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
