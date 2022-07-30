<%-- 
    Document   : login
    Created on : Jun 6, 2022, 12:26:43 PM
    Author     : Lenovo Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login Page</title>

        <!-- Font Icon -->
        <link href="loginPage/colorlib-regform-7/fonts/material-icon/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css"/>
        <!-- Main css -->
        <link href="loginPage/colorlib-regform-7/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            String mes = (String) request.getAttribute("MESSAGE");
            if (mes == null) {
                mes = "";
            }
        %>
        <div class="main" style="padding: 50px 0">

            <!-- Sing in  Form -->
            <section class="sign-in">

                <div class="container">
                    <a class="navbar-brand ms-4" style="margin: 20px" href="index.jsp">
                        <!-- Logo icon -->
                        <b class="logo-icon">
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="./assets/images/logo-header1.png" alt="homepage" class="dark-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
                        <span class="logo-text">
                            <!-- dark Logo text -->
                            <img src="./assets/images/logo-header2-2.png" alt="homepage" class="dark-logo" />

                        </span>
                    </a>
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="loginPage/colorlib-regform-7/images/login-img1.jpg" alt="sing up image"></figure>
                            <a style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 14px" href="register.jsp" class="signup-image-link">Tạo mới tài khoản</a>
                        </div>

                        <div style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 16px" class="signin-form">
                            <h2 style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif" class="form-title">Đăng Nhập</h2>
                            <form action="MainController" class="register-form" id="login-form" ">
                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="userID" id="your_name" placeholder="Tên Đăng Nhập"/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password"  placeholder="Mật Khẩu"/>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                    <label style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif" for="remember-me" class="label-agree-term"><span><span></span></span>Ghi nhớ tình trạng đăng nhập</label>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="action" id="signin" class="form-submit" value="Login"/>
                                </div>
                            </form>
                            <h4><%=mes%></h4>
                            <div class="social-login">
                                <span class="social-label">Đăng nhập bằng dịch vụ</span>
                                <ul class="socials">
                                    <!-- <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li> -->
                                    <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/dental-demo-2/LoginGoogleController&response_type=code
                                           &client_id=232049583848-lgpfr9t4gadm8m6mgmu4jpu160ld6khv.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
