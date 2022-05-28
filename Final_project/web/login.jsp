<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
                <div class="row content-login">
                    <div class="col-md-6 mb3">
                        <img src="img/login.png" alt="" class="img-login">
                    </div>
                    <div class="col-md-6">
                        <h1 class="font-weight-bold mb-3 text-center font-logo">Store</h1>
                        <div class="text-danger">
                            ${message}
                        </div>
                        <form action="./login" method="post" id="loginForm">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                            
                            <div class="form-group" align="right">
                                <a href="/mailconfirm.jsp">Forgot password?</a>
                            </div>

                            <div class="form-group">
                                <button class="btn btn-login">Log in</button>
                            </div>
                            
                            <hr width="70%" />
                            
                            <div class="form-group">
                              <p class="text-center">
                                Don't have an account? <a href="/signup.jsp">Sign up</a>
                              </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
