<%-- 
    Document   : manageDoctor
    Created on : Jun 17, 2022, 10:09:37 PM
    Author     : QUANG VAN
--%>

<%@page import="sample.booking.ScheduleDTO"%>
<%@page import="sample.user.DoctorDTO"%>
<%@page import="java.util.List"%>
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
        <title>manageSchedule</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
            }

            String searchSC = request.getParameter("searchSC");
            if (searchSC == null) {
                searchSC = "";
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
                            <!--<h3 class="page-title mb-0 p-0">Lịch Hoạt Động</h3>-->
                            <div class="d-flex align-items-center">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href=admin.jsp>Trang Chủ</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Lịch Hoạt Động</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        <div class="col-md-6 col-4 align-self-center">
                            <div class="text-end upgrade-btn">
                                <a href="slot.jsp"
                                   class="btn btn-danger d-none d-md-inline-block text-white" target="_blank">Cập nhật lịch hoạt động</a>
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
                                                <input type="text" name="searchSC" class="form-control" value="<%=searchSC%>" placeholder="Tìm kiếm lịch hoạt động..."/>
                                                <input type="hidden" name="action"  value="SearchSC" />
                                            </div>
                                            <button type="submit" class="btn btn-success d-md-inline-block text-white">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                    <div class="table-responsive">
                                        <%  List<DoctorDTO> list = (List<DoctorDTO>) request.getAttribute("LIST_DOCTOR_SC");
                                            if (list != null) {
                                                if (!list.isEmpty()) {
                                        %>
                                        <table class="table user-table">
                                            <thead>
                                                <tr>
                                                    <th>NO</th>
                                                    <th>ID</th>
                                                    <th>Ảnh</th>
                                                    <th>Bác sĩ</th>
                                                    <th>Chuyên môn</th>
                                                    <th>Ca</th>
                                                    <th>Ngày làm việc</th> 
                                                    <th>Ngày cập nhật</th>>
                                                    <th>Tạo Lịch</th>
                                                    <th>Xoá lịch</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    int count = 1;
                                                    for (DoctorDTO doctor : list) {
                                                %>
                                            <form action="MainController">
                                                <tr>

                                                    <td><%=count++%></td>
                                                    <td><%=doctor.getUserID()%>
                                                        <input type="hidden" name="doctorID" value="<%=doctor.getUserID()%>"/>
                                                    </td>
                                                    <td>
                                                        <img src="./images/doctors/<%=doctor.getImage()%>" style="width: 60px; height: 100px" alt="alt"/>
                                                    </td> 
                                                    <td><%=doctor.getFullName()%></td>                             
                                                    <td><%=doctor.getCategoryName()%></td>
                                                    <td><%=doctor.getShift()%>
                                                        <input type="hidden" name="shift" value="<%=doctor.getShift()%>"/>
                                                    </td>                             
                                                    <td>

                                                        <%
                                                            List<ScheduleDTO> listSC = (List<ScheduleDTO>) request.getAttribute("LIST_SC_ALL");
                                                            if (list != null) {
                                                                if (!list.isEmpty()) {
                                                                    for (ScheduleDTO schedule : listSC) {
                                                                        if (doctor.getUserID().equals(schedule.getDoctorID())) {
                                                        %>
                                                        <div>
                                                            <%=schedule.getDayWork()%> </br>
                                                        </div>
                                                        <%
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        %>

                                                    </td>
                                                    <td>
                                                        <div id="dayofW" >
                                                            <input type="checkbox"  name="day1" value="Monday"/>Monday </br> 
                                                            <input type="checkbox"  name="day2" value="Tuesday"/>Tuesday</br>                                                  
                                                            <input type="checkbox"  name="day3" value="Wednesday"/>Wednesday</br>                                                  
                                                            <input type="checkbox"  name="day4" value="Thursday"/>Thursday</br>                                                  
                                                            <input type="checkbox"  name="day5" value="Friday"/>Friday</br>                                                  
                                                            <input type="checkbox"  name="day6" value="Saturday"/>Saturday</br>                                                  
                                                            <input type="checkbox"  name="day7" value="Sunday"/>Sunday</br> 
                                                        </div>
                                                    </td>
                                                    <td>                     
                                                        <button type="submit" name="action" value="CreateSC" class="btn btn-success d-none d-md-inline-block text-white">
                                                            <i class="fa-solid fa-circle-plus"></i>
                                                        </button>
                                                    </td>
                                                    <td>                
                                                        <button type="submit" name="action" value="DeleteSC" class="btn btn-danger d-none d-md-inline-block text-white">
                                                            <i class="fa-solid fa-trash-can"></i>
                                                        </button>
                                                    </td>

                                                </tr>
                                            </form>
                                            <%
                                                }
                                            %>
                                            </tbody>
                                            <!----------------------------------------------------------->
                                        </table>
                                        <%
                                            String mess_UD = (String) request.getAttribute("MESS_UD");
                                            if (mess_UD == null) {
                                                mess_UD = "";
                                            }
                                            String mess = (String) request.getAttribute("MESS");
                                            if (mess == null) {
                                                mess = "";
                                            }
                                        %>
                                        <h6><%=mess_UD%></h6>
                                        <h6><%=mess%></h6>
                                        <%
                                                }
                                            }
                                        %> 
                                    </div>
                                    <c:set var="page" value="${sessionScope.page}"/>
                                    <c:forEach begin="${1}" end="${sessionScope.number}" var="i">
                                        <button class="btn btn-success d-none d-md-inline-block text-white">
                                            <a class="${i==page?"active":""}" style="color: #FFF" href="MainController?action=SearchSC&searchSC=${i}">${i}</a>
                                        </button>
                                    </c:forEach>
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
        <script>

        </script>
    </body>
</html>
