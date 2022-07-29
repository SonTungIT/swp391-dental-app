<%-- 
    Document   : createservice
    Created on : Jun 20, 2022, 8:47:16 AM
    Author     : dangk
--%>

<%@page import="sample.services.CategoryServiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.AdminDAO"%>
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
        <title>create service page</title>
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
                        <a class="navbar-brand ms-4" href="admin.jsp">
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
                            <h3 class="page-title mb-0 p-0"> Service</h3>
                            <div class="d-flex align-items-center">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page"> Service</li>
                                        <li class="breadcrumb-item active" aria-current="page">Create Service</li>
                                        
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        <div class="col-md-6 col-4 align-self-center">
                            <div class="text-end upgrade-btn">
                                <a href="#"
                                   class="btn btn-danger d-none d-md-inline-block text-white" target="_blank">Admin</a>
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
                    <div class="row">
                        <!-- column -->
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">    
                                        <form action="MainController"  class="form-horizontal form-material mx-2">
                                            <table class="table user-table">
                                                <tbody>

                                                    <tr>
                                                        <div class="form-group">
                                                    <td class="border-top-0">Tên Dịch Vụ</td>
                                                    <div class="col-md-12">
                                                        <td>  
                                                            <input class="form-control ps-0 form-control-line" type="text" name="serviceName" placeholder="nhập tên dịch vụ" required="">
                                                        </td> 
                                                    </div>
                                                </div>
                                                    </tr>
                                                    <tr >
                                                        <td class="border-top-0">Ảnh</td>
                                                        <td><input type="file" name="image" required=""/></td>
                                                    </tr>
                                                    <tr >
                                                        <td class="border-top-0">Category ID</td>
                                                        <td>
                                                            <select name="categoryID" id="categoryID" required=""> 
                                                        <option class="form-option" >---Loại Dịch Vụ---</option>
                                                        <%
                                                            AdminDAO dao = new AdminDAO();
                                                            List<CategoryServiceDTO> listCategory = dao.getListCategory_SV();
                                                            if (listCategory != null) {
                                                                if (listCategory.size() > 0) {
                                                                    for (CategoryServiceDTO category : listCategory) {

                                                        %> 
                                                        <option class="form-option" value="<%=category.getCategoryID()%>"><%= category.getCategoryID() %> : <%= category.getCategoryName()%></option>
                                                            <%
                                                                    }
                                                                }
                                                            }
                                                        %>
                                                        </select>
                                                    </td>
                                                    </tr>
                                                    <tr >
                                                        <td class="border-top-0">Chi Phí</td>
                                                        <td><input class="form-control ps-0 form-control-line" type="text" name="price" placeholder="nhập số tiền" required=""/></td>
                                                    </tr>
                                                    <tr >
                                                     <div class="form-group">
                                                    <td class="border-top-0">Nội Dung </td>
                                                    <div class="col-md-12">
                                                        <td>
                                                        <textarea rows="5" class="form-control ps-0 form-control-line" type="text" name="aboutSV"  placeholder="nhập nội dung" required=""></textarea>
                                                        </td>
                                                    </div>
                                                        </div>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td><input type="hidden" name="status"  value="false" /></td>
                                                    </tr>


                                                </tbody>
                                            </table>

                                            <td>
                                                <button class="btn btn-success mx-auto mx-md-0 text-white" type="submit" name="action" value="Create_Service">Tạo</button>
                                                <input type="reset"  value="Reset" class="btn btn-success d-none d-md-inline-block text-white" target="_blank" />
                                            </td>
                                        </form>
                                                        <h6>${MESS_UP}</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
