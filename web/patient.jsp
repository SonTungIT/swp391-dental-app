<%-- 
    Document   : patient
    Created on : Jun 7, 2022, 7:15:28 PM
    Author     : Xqy
--%>

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
    </head>
    <body>
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
                                    <img src="./images/sontung.jpg" alt="user" class="profile-pic me-2">Sơn Tùng MTP
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
                                                         href="index.jsp" aria-expanded="false"><i class="mdi me-2 mdi-gauge"></i><span
                                        class="hide-menu">Trang Chủ</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="patient.jsp" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
                                        class="hide-menu">Hồ Sơ</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="historyBooking.jsp" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
                                        class="hide-menu">Lịch Sử Đặt Lịch</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="#s" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
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
                        <div class="col-md-6 col-4 align-self-center">
                            <div class="text-end upgrade-btn">
                                <a href="https://www.wrappixel.com/templates/materialpro/"
                                   class="btn btn-danger d-none d-md-inline-block text-white" target="_blank">Patient</a>
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
                            <div class="card">
                                <div class="card-body profile-card">
                                    <center class="mt-4"> <img src="./images/sontung.jpg"
                                                               class="rounded-circle" width="150" />
                                        <h4 class="card-title mt-2">Sơn Tùng MTP</h4>
                                        <!--                                        <div class="row text-center justify-content-center">
                                                                                    <div class="col-4">
                                                                                        <a href="javascript:void(0)" class="link">
                                                                                            <i class="icon-people" aria-hidden="true"></i>
                                                                                            <span class="value-digit">254</span>
                                                                                        </a></div>
                                                                                    <div class="col-4">
                                                                                        <a href="javascript:void(0)" class="link">
                                                                                            <i class="icon-picture" aria-hidden="true"></i>
                                                                                            <span class="value-digit">54</span>
                                                                                        </a></div>
                                                                                </div>-->
                                    </center>
                                </div>
                            </div>
                        </div>
                        <!-- Column -->
                        <!-- Column -->
                        <div class="col-lg-8 col-xlg-9 col-md-7">
                            <div class="card">
                                <div class="card-body">
                                    <form class="form-horizontal form-material mx-2">
                                        <div class="form-group">
                                            <label class="col-md-12 mb-0">Họ và Tên</label>
                                            <div class="col-md-12">
                                                <input type="text" placeholder="Sơn Tùng MTP"
                                                       class="form-control ps-0 form-control-line">
                                            </div>
                                        </div>
<!--                                        <div class="form-group">
                                            <label class="col-md-12 mb-0">Password</label>
                                            <div class="col-md-12">
                                                <input type="password" value="password"
                                                       class="form-control ps-0 form-control-line">
                                            </div>
                                        </div>-->
                                        <div class="form-group">
                                            <label class="col-md-12 mb-0">Giới Tính</label>
                                            <div class="col-md-12">
                                                <input type="text" placeholder="Nam"
                                                       class="form-control ps-0 form-control-line">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12 mb-0">Địa Chỉ</label>
                                            <div class="col-md-12">
                                                <input type="text" placeholder="Hồ Chí Minh"
                                                       class="form-control ps-0 form-control-line">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12 mb-0">Ngày Tháng Năm Sinh</label>
                                            <div class="col-md-12">
                                                <input type="text" placeholder="2001-02-12"
                                                       class="form-control ps-0 form-control-line">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="example-email" class="col-md-12">Email</label>
                                            <div class="col-md-12">
                                                <input type="email" placeholder="johnathan@admin.com"
                                                       class="form-control ps-0 form-control-line" name="example-email"
                                                       id="example-email">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-12 mb-0">Số Điện Thoại</label>
                                            <div class="col-md-12">
                                                <input type="text" placeholder="123 456 7890"
                                                       class="form-control ps-0 form-control-line">
                                            </div>
                                        </div>
<!--                                        <div class="form-group">
                                            <label class="col-md-12 mb-0">Message</label>
                                            <div class="col-md-12">
                                                <textarea rows="5" class="form-control ps-0 form-control-line"></textarea>
                                            </div>
                                        </div>-->
                                        <!--                                        <div class="form-group">
                                                                                    <label class="col-sm-12">Select Country</label>
                                                                                    <div class="col-sm-12 border-bottom">
                                                                                        <select class="form-select shadow-none ps-0 border-0 form-control-line">
                                                                                            <option>London</option>
                                                                                            <option>India</option>
                                                                                            <option>Usa</option>
                                                                                            <option>Canada</option>
                                                                                            <option>Thailand</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>-->
                                        <div class="form-group">
                                            <div class="col-sm-12 d-flex">
                                                <button class="btn btn-success mx-auto mx-md-0 text-white">Cập Nhật</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
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
