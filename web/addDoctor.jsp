<%-- 
    Document   : createDoctor
    Created on : 23-06-2022, 23:35:11
    Author     : Admin
--%>

<%@page import="sample.user.UserError"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="ct" class="sample.user.AdminDAO" scope="request" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form by Colorlib</title>

        <!-- Font Icon -->

        <link href="loginPage/colorlib-regform-7/fonts/material-icon/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css"/>
        <!-- Main css -->

        <link href="loginPage/colorlib-regform-7/css/style.css" rel="stylesheet" type="text/css"/>
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
                        <div class="signup-form">
                            <h2 style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif" class="form-title">Thêm Mới Nha Sĩ</h2>
                            <form action="MainController" class="register-form" id="register-form">
                                <input type="hidden" name="roleID" value="DR" />
                                <div class="form-group">
                                    <label for="doctorID"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="userID" id="name" placeholder="UserID" required="" pattern="DR.{4,}" title="Phải bắt đầu bằng DR và 4 chữ số đằng sau"/>
                                </div>
                                <h6 style="color: red"> <%=error.getDuplicateError()%>
                                    <%=error.getUserIDError()%>
                                </h6>

                                <div class="form-group">
                                    <label for="gender"></label>Giới tính:
                                    <select name="gender" style="width: 300px; height: 30px" required=""  class="zmdi zmdi-account material-icons-name">
                                        <option value="Nam">Nam</option>
                                        <option value="Nữ">Nữ</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="fullName" required="" id="name" placeholder="Name"/>
                                </div>
                                <h6 style="color: red"> 
                                    <%=error.getFullNameError()%>
                                </h6>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Email" required=""/>
                                </div>
                                <h6 style="color: red"> 
                                    <%=error.getEmailError()%>
                                </h6>
                                <div class="form-group">
                                    <label for="address"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="address" id="name" placeholder="Address" required=""/>
                                </div>
                                <h6 style="color: red"> 
                                    <%=error.getAddressError()%>
                                </h6>
                                <div class="form-group">
                                    <label for="categoryID"></label>Chuyên khoa:
                                    <select name="categoryID" style="width: 300px; height: 30px">
                                        <c:forEach items="${ct.listCT_AD}" var="list">
                                            <option value="${list.categoryID}">${list.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="shift"></label>Ca làm việc:
                                    <select name="shift" style="width: 300px; height: 30px">
                                        <option value="Full time">Full time</option>
                                        <option value="Morning">Morning</option>
                                        <option value="Afternoon">Afternoon</option>
                                    </select>                               
                                </div>
                                <div class="form-group">
                                    <label for="phone"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="phone" id="name" placeholder="Phone" required=""/>
                                </div>

                                <div class="form-group form-button">
                                    <input type="submit" name="action" id="signup" class="form-submit" value="Add"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">

                            <img src="loginPage/colorlib-regform-7/images/login-img2.jpg" alt=""/>
                            <a style="font-family: Helvetica Neue,Helvetica,Arial,sans-serif; margin-top: 20px" href="manageDoctor.jsp" class="signup-image-link">Quay trở lại</a>
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
