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
                                                         href="feedback.jsp" aria-expanded="false"><i class="mdi me-2 mdi-table"></i><span
                                        class="hide-menu">FeedBack</span></a></li>
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
                        <div class="col-xl-2 col-lg-6 col-md-4 mt-4">
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

                        <div class="col-xl-2 col-lg-6 col-md-4 mt-4">
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

                        <div class="col-xl-2 col-lg-6 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <div class="icon text-center rounded-md">
                                        <i class="fa-solid fa-briefcase-medical h3 mb-0"></i>
                                    </div>
                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">${sessionScope.view}</h5>
                                        <p class="text-muted mb-0">Số lượng truy cập web</p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--end col-->

                        <div class="col-xl-2 col-lg-6 col-md-4 mt-4">
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
                        <div class="col-xl-2 col-lg-6 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <div class="icon text-center rounded-md">
                                        <i class="fa-solid fa-briefcase-medical h3 mb-0"></i>
                                    </div>
                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">${sessionScope.numberBookingInOneWeek}</h5>
                                        <p class="text-muted mb-0">Lịch hẹn trong 1 tuần</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--end col-->
                    </div>
                    <!-- Column -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="d-flex flex-wrap align-items-center">
                                            <div>
                                                <h5 class="card-title">Thống Kê Số Lịch Hẹn</h3>
                                            </div>
                                            <div class="ms-lg-auto mx-sm-auto mx-lg-0">
                                                <ul class="list-inline d-flex">
                                                    <li class="me-4">
                                                        <h6 class="text-success"><i
                                                                class="fa fa-circle font-10 me-2 "></i>Lịch hẹn</h6>
                                                    </li>
                                                    <li>
                                                        <h6 class="text-info"><i
                                                                class="fa fa-circle font-10 me-2"></i>Lịch hẹn trong 1 tuần
                                                        </h6>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="amp-pxl" style="height: 360px;">
                                            <div class="chartist-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Sales chart -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-6 col-xlg-9">
                        <div class="card">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs profile-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-bs-toggle="tab" href="#" role="tab">
                                        <i class="fa-solid fa-table"></i>
                                        Danh sách lịch hẹn dịch vụ hôm nay
                                    </a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="home" role="tabpanel">
                                    <div class="card-body">
                                        <div class="profiletimeline border-start-0">
                                            <div class="sl-item">
                                                <div class="sl-left"> <img src="assets/images/users/1.jpg" alt="user"
                                                                           class="img-circle"> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link">John Doe</a> <span class="sl-date">5
                                                            minutes ago</span>
                                                        <p>assign a new task <a href="#"> Design weblayout</a></p>
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img1.jpg" alt="user"
                                                                    class="img-responsive radius w-100"></div>
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img2.jpg" alt="user"
                                                                    class="img-responsive radius w-100"></div>
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img3.jpg" alt="user"
                                                                    class="img-responsive radius w-100"></div>
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img4.jpg" alt="user"
                                                                    class="img-responsive radius w-100"></div>
                                                        </div>
                                                        <div class="like-comm"> <a href="javascript:void(0)"
                                                                                   class="link me-2">2
                                                                comment</a> <a href="javascript:void(0)"
                                                                           class="link me-2"><i class="fa fa-heart text-danger"></i> 5
                                                                Love</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="sl-item">
                                                <div class="sl-left"> <img src="../assets/images/users/2.jpg" alt="user"
                                                                           class="img-circle"> </div>
                                                <div class="sl-right">
                                                    <div> <a href="#" class="link">John Doe</a> <span class="sl-date">5
                                                            minutes ago</span>
                                                        <div class="mt-3 row">
                                                            <div class="col-md-3 col-xs-12"><img
                                                                    src="../assets/images/big/img1.jpg" alt="user"
                                                                    class="img-responsive w-100 radius"></div>
                                                            <div class="col-md-9 col-xs-12">
                                                                <p> Lorem ipsum dolor sit amet, consectetur adipiscing
                                                                    elit. Integer nec odio. Praesent libero. Sed cursus
                                                                    ante dapibus diam. </p> <a href="#"
                                                                                           class="btn btn-success text-white"> Design
                                                                    weblayout</a>
                                                            </div>
                                                        </div>
                                                        <div class="like-comm mt-3"> <a href="javascript:void(0)"
                                                                                        class="link me-2">2 comment</a> <a href="javascript:void(0)"
                                                                                        class="link me-2"><i class="fa fa-heart text-danger"></i> 5
                                                                Love</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="sl-item">
                                                <div class="sl-left"> <img src="../assets/images/users/3.jpg" alt="user"
                                                                           class="img-circle"> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link">John Doe</a> <span class="sl-date">5
                                                            minutes ago</span>
                                                        <p class="mt-2"> Lorem ipsum dolor sit amet, consectetur
                                                            adipiscing elit. Integer nec odio. Praesent libero. Sed
                                                            cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh
                                                            elementum imperdiet. Duis sagittis ipsum. Praesent mauris.
                                                            Fusce nec tellus sed augue semper </p>
                                                    </div>
                                                    <div class="like-comm mt-3"> <a href="javascript:void(0)"
                                                                                    class="link me-2">2
                                                            comment</a> <a href="javascript:void(0)" class="link me-2"><i
                                                                class="fa fa-heart text-danger"></i>
                                                            5 Love</a> </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="sl-item">
                                                <div class="sl-left"> <img src="../assets/images/users/4.jpg" alt="user"
                                                                           class="img-circle"> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link">John Doe</a> <span class="sl-date">5
                                                            minutes ago</span>
                                                        <blockquote class="mt-2">
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                            sed do eiusmod tempor incididunt
                                                        </blockquote>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--second tab-->
                                <div class="tab-pane" id="profile" role="tabpanel">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-3 col-xs-6 b-r"> <strong>Full Name</strong>
                                                <br>
                                                <p class="text-muted">Johnathan Deo</p>
                                            </div>
                                            <div class="col-md-3 col-xs-6 b-r"> <strong>Mobile</strong>
                                                <br>
                                                <p class="text-muted">(123) 456 7890</p>
                                            </div>
                                            <div class="col-md-3 col-xs-6 b-r"> <strong>Email</strong>
                                                <br>
                                                <p class="text-muted">johnathan@admin.com</p>
                                            </div>
                                            <div class="col-md-3 col-xs-6"> <strong>Location</strong>
                                                <br>
                                                <p class="text-muted">London</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <p class="mt-4">Donec pede justo, fringilla vel, aliquet nec, vulputate eget,
                                            arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam
                                            dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus
                                            elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula,
                                            porttitor eu, consequat vitae, eleifend ac, enim.</p>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                            Lorem Ipsum has been the industry's standard dummy text ever since the
                                            1500s, when an unknown printer took a galley of type and scrambled it to
                                            make a type specimen book. It has survived not only five centuries </p>
                                        <p>It was popularised in the 1960s with the release of Letraset sheets
                                            containing Lorem Ipsum passages, and more recently with desktop publishing
                                            software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                        <h4 class="font-medium mt-4">Skill Set</h4>
                                        <hr>
                                        <h5 class="d-flex mt-4">Wordpress <span class="ms-auto">80%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="80"
                                                 aria-valuemin="0" aria-valuemax="100" style="width:80%; height:6px;">
                                                <span class="sr-only">50% Complete</span>
                                            </div>
                                        </div>
                                        <h5 class="d-flex mt-4">HTML 5 <span class="ms-auto">90%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-info" role="progressbar" aria-valuenow="90"
                                                 aria-valuemin="0" aria-valuemax="100" style="width:90%; height:6px;">
                                                <span class="sr-only">50% Complete</span>
                                            </div>
                                        </div>
                                        <h5 class="d-flex mt-4">jQuery <span class="ms-auto">50%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="50"
                                                 aria-valuemin="0" aria-valuemax="100" style="width:50%; height:6px;">
                                                <span class="sr-only">50% Complete</span>
                                            </div>
                                        </div>
                                        <h5 class="d-flex mt-4">Photoshop <span class="ms-auto">70%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="70"
                                                 aria-valuemin="0" aria-valuemax="100" style="width:70%; height:6px;">
                                                <span class="sr-only">50% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="settings" role="tabpanel">
                                    <div class="card-body">
                                        <form class="form-horizontal form-material mx-2">
                                            <div class="form-group">
                                                <label class="col-md-12">Full Name</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder="Johnathan Doe"
                                                           class="form-control form-control-line ps-0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="example-email" class="col-md-12">Email</label>
                                                <div class="col-md-12">
                                                    <input type="email" placeholder="johnathan@admin.com"
                                                           class="form-control form-control-line ps-0" name="example-email"
                                                           id="example-email">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Password</label>
                                                <div class="col-md-12">
                                                    <input type="password" value="password"
                                                           class="form-control form-control-line ps-0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Phone No</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder="123 456 7890"
                                                           class="form-control form-control-line ps-0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Message</label>
                                                <div class="col-md-12">
                                                    <textarea rows="5"
                                                              class="form-control form-control-line ps-0"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-12">Select Country</label>
                                                <div class="col-sm-12 border-bottom">
                                                    <select class="form-select shadow-none border-0 form-control-line ps-0">
                                                        <option>London</option>
                                                        <option>India</option>
                                                        <option>Usa</option>
                                                        <option>Canada</option>
                                                        <option>Thailand</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button class="btn btn-success text-white">Update Profile</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xlg-9">
                        <div class="card">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs profile-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-bs-toggle="tab" href="#home" role="tab">
                                        <i class="fa-solid fa-table"></i>
                                        Danh sách lịch hẹn hôm nay
                                    </a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="home" role="tabpanel">
                                    <div class="card-body">
                                        <div class="profiletimeline border-start-0">
                                            <div class="sl-item">
                                                <div class="sl-left"> <img src="../assets/images/users/1.jpg" alt="user"
                                                                           class="img-circle"> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link">John Doe</a> <span class="sl-date">5
                                                            minutes ago</span>
                                                        <p>assign a new task <a href="#"> Design weblayout</a></p>
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img1.jpg" alt="user"
                                                                    class="img-responsive radius w-100"></div>
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img2.jpg" alt="user"
                                                                    class="img-responsive radius w-100"></div>
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img3.jpg" alt="user"
                                                                    class="img-responsive radius w-100"></div>
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img4.jpg" alt="user"
                                                                    class="img-responsive radius w-100"></div>
                                                        </div>
                                                        <div class="like-comm"> <a href="javascript:void(0)"
                                                                                   class="link me-2">2
                                                                comment</a> <a href="javascript:void(0)"
                                                                           class="link me-2"><i class="fa fa-heart text-danger"></i> 5
                                                                Love</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="sl-item">
                                                <div class="sl-left"> <img src="../assets/images/users/2.jpg" alt="user"
                                                                           class="img-circle"> </div>
                                                <div class="sl-right">
                                                    <div> <a href="#" class="link">John Doe</a> <span class="sl-date">5
                                                            minutes ago</span>
                                                        <div class="mt-3 row">
                                                            <div class="col-md-3 col-xs-12"><img
                                                                    src="../assets/images/big/img1.jpg" alt="user"
                                                                    class="img-responsive w-100 radius"></div>
                                                            <div class="col-md-9 col-xs-12">
                                                                <p> Lorem ipsum dolor sit amet, consectetur adipiscing
                                                                    elit. Integer nec odio. Praesent libero. Sed cursus
                                                                    ante dapibus diam. </p> <a href="#"
                                                                                           class="btn btn-success text-white"> Design
                                                                    weblayout</a>
                                                            </div>
                                                        </div>
                                                        <div class="like-comm mt-3"> <a href="javascript:void(0)"
                                                                                        class="link me-2">2 comment</a> <a href="javascript:void(0)"
                                                                                        class="link me-2"><i class="fa fa-heart text-danger"></i> 5
                                                                Love</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="sl-item">
                                                <div class="sl-left"> <img src="../assets/images/users/3.jpg" alt="user"
                                                                           class="img-circle"> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link">John Doe</a> <span class="sl-date">5
                                                            minutes ago</span>
                                                        <p class="mt-2"> Lorem ipsum dolor sit amet, consectetur
                                                            adipiscing elit. Integer nec odio. Praesent libero. Sed
                                                            cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh
                                                            elementum imperdiet. Duis sagittis ipsum. Praesent mauris.
                                                            Fusce nec tellus sed augue semper </p>
                                                    </div>
                                                    <div class="like-comm mt-3"> <a href="javascript:void(0)"
                                                                                    class="link me-2">2
                                                            comment</a> <a href="javascript:void(0)" class="link me-2"><i
                                                                class="fa fa-heart text-danger"></i>
                                                            5 Love</a> </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="sl-item">
                                                <div class="sl-left"> <img src="../assets/images/users/4.jpg" alt="user"
                                                                           class="img-circle"> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link">John Doe</a> <span class="sl-date">5
                                                            minutes ago</span>
                                                        <blockquote class="mt-2">
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                            sed do eiusmod tempor incididunt
                                                        </blockquote>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--second tab-->
                                <div class="tab-pane" id="profile" role="tabpanel">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-3 col-xs-6 b-r"> <strong>Full Name</strong>
                                                <br>
                                                <p class="text-muted">Johnathan Deo</p>
                                            </div>
                                            <div class="col-md-3 col-xs-6 b-r"> <strong>Mobile</strong>
                                                <br>
                                                <p class="text-muted">(123) 456 7890</p>
                                            </div>
                                            <div class="col-md-3 col-xs-6 b-r"> <strong>Email</strong>
                                                <br>
                                                <p class="text-muted">johnathan@admin.com</p>
                                            </div>
                                            <div class="col-md-3 col-xs-6"> <strong>Location</strong>
                                                <br>
                                                <p class="text-muted">London</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <p class="mt-4">Donec pede justo, fringilla vel, aliquet nec, vulputate eget,
                                            arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam
                                            dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus. Vivamus
                                            elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula,
                                            porttitor eu, consequat vitae, eleifend ac, enim.</p>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                            Lorem Ipsum has been the industry's standard dummy text ever since the
                                            1500s, when an unknown printer took a galley of type and scrambled it to
                                            make a type specimen book. It has survived not only five centuries </p>
                                        <p>It was popularised in the 1960s with the release of Letraset sheets
                                            containing Lorem Ipsum passages, and more recently with desktop publishing
                                            software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                        <h4 class="font-medium mt-4">Skill Set</h4>
                                        <hr>
                                        <h5 class="d-flex mt-4">Wordpress <span class="ms-auto">80%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="80"
                                                 aria-valuemin="0" aria-valuemax="100" style="width:80%; height:6px;">
                                                <span class="sr-only">50% Complete</span>
                                            </div>
                                        </div>
                                        <h5 class="d-flex mt-4">HTML 5 <span class="ms-auto">90%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-info" role="progressbar" aria-valuenow="90"
                                                 aria-valuemin="0" aria-valuemax="100" style="width:90%; height:6px;">
                                                <span class="sr-only">50% Complete</span>
                                            </div>
                                        </div>
                                        <h5 class="d-flex mt-4">jQuery <span class="ms-auto">50%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="50"
                                                 aria-valuemin="0" aria-valuemax="100" style="width:50%; height:6px;">
                                                <span class="sr-only">50% Complete</span>
                                            </div>
                                        </div>
                                        <h5 class="d-flex mt-4">Photoshop <span class="ms-auto">70%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="70"
                                                 aria-valuemin="0" aria-valuemax="100" style="width:70%; height:6px;">
                                                <span class="sr-only">50% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="settings" role="tabpanel">
                                    <div class="card-body">
                                        <form class="form-horizontal form-material mx-2">
                                            <div class="form-group">
                                                <label class="col-md-12">Full Name</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder="Johnathan Doe"
                                                           class="form-control form-control-line ps-0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="example-email" class="col-md-12">Email</label>
                                                <div class="col-md-12">
                                                    <input type="email" placeholder="johnathan@admin.com"
                                                           class="form-control form-control-line ps-0" name="example-email"
                                                           id="example-email">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Password</label>
                                                <div class="col-md-12">
                                                    <input type="password" value="password"
                                                           class="form-control form-control-line ps-0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Phone No</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder="123 456 7890"
                                                           class="form-control form-control-line ps-0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Message</label>
                                                <div class="col-md-12">
                                                    <textarea rows="5"
                                                              class="form-control form-control-line ps-0"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-12">Select Country</label>
                                                <div class="col-sm-12 border-bottom">
                                                    <select class="form-select shadow-none border-0 form-control-line ps-0">
                                                        <option>London</option>
                                                        <option>India</option>
                                                        <option>Usa</option>
                                                        <option>Canada</option>
                                                        <option>Thailand</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button class="btn btn-success text-white">Update Profile</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Table -->
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
