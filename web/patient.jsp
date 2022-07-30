<%-- 
    Document   : patient
    Created on : Jun 7, 2022, 7:15:28 PM
    Author     : Xqy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Profile Patient</title>
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);
            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <title>Profile Patient</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/materialpro-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/logo-header1.png">
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
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("PT")) {
                response.sendRedirect("login.jsp");
            }
        %>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar" data-navbarbg="skin6">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <div class="navbar-header" data-logobg="skin6">
                        <!-- ============================================================== -->
                        <!-- Logo -->
                        <!-- ============================================================== -->
                        <a class="navbar-brand ms-4" href="index.jsp">
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
                        <!-- ============================================================== -->
                        <!-- End Logo -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- toggle and nav items -->
                        <!-- ============================================================== -->
                        <a class="nav-toggler waves-effect waves-light text-white d-block d-md-none"
                           href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                        <ul class="navbar-nav d-lg-none d-md-block ">
                            <li class="nav-item">
                                <a class="nav-toggler nav-link waves-effect waves-light text-white "
                                   href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                            </li>
                        </ul>
                        <!-- ============================================================== -->
                        <!-- toggle and nav items -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav me-auto mt-md-0 ">
                            <!-- ============================================================== -->
                            <!-- Search -->
                            <!-- ============================================================== -->

                            <li class="nav-item search-box">
                                <a class="nav-link text-muted" href="javascript:void(0)"><i class="ti-search"></i></a>
                                <form class="app-search" style="display: none;">
                                    <input type="text" class="form-control" placeholder="Search &amp; enter"> <a
                                        class="srh-btn"><i class="ti-close"></i></a>
                                </form>
                            </li>
                        </ul>

                        <!-- ============================================================== -->
                        <!-- Right side toggle and nav items -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav">
                            <!-- ============================================================== -->
                            <!-- User profile and search -->
                            <!-- ============================================================== -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="#"
                                   id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="./images/customers/${PROFILE_PT.image}" style="width: 40px; height: 40px" alt="user" class="profile-pic me-2">${PROFILE_PT.userID}
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <button class="dropdown-item" type="button">
                                        <i class="fa-solid fa-circle-arrow-right"></i>
                                        Tài Khoản Của Tôi
                                    </button>
                                    <button class="dropdown-item" type="button">
                                        <i class="fa-solid fa-circle-arrow-right"></i>
                                        Lịch sử cuộc hẹn
                                    </button>
                                    <form action="MainController">
                                        <button class="dropdown-item" type="button">
                                            <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                            <input type="submit" name="action" value="Logout" style=" background-color: transparent; border: none"/>
                                        </button>
                                    </form>
                                </ul> 
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- ============================================================== -->
            <!-- End Topbar header -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <aside class="left-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar scroll-->
                <div class="scroll-sidebar">
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav">
                            <!-- User Profile-->
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="index.jsp" aria-expanded="false"><i class="mdi me-2 mdi-gauge"></i><span
                                        class="hide-menu">Trang Chủ</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="ShowProfilePatientController?patientID=${LOGIN_USER.getUserID()}" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
                                        class="hide-menu">Hồ Sơ</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="MainController?action=SearchHSBK&searchHSBK&ptID" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
                                        class="hide-menu">Lịch Sử Đặt Lịch</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="UpdatePatientPasswordControler?patientID=${LOGIN_USER.getUserID()}" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
                                        class="hide-menu">Thay Đổi Mật Khẩu</span></a></li>
                        </ul>

                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
                <div class="sidebar-footer">
                    <div class="row">
                        <div class="col-4 link-wrap">
                            <!-- item-->
                            <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Settings"><i
                                    class="ti-settings"></i></a>
                        </div>
                        <div class="col-4 link-wrap">
                            <!-- item-->
                            <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Email"><i
                                    class="mdi mdi-gmail"></i></a>
                        </div>
                        <div class="col-4 link-wrap">
                            <!-- item-->
                            <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i
                                    class="mdi mdi-power"></i></a>
                        </div>
                    </div>
                </div>
            </aside>
            <!-- ============================================================== -->
            <!-- End Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="page-breadcrumb">
                    <div class="row align-items-center">
                        <div class="col-md-6 col-8 align-self-center">
                            <!--<h3 class="page-title mb-0 p-0">Thông Tin</h3>-->
                            <div class="d-flex align-items-center">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Trang Cá Nhân</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Thông Tin</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <!-- Row -->
                    <div class="row">
                        <!-- Column -->
                        <div class="col-lg-4 col-xlg-3 col-md-5">
                            <form action="UpdateProfilePatientController" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="patientID" value="${PROFILE_PT.userID}">
                                <input type="hidden" name="fullName" value="${PROFILE_PT.fullName}">
                                <div class="card" style="text-align: center">
                                    <div class="card-body profile-card" >
                                        <center class="mt-4"> <img src="./images/customers/${PROFILE_PT.image}"
                                                                   class="rounded-circle" width="140"/>
                                            <h4 class="card-title mt-2">${PROFILE_PT.fullName}</h4>
                                        </center>
                                        <!-- Button to Open the Modal -->
                                        <input type="hidden" name="action" value="UpImage"/>
                                        <button type="button"  class="btn btn-success" data-toggle="modal" data-target="#myModal" style="color: white">
                                            Đổi ảnh đại diện
                                        </button>
                                        <!-- The Modal -->
                                        <div class="modal fade" id="myModal" >
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">

                                                    <!-- Modal Header -->
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Đổi ảnh đại diện</h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <!-- Modal body -->
                                                    <div class="modal-body">
                                                        <input type="file" name="imagePart" required=""/> 
                                                    </div>
                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Thoát</button>
                                                        <button type="submit" class="btn btn-success" >Xác nhận</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Column -->
                        <!-- Column -->

                        <div class="col-lg-8 col-xlg-9 col-md-7">
                            <form action="UpdateProfilePatientController">
                                <input type="hidden" name="patientID" value="${PROFILE_PT.userID}">
                                <input type="hidden" name="password" value="${PROFILE_PT.password}">
                                <input type="hidden" name="roleID" value="${PROFILE_PT.roleID}">
                                <input type="hidden" name="status" value="${PROFILE_PT.status}">
                                <input type="hidden" name="image" value="${PROFILE_PT.image}">
                                <div class="card">
                                    <div class="card-body">
                                        <form class="form-horizontal form-material mx-2">
                                            <div class="form-group">
                                                <label class="col-md-12 mb-0">Họ và Tên</label>
                                                <div class="col-md-12">
                                                    <input  type="text" name="fullName" value="${PROFILE_PT.fullName}"
                                                            class="form-control ps-0 form-control-line" required="">
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12 mb-0">Giới Tính</label>
                                                <div class="col-md-12">
                                                    <select name="gender" class="form-control ps-0 form-control-line">
                                                        <option value="${PROFILE_PT.gender}">${PROFILE_PT.gender}</option>
                                                        <option value="Nam">Nam</option>
                                                        <option value="Nữ">Nữ</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12 mb-0">Địa Chỉ</label>
                                                <div class="col-md-12">
                                                    <input type="text" name="address" value="${PROFILE_PT.address}"
                                                           class="form-control ps-0 form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12 mb-0">Ngày Sinh</label>
                                                <div class="col-md-12">
                                                    <input type="date" name="birthday" value="${PROFILE_PT.birthday}"
                                                           class="form-control ps-0 form-control-line" required="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="example-email" class="col-md-12">Email</label>
                                                <div class="col-md-12">
                                                    <input type="email" name="email" value="${PROFILE_PT.email}"
                                                           class="form-control ps-0 form-control-line" name="example-email"
                                                           id="example-email" required="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12 mb-0">Số Điện Thoại</label>
                                                <div class="col-md-12">
                                                    <input type="text" name="phone" value="${PROFILE_PT.phone}"
                                                           class="form-control ps-0 form-control-line">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-sm-12 d-flex">
                                                    <button type="submit" name="action" value="UpdatePF" class="btn btn-success ">Cập Nhật</button>
                                                </div>
                                            </div>
                                        </form>
                                        <h6>${MESS_UP_PFPT}</h6>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Column -->


                    </div>
                    <!-- Row -->
                    <!-- ============================================================== -->
                    <!-- End PAge Content -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Right sidebar -->
                    <!-- ============================================================== -->
                    <!-- .right-sidebar -->
                    <!-- ============================================================== -->
                    <!-- End Right sidebar -->
                    <!-- ============================================================== -->
                </div>
                <!-- ============================================================== -->
                <!-- End Container fluid  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- footer -->
                <!-- ============================================================== -->

                <!-- ============================================================== -->
                <!-- End footer -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page wrapper  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
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
