<%-- 
    Document   : resetpassword
    Created on : 06-07-2022, 12:45:28
    Author     : Admin
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Reset Password Page</title>

        <!-- Font Icon -->
        <link href="loginPage/colorlib-regform-7/fonts/material-icon/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css"/>
        <!-- Main css -->
        <link href="loginPage/colorlib-regform-7/css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>

        <div class="main" style="padding: 50px 0">
            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="loginPage/colorlib-regform-7/images/login-img3.jpg" alt="sing up image"></figure>
                        </div>
                        <%
            String error = (String) session.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
                        <div class="signin-form">
                            <h2 class="form-title">Forgot Password</h2>
                            <form action="MainController" method="POST" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="userName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="userID" id="userID" placeholder="UserID" required="" />
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="text" name="email" id="email" placeholder="Your Email" />
                                </div>

                                <div class="form-group form-button">
                                    <input style="background-color: #eba7be" type="submit" name="action" id="Retrieve" class="form-submit" value="Retrieve"/>
                                </div>

                                <a style="font-size: 18px; color: #000"href="login.jsp">Sign in
                                <i style="color: #fff;
                                   background-color: #eba7be;
                                   padding: 7px;
                                   margin-left: 10px;
                                   border-radius: 7px;" class="fa-solid fa-arrow-rotate-left"></i>
                                </a>
                            </form>
                           <h4 style="color: red" ><%=error%> </h4>
                        </div>
                    </div>
                </div>
            </section>

        </div>
        
            
        <!-- JS -->
        <script src="login and register/vendor/jquery/jquery.min.js"></script>
        <script src="login and register/js/main.js"></script>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' /* optional */
                });
            });
        </script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com
    ) -->
</html> 