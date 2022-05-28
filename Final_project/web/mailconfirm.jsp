<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Mail</title>
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
            <c:redirect url="./index.jsp"></c:redirect>
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
                            <form <c:if test="${confirm == null}">action="./sendmail"</c:if> 
                                  <c:if test="${confirm != null}">action="./verify?username=${userinfo}"</c:if>                              
                            method="post" id="loginForm">
                                
                            <c:if test="${confirm == null}">
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" name="username" id="username" class="form-control">
                                </div>
                            </c:if>
                            
                            <c:if test="${confirm != null}">
                                <div class="form-group">
                                    <label for="code">Verification code</label>
                                    <input type="text" name="code" id="code" class="form-control">
                                </div>
                            </c:if> 

                            <div class="form-group">
                                <button class="btn btn-login">Next</button>
                            </div>
                            
                            <hr width="70%" />
                            
                            <div class="form-group">
                              <p class="text-center">
                                <a href="/login.jsp">Login</a>
                              </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
