<%-- 
    Document   : sendmail
    Created on : Jul 30, 2022, 11:14:57 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="login and register/fonts/material-icon/css/material-design-iconic-font.min.css">
    <figure><img src="loginPage/colorlib-regform-7/images/login-img1.jpg" alt="sing up image"></figure>

    <!-- Main css -->
    <link rel="stylesheet" href="login and register/css/style.css">
</head>
<body>
 
    <div class="main">

        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                      
                        
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Send mail</h2>
                        <form action="MainController" method="POST" class="register-form" id="login-form">
                           <div class="form-group">
                                <label class="col-md-12 mb-0">UserID:</label>
                                <div class="col-md-12">
                                    <td>  
                                        <input class="form-control ps-0 form-control-line" type="text" name="userID" value="${PROFILE_PT.getUserID}">
                                    </td> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="email" id="email" placeholder="Your Email" />
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="action" id="Retrieve" class="form-submit" value="Send"/>
                            </div>
                            
                                <a href="login.jsp">Sign in</a>
                        </form>
       
                    </div>
                </div>
            </div>
        </section>

    </div>
        <%
            String error = (String) session.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
       
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