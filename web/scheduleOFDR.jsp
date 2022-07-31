<%-- 
    Document   : doctor
    Created on : Jun 7, 2022, 7:15:13 PM
    Author     : Xqy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="d" class="sample.user.DoctorDAO" scope="request" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords"
              content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, materialpro admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, materialpro admin lite design, materialpro admin lite dashboard bootstrap 5 dashboard template">
        <meta name="description"
              content="Material Pro Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
        <meta name="robots" content="noindex,nofollow">
        <title>scheduleOFDR</title>
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
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("DR")) {
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
                                    <img src="./images/doctors/${LOGIN_USER.image}" style="width: 40px; height: 40px" alt="user" class="profile-pic me-2">${LOGIN_USER.userID}
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
                                                         href="ShowProfileDoctorController?doctorID=${LOGIN_USER.userID}" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
                                        class="hide-menu">Hồ Sơ</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="ShowScheduleForDRController?doctorID=${LOGIN_USER.getUserID()}" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
                                        class="hide-menu">Lịch Làm Việc</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="ManagePTBK_DRController?doctorID=${LOGIN_USER.getUserID()}" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
                                        class="hide-menu">Quản lý lịch hẹn</span></a></li>
                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                         href="UpdatePasswordDoctorController?doctorID=${LOGIN_USER.getUserID()}" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
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
                    <div class="row">
                        <!-- column -->
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table user-table" border="5" cellspacing="0" cellpadding="10">
                                            <thead>
                                                <tr>
                                                    <th class="border-top-0"><h4 style="text-align: center">Slot</h4></th>
                                                    <th class="border-top-0"><h4 style="text-align: center">Thứ 2</h4></th>
                                                    <th class="border-top-0"><h4 style="text-align: center">Thứ 3</h4></th>
                                                    <th class="border-top-0"><h4 style="text-align: center">Thứ 4</h4></th>
                                                    <th class="border-top-0"><h4 style="text-align: center">Thứ 5</h4></th>
                                                    <th class="border-top-0"><h4 style="text-align: center">Thứ 6</h4></th>
                                                    <th class="border-top-0"><h4 style="text-align: center">Thứ 7</h4></th>
                                                    <th class="border-top-0"><h4 style="text-align: center">Chủ nhật</h4></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <tr style="text-align: center">
                                                    <td style="margin-top: 10px">
                                                        <c:forEach items="${d.showAllSlot()}" var="s">
                                                            <button style="margin-bottom: 2px" class="btn btn-success mx-auto mx-md-0 text-white">${s.slotName}</button>
                                                            <hp style="text-align: left">${s.slotTime}</p></br>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:set scope="request" var="number" value="0"/>
                                                        <c:forEach items="${d.showAllSlot()}" var="s">
                                                            <c:forEach items="${listSC_FDR_1}" var="slot"> 
                                                                <c:if test="${slot.slotName eq s.slotName}">
                                                                   <button type="button" style="background-color: rgb(52 168 84)"  class="btn d-none d-md-inline-block text-white">
                                                                  <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                                    <c:set scope="request" var="number" value="1"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${number == 0}">
                                                                <button type="button"   class="btn btn-secondary d-md-inline-block text-white">
                                                                   <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                            </c:if>
                                                            <c:set scope="request" var="number" value="0"/>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:set scope="request" var="number" value="0"/>
                                                        <c:forEach items="${d.showAllSlot()}" var="s">
                                                            <c:forEach items="${listSC_FDR_2}" var="slot"> 
                                                                <c:if test="${slot.slotName eq s.slotName}">
                                                                   <button type="button" style="background-color: rgb(52 168 84)"  class="btn d-none d-md-inline-block text-white">
                                                                  <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                                    <c:set scope="request" var="number" value="1"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${number == 0}">
                                                                <button type="button"   class="btn btn-secondary d-md-inline-block text-white">
                                                                   <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                            </c:if>
                                                            <c:set scope="request" var="number" value="0"/>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:set scope="request" var="number" value="0"/>
                                                        <c:forEach items="${d.showAllSlot()}" var="s">
                                                            <c:forEach items="${listSC_FDR_3}" var="slot"> 
                                                                <c:if test="${slot.slotName eq s.slotName}">
                                                                   <button type="button" style="background-color: rgb(52 168 84)"  class="btn d-none d-md-inline-block text-white">
                                                                  <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                                    <c:set scope="request" var="number" value="1"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${number == 0}">
                                                                <button type="button"   class="btn btn-secondary d-md-inline-block text-white">
                                                                   <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                            </c:if>
                                                            <c:set scope="request" var="number" value="0"/>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:set scope="request" var="number" value="0"/>
                                                        <c:forEach items="${d.showAllSlot()}" var="s">
                                                            <c:forEach items="${listSC_FDR_4}" var="slot"> 
                                                                <c:if test="${slot.slotName eq s.slotName}">
                                                                   <button type="button" style="background-color: rgb(52 168 84)"  class="btn d-none d-md-inline-block text-white">
                                                                  <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                                    <c:set scope="request" var="number" value="1"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${number == 0}">
                                                                <button type="button"   class="btn btn-secondary d-md-inline-block text-white">
                                                                   <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                            </c:if>
                                                            <c:set scope="request" var="number" value="0"/>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:set scope="request" var="number" value="0"/>
                                                        <c:forEach items="${d.showAllSlot()}" var="s">
                                                            <c:forEach items="${listSC_FDR_5}" var="slot"> 
                                                                <c:if test="${slot.slotName eq s.slotName}">
                                                                   <button type="button" style="background-color: rgb(52 168 84)"  class="btn d-none d-md-inline-block text-white">
                                                                  <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                                    <c:set scope="request" var="number" value="1"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${number == 0}">
                                                                <button type="button"   class="btn btn-secondary d-md-inline-block text-white">
                                                                    <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                            </c:if>
                                                            <c:set scope="request" var="number" value="0"/>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                      <c:set scope="request" var="number" value="0"/>
                                                        <c:forEach items="${d.showAllSlot()}" var="s">
                                                            <c:forEach items="${listSC_FDR_6}" var="slot"> 
                                                                <c:if test="${slot.slotName eq s.slotName}">
                                                                   <button type="button" style="background-color: rgb(52 168 84)"  class="btn d-none d-md-inline-block text-white">
                                                                   <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                                    <c:set scope="request" var="number" value="1"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${number == 0}">
                                                                <button type="button"   class="btn btn-secondary d-md-inline-block text-white">
                                                                    <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                            </c:if>
                                                            <c:set scope="request" var="number" value="0"/>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:set scope="request" var="number" value="0"/>
                                                        <c:forEach items="${d.showAllSlot()}" var="s">
                                                            <c:forEach items="${listSC_FDR_7}" var="slot"> 
                                                                <c:if test="${slot.slotName eq s.slotName}">
                                                                   <button type="button" style="background-color: rgb(52 168 84)"  class="btn d-none d-md-inline-block text-white">
                                                                   <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                                    <c:set scope="request" var="number" value="1"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${number == 0}">
                                                                <button type="button"   class="btn btn-secondary d-md-inline-block text-white">
                                                                    <i class="fa-solid fa-check"></i>
                                                                </button>  </br></br></br>
                                                            </c:if>
                                                            <c:set scope="request" var="number" value="0"/>
                                                        </c:forEach>

                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
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
