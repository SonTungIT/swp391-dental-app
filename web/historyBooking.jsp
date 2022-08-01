<%-- 
    Document   : patient
    Created on : Jun 7, 2022, 7:15:28 PM
    Author     : Xqy
--%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="sample.booking.BookingDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
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
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("PT")) {
                response.sendRedirect("login.jsp");
            }

            String search = request.getParameter("searchHSBK");
            if (search == null) {
                search = "";
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
                                    <img src="./images/customers/${LOGIN_USER.image}" style="width: 40px; height: 40px" alt="user" class="profile-pic me-2">${LOGIN_USER.userID}
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
                                                         href="MainController?action=SearchHSBK&searchHSBK" aria-expanded="false"><i class="mdi me-2 mdi-account-check"></i><span
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
                            <div class="d-flex align-items-center">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Người dùng</li>
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
                                    <form action="MainController">
                                        <div class="input-group">
                                            <div class="form-outline">
                                                <input type="text" name="searchHSBK" value="<%=search%>" id="form1" class="form-control"
                                                       placeholder="Tìm kiếm dịch vụ...">
                                            </div>

                                            <button type="submit" name="action" value="SearchHSBK" class="btn btn-success">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                    <div class="table-responsive" style="display: none" id="div1">
                                        <%  List<BookingDTO> list = (List<BookingDTO>) request.getAttribute("LIST_HISTORY_BK");
                                            if (list != null) {
                                                if (!list.isEmpty()) {
                                        %>
                                        <table class="table user-table">
                                            <thead>
                                                <tr>
                                                    <th class="border-top-0">No</th>
                                                    <th class="border-top-0">Dịch vụ</th>
                                                    <th class="border-top-0">Bác sĩ</th>
                                                    <th class="border-top-0">Ngày hẹn</th>
                                                    <th class="border-top-0">Giờ hẹn</th>
                                                    <th class="border-top-0">Trạng thái</th>
                                                    <th class="border-top-0">Đánh giá</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    int count = 1;
                                                    for (BookingDTO bk : list) {
                                                %>
                                            <form action="MainController">
                                                <input type="hidden" name="searchHSBK" value="<%=search%>"/>
                                                <input type="hidden" name="bookingID" value="<%=bk.getBookingID()%>"/>

                                                <tr>
                                                    <td>
                                                        <%=count++%>
                                                    </td>
                                                    <td>
                                                        <%=bk.getServiceName()%>
                                                        <input type="hidden" name="serviceID" value="<%=bk.getServiceID()%>" />
                                                        <input type="hidden" name="serviceName" value="<%=bk.getServiceName()%>" />
                                                    </td>
                                                    <td>
                                                        <%=bk.getDoctorName()%>
                                                        <input type="hidden" name="doctorID" value="<%=bk.getDoctorID()%>" />
                                                        <input type="hidden" name="doctorName" value="<%=bk.getDoctorName()%>" />
                                                    </td>
                                                    <td>
                                                        <%=bk.getDateBooking()%>
                                                        <input type="hidden" name="dateBooking" value="<%=bk.getDateBooking()%>" />
                                                    </td>
                                                    <td>
                                                        <%=bk.getTimeBooking()%>
                                                        <input type="hidden" name="timeBooking" value="<%=bk.getTimeBooking()%>" />
                                                    </td>
                                                    <td>

                                                        <input type="hidden" name="timeBooking" value=" <%=bk.getStatus()%>" />
                                                        <%

                                                            if (bk.getStatus().equals("Active")) {

                                                        %>
                                                        <!--Đang chờ-->
                                                        <button type="button" style="background-color: rgb(251 188 5)" class="btn d-none d-md-inline-block text-white">
                                                            <i class="fa-solid fa-hourglass"></i>
                                                        </button>
                                                        <!--Xóa-->
                                                        <button type="submit" name="action" value="CancelBK" class="btn btn-danger d-none d-md-inline-block text-white">
                                                            <i class="fa-solid fa-trash-can"></i>
                                                        </button>
                                                        <%                                                        } else {
                                                        %>
                                                        <!--Hoàn Thành-->
                                                        <button type="button" style="background-color: rgb(52 168 84)"  class="btn d-none d-md-inline-block text-white">
                                                            <i class="fa-solid fa-clipboard-check"></i>
                                                        </button>

                                                    </td>
                                                    <!--đánh giá-->
                                                    <td>
                                                        <button  type="submit" name="action" value="ShowBookingDetail" class="btn btn-success d-none d-md-inline-block text-white">
                                                            <i class="fa-solid fa-comment-dots"></i>
                                                        </button>
                                                    </td>
                                                    <%
                                                        }
                                                    %>
                                                </tr>

                                            </form>

                                            <%                                                }
                                            %>
                                            </tbody>
                                        </table>
                                        <%
                                                }
                                            }
                                        %> 
                                    </div>
                                </div>


                                <div class="table-responsive" style="display: block" id="div2">
                                    <%  List<BookingDTO> list2 = (List<BookingDTO>) request.getAttribute("LIST_HISTORY_BK_AT");
                                        if (list2 != null) {
                                            if (!list2.isEmpty()) {
                                    %>
                                    <table class="table user-table">
                                        <thead>
                                            <tr>
                                                <th class="border-top-0">No</th>
                                                <th class="border-top-0">Dịch vụ</th>
                                                <th class="border-top-0">Bác sĩ</th>
                                                <th class="border-top-0">Ngày hẹn</th>
                                                <th class="border-top-0">Giờ hẹn</th>
                                                <th class="border-top-0">Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 1;
                                                for (BookingDTO bk : list2) {
                                            %>
                                        <form action="MainController">
                                            <input type="hidden" name="searchHSBK" value="<%=search%>"/>
                                            <input type="hidden" name="bookingID" value="<%=bk.getBookingID()%>"/>

                                            <tr>
                                                <td>
                                                    <%=count++%>
                                                </td>
                                                <td>
                                                    <%=bk.getServiceName()%>
                                                    <input type="hidden" name="serviceID" value="<%=bk.getServiceID()%>" />
                                                    <input type="hidden" name="serviceName" value="<%=bk.getServiceName()%>" />
                                                </td>
                                                <td>
                                                    <%=bk.getDoctorName()%>
                                                    <input type="hidden" name="doctorID" value="<%=bk.getDoctorID()%>" />
                                                    <input type="hidden" name="doctorName" value="<%=bk.getDoctorName()%>" />
                                                </td>
                                                <td>
                                                    <%=bk.getDateBooking()%>
                                                    <input type="hidden" name="dateBooking" value="<%=bk.getDateBooking()%>" />
                                                </td>
                                                <td>
                                                    <%=bk.getTimeBooking()%>
                                                    <input type="hidden" name="timeBooking" value="<%=bk.getTimeBooking()%>" />
                                                </td>
                                                <td>

                                                    <input type="hidden" name="timeBooking" value=" <%=bk.getStatus()%>" />

                                                    <!--Đang chờ-->
                                                    <button type="button" style="background-color: rgb(251 188 5)" class="btn d-none d-md-inline-block text-white">
                                                        <i class="fa-solid fa-hourglass"></i>
                                                    </button>
                                                    <!--Xóa-->
                                                    <button type="submit" name="action" value="CancelBK" class="btn btn-danger d-none d-md-inline-block text-white">
                                                        <i class="fa-solid fa-trash-can"></i>
                                                    </button>
                                                </td>
                                                <!--đánh giá-->
                                            </tr>

                                        </form>
                                        <%                                                }
                                        %>
                                        </tbody>
                                    </table>
                                    <%
                                            }
                                        }
                                    %> 
                                    <button  type="button" onclick="showall()" class="btn btn-success d-none d-md-inline-block text-white">
                                        Xem thêm
                                    </button></br>
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
<!--            <footer class="footer"> © 2022 Nha Khoa Thiên Thần by <a href="index.jsp">nhakhoathienthan.vn</a>
            </footer>-->
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
    <script>
                                        function showall() {
                                            document.getElementById("div1").style.display = "block";
                                            document.getElementById("div2").style.display = "none";
                                        }
    </script>
</body>
</html>
