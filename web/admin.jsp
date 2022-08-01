<%-- 
    Document   : admin
    Created on : Jun 8, 2022, 12:43:49 PM
    Author     : Lenovo Legion
--%>

<%@page import="sample.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Admin Page</title>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
        <!-- chartist CSS -->
        <link href="assets/plugins/chartist-js/dist1/chartist.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/chartist-js/dist1/chartist-init.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet" type="text/css"/>
        <!--This page css - Morris CSS -->
        <link href="assets/plugins/c3-master/c3.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom CSS -->
        <link href="html/css/style.min.css" rel="stylesheet" type="text/css"/>
        <!-- Icon CND fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Icon CND fontawesome -->
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("index.jsp");
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
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
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
                                    <img src="./assets/images/users/1.jpg" alt="user" class="profile-pic me-2">Admin Page
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <button class="dropdown-item" type="button">
                                        <i class="fa-solid fa-circle-arrow-right"></i>
                                        Tài Khoản Của Tôi
                                    </button>
                                    <form action="MainController">
                                        <button class="dropdown-item" type="button">
                                            <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                            <input type="submit" name="action" value="Logout" style=" background-color: transparent; border: none"/>
                                        </button>
                                    </form>
                                    <button class="dropdown-item" type="button">
                                        <i class="fa-solid fa-circle-arrow-right"></i>
                                        Quản Lý
                                    </button>
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
                                                         href="MainController?action=ShowDashboard" aria-expanded="false"><i class="mdi me-2 mdi-gauge"></i><span
                                        class="hide-menu">Dashboard</span></a></li>
                            <!-- <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                    href="pages-profile.html" aria-expanded="false">
                                    <i class="mdi me-2 mdi-account-check"></i><span class="hide-menu">Profile</span></a>
                            </li> -->

                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="MainController?action=Show" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span
                                        class="hide-menu">Quản lí bác sĩ</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="MainController?action=ShowAllPatient" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span
                                        class="hide-menu">Quản lí bệnh nhân</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="MainController?action=ShowBooking" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span
                                        class="hide-menu">Quản lí lịch hẹn</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="MainController?action=SearchSC&searchSC" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span
                                        class="hide-menu">Quản lí lịch hoạt động</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="MainController?action=Search_Feedback&search" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span
                                        class="hide-menu">Quản lí đánh giá</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="MainController?action=Search_Category&search" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span
                                        class="hide-menu">Quản lí loại dịch vụ</span></a></li> 
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="MainController?action=Search_Service&search" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span
                                        class="hide-menu">Quản lí dich vụ</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="MainController?action=Search_Price&search" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span
                                        class="hide-menu">Quản lí giá dịch vụ</span></a></li>
                            <!-- <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                    href="icon-material.html" aria-expanded="false"><i
                                        class="mdi me-2 mdi-emoticon"></i><span class="hide-menu">Icon</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                    href="map-google.html" aria-expanded="false"><i class="mdi me-2 mdi-earth"></i><span
                                        class="hide-menu">Google Map</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                    href="pages-blank.html" aria-expanded="false"><i
                                        class="mdi me-2 mdi-book-open-variant"></i><span class="hide-menu">Blank</span></a>
                            </li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                    href="pages-error-404.html" aria-expanded="false"><i
                                        class="mdi me-2 mdi-help-circle"></i><span class="hide-menu">Error 404</span></a>
                            </li>
                            <li class="text-center p-20 upgrade-btn">
                                <a href="https://www.wrappixel.com/templates/materialpro/"
                                    class="btn btn-warning text-white mt-4" target="_blank">Upgrade to
                                    Pro</a>
                            </li> -->
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
                            <h3 class="page-title mb-0 p-0">Trang Chủ</h3>
<!--                            <div class="d-flex align-items-center">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="admin.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                                    </ol>
                                </nav>
                            </div>-->
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
                    <!-- Sales chart -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <!-- <div class="row"> -->
                        <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <div class="icon text-center rounded-md">
                                        <i class="fa-solid fa-bed h3 mb-0"></i>
                                    </div>
                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">${sessionScope.patient}</h5>
                                        <p class="text-muted mb-0">Bệnh Nhân</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end col-->

                        <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <div class="icon text-center rounded-md">
                                        <i class="fa-solid fa-user-doctor h3 mb-0"></i>
                                    </div>
                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">${sessionScope.doctor}</h5>
                                        <p class="text-muted mb-0">Bác Sĩ</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end col-->

                        <!-- <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <div class="icon text-center rounded-md">
                                        <i class="fa-solid fa-file-contract h3 mb-0"></i>
                                    </div>
                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">112,000,000đ</h5>
                                        <p class="text-muted mb-0">Doanh Thu</p>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <!--end col-->

                        
                        <!--end col-->

                        <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <div class="icon text-center rounded-md">
                                        <i class="fa-solid fa-briefcase-medical h3 mb-0"></i>
                                    </div>
                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">${booking}</h5>
                                        <p class="text-muted mb-0">Lịch hẹn</p>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!--end col-->
                    </div>
                    <!-- Column -->
                    
                </div>
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
    <script src="assets/plugins/bootstrap/dist1/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="html/js/app-style-switcher.js" type="text/javascript"></script>
    <!--Wave Effects -->
    <script src="html/js/waves.js" type="text/javascript"></script>
    <!--Menu sidebar -->
    <script src="html/js/sidebarmenu.js" type="text/javascript"></script>
    <!-- ============================================================== -->
    <!-- This page plugins -->
    <!-- ============================================================== -->
    <!-- chartist chart -->
    <script src="assets/plugins/chartist-js/dist1/chartist.min.js" type="text/javascript"></script>
    <script src="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js" type="text/javascript"></script>
    <!--c3 JavaScript -->
    <script src="assets/plugins/d3/d3.min.js" type="text/javascript"></script>
    <script src="assets/plugins/c3-master/c3.min.js" type="text/javascript"></script>
    <!--Custom JavaScript -->
    <script src="html/js/pages/dashboards/dashboard1.js" type="text/javascript"></script>
    <script src="html/js/custom.js" type="text/javascript"></script>
</body>
</html>
