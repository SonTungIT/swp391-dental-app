<%-- 
    Document   : register
    Created on : Jun 6, 2022, 12:28:02 PM
    Author     : Lenovo Legion
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up</title>

        <!-- Font Icon -->

        <link href="loginPage/colorlib-regform-7/fonts/material-icon/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css"/>
        <!-- Main css -->

        <link href="loginPage/colorlib-regform-7/css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%
            UserError error = (UserError) request.getAttribute("USER_ERROR");
            if (error == null) {
                error = new UserError();
            }
        %>
        <div class="main" style="padding: 50px 0">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form" style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 18px">
                            <h2 style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif" class="form-title">Đăng Ký</h2>
                            <form action="MainController" class="register-form" id="register-form">
                                <input type="hidden" name="roleID" value="PT" />
                                <div class="form-group">
                                    <label for="userID"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="userID" id="name" placeholder="Tên đăng nhập" required=""/>
                                </div>
                                <p style="color: red"><%=error.getDuplicateError()%></p>
                                <p style="color: red"><%=error.getUserIDError()%></p></br>
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="fullName" id="name" placeholder="Họ và tên" required=""/>
                                </div>
                                <p style="color: red"><%=error.getFullNameError()%></p></br>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Địa chỉ email" required=""/>
                                </div>
                                <p style="color: red"><%=error.getEmailError()%></p></br>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="pass" placeholder="Mật khẩu" required=""/>
                                </div></br>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="re_pass" id="re_pass" placeholder="Nhập lại mật khẩu" required=""/>
                                </div>
                                <p style="color: red"><%=error.getPasswordError()%></p></br>
                                <div class="form-group form-button">
                                    <input type="submit" name="action" id="signup" class="form-submit" value="Register"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <img src="loginPage/colorlib-regform-7/images/login-img2.jpg" alt=""/>
                            <a style="font-size: 18px; color: #000"href="login.jsp">Sign in
                                <i style="color: #6dabe4;
                                   background-color: #f6f6f6;
                                   padding: 7px;
                                   margin-left: 10px;
                                   margin-top: 50px;
                                   border-radius: 7px;" class="fa-solid fa-arrow-rotate-left"></i>
                                </a>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- JS -->

        <script src="loginPage/colorlib-regform-7/vendor/jquery/jquery.min.js" type="text/javascript"></script>

        <script src="loginPage/colorlib-regform-7/js/main.js" type="text/javascript"></script>
    </body>
</html>
