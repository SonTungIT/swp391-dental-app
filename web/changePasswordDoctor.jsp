<%-- 
    Document   : changePasswordDoctor
    Created on : Jul 30, 2022, 9:24:05 AM
    Author     : PC
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords"
              content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, materialpro admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, materialpro admin lite design, materialpro admin lite dashboard bootstrap 5 dashboard template">
        <meta name="description"
              content="Material Pro Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
        <meta name="robots" content="noindex,nofollow">
        <title>Material Pro Lite Template by WrapPixel</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/materialpro-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
        <!-- Custom CSS -->
        <link href="html/css/style.min.css" rel="stylesheet" type="text/css"/>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

        <!-- Icon CND fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Icon CND fontawesome -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="card-body">
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            %>
            <div class="col-lg-8 col-xlg-9 col-md-7">
                <div class="card">
                    <div class="card-body">
                        <form action="MainController"  class="form-horizontal form-material mx-2">
                            <div>
                                <input type="hidden" name="patientID" value="${ID}">
                            </div>
                            <input class="form-control ps-0 form-control-line" type="hidden" name="oldPassword" value="${PROFILE_DR.password}">
                            <div class="form-group">
                                <label class="col-md-12 mb-0">Nhập mật khẩu cũ:</label>
                                <div class="col-md-12">
                                    <td>  
                                        <input class="form-control ps-0 form-control-line" type="password" name="oldPassword1" value="">
                                    </td> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-12 mb-0">Mật khẩu mới:</label>
                                <div class="col-md-12">
                                    <td>  
                                        <input class="form-control ps-0 form-control-line" type="password" name="newPassword" value="">
                                    </td> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-12 mb-0">Xác nhận mật khẩu mởi:</label>
                                <div class="col-md-12">
                                    <td>  
                                        <input class="form-control ps-0 form-control-line" type="password" name="newPassword1" value="">
                                    </td> 
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12 d-flex">
                                    <button class="btn btn-success mx-auto mx-md-0 text-white" type="submit" name="action" value="Update_Password_Doctor">Cập Nhật</button>
                                </div>
                            </div>
                        </form>
                        <a href="patient.jsp"a/>
                        <p>${MESSAGE}</p>
                    </div>
                </div>
            </div>
            <!-- Column -->
        </div>       
        <script src="assets/plugins/jquery/dist1/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="assets/plugins/bootstrap/dist1/js/bootstrap.bundle.min.js"></script>
        <script src="html/js/app-style-switcher.js" type="text/javascript"></script>
        <!--Wave Effects -->
        <script src="html/js/waves.js"></script>
        <!--Menu sidebar -->
        <script src="html/js/sidebarmenu.js"></script>
        <!--Custom JavaScript -->
        <script src="html/js/custom.js"></script>
    </body>
</html>