<%-- 
    Document   : booking
    Created on : Jun 6, 2022, 12:15:47 PM
    Author     : Lenovo Legion
--%>


<%@page import="sample.services.CategoryServiceDTO"%>
<%@page import="sample.user.PatientDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="sample.booking.ScheduleDTO"%>
<%@page import="sample.user.AdminDAO"%>
<%@page import="sample.services.ServiceDTO"%>
<%@page import="sample.booking.SlotDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="java.sql.Date"%>

<%@page import="sample.user.DoctorDTO"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:set var="txtSearch" value="${param.txtSearchValue}"/>

        <title>Dental Health Medical Category Flat Bootstrap Responsive Website Template | Contact :: W3layouts</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Dental Health Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);
            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>

        <!-- css files -->
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/bkstyle.css" rel="stylesheet" type="text/css"/>
        <!-- //css files -->

        <!-- google fonts -->
        <link
            href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
            rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&amp;subset=latin-ext"
              rel="stylesheet">
        <!-- //google fonts -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    </head>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("PT")) {
                response.sendRedirect("login.jsp");
            }

            String patientID = loginUser.getUserID();
            if (patientID == null) {
                patientID = "";
            }

            String sID = request.getParameter("serviceID");
            if (sID == null) {
                sID = "";
            }
            String sName = request.getParameter("serviceName");
            if (sName == null) {
                sName = "Dịch Vụ";
            }
            String drID = request.getParameter("doctorID");
            if (drID == null) {
                drID = "";
            }
            String drName = (String) request.getAttribute("doctorName");
            if (drName == null) {
                drName = "Bác Sĩ";
            }
            String dateBooking = request.getParameter("bookingDate");
            if (dateBooking == null) {
                dateBooking = "";
            }
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
            String errorTime = (String) request.getAttribute("ERROR_TIME");
            if (errorTime == null) {
                errorTime = "";
            }
            String errorDate = (String) request.getAttribute("ERROR_NULLDATE");
            if (errorDate == null) {
                errorDate = "";
            }
            String mess = (String) request.getAttribute("MESSAGE_CRBK");
            if (mess == null) {
                mess = "";
            }
            String slot_doctorEmmty = (String) request.getAttribute("NOSLOT");
            if (slot_doctorEmmty == null) {
                slot_doctorEmmty = "";
            }
        %>

        <!-- top header -->
        <div class="header-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-4">
                        <ul class="d-lg-flex header-w3_pvt">
                            <li class="mr-lg-3">
                                <span class="fa fa-envelope-open"></span>
                                <a href="mailto:phongkhamnhakhoathienthan@gmail.com" class="">phongkhamnhakhoathienthan@gmail.com</a>
                            </li>
                        </ul>
                        <ul class="d-lg-flex header-w3_pvt">
                            <li class="mr-lg-3">
                                <span class=""><span class="fa fa-phone"></span>Liên hệ +12 345 678</span>
                            </li>
                        </ul>
                    </div>

                    <div class="col-sm-4">
                        <ul class="d-lg-flex">
                            <form action="SearchInformationController" >
                                <div class="tech-btm d-lg-flex">
                                    <div class="form-outline">
                                        <input type="text" name="txtSearch" class="form-control px-2" value="${param.txtSearchValue}" placeholder="Tìm Kiếm"/>
                                        <input type="hidden" name="index" value="1"/>
                                    </div>
                                    <button type="submit" name="action" value="Tìm kiếm" class="btn btn-success">
                                        <i class="fas fa-search"></i>
                                    </button>

                                </div>
                            </form>
                        </ul>
                    </div>

                    <div class="col-sm-4 header-right-w3_pvt">
                        <%
                            AdminDAO dao = new AdminDAO();
                            List<String> listTW = dao.getOPH();
                            String stMF = "OFF";
                            String etMF = "OFF";
                            String stSS = "OFF";
                            String etSS = "OFF";
                            if (!listTW.isEmpty()) {
                                stMF = listTW.get(0);
                                etMF = listTW.get(1);
                                stSS = listTW.get(2);
                                etSS = listTW.get(3);
                            }
                        %>
                        <ul class="d-lg-flex header-w3_pvt justify-content-lg-end">
                            <li class="mr-lg-3">
                                <span class=""><span class="fa fa-clock-o"></span>Thứ 2 - Thứ 6 : <%=stMF%> - <%=etMF%></span>
                            </li>
                            <li class="mr-lg-3">
                                <span class=""><span class="fa fa-clock-o"></span>Thứ 7 & CN : <%=stSS%> - <%=etSS%></span>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <!-- //top header -->

        <!-- //header -->
        <header class="py-3">
            <div class="container">
                <div id="logo">
                    <h1> <a href="index.jsp"><span class="fa fa-solid fa-tooth" aria-hidden="true"></span> Nha Khoa Thiên
                            Thần </a></h1>
                </div>
                <!-- nav -->
                <nav class="d-lg-flex">

                    <label for="drop" class="toggle"><span class="fa fa-bars"></span></label>
                    <input type="checkbox" id="drop" />
                    <ul class="menu mt-2 ml-auto">

                        <li class=""><a href="about.jsp">GIỚI THIỆU</a></li>
                        <li class="menu-sub menu-sub--has-table">
                            <a href="services.jsp">DỊCH VỤ</a>
                            <ul class="menu__service-list">
                                <%
                                    PatientDAO dao1 = new PatientDAO();
                                    List<CategoryServiceDTO> listCate = dao1.getTableCategory();
                                    if (listCate != null) {
                                        if (listCate.size() > 0) {
                                            for (CategoryServiceDTO cate : listCate) {


                                %>
                                <li class="menu__service-description">   
                                    <a class="menu__service-link"><span> <%= cate.getCategoryName()%></span>  

                                    </a>    
                                    <%
                                        String cate1 = cate.getCategoryName();

                                        List<ServiceDTO> listService = dao1.getTableService(cate1);

                                        if (listService != null) {

                                            if (listService.size() > 0) {

                                    %>
                                    <ul class="menu__service-colume">
                                        <%                                        for (ServiceDTO table : listService) {


                                        %> 

                                        <li class="menu__service-colume--item">
                                            <a href="MainController?action=Show_About&serviceID=<%= table.getServiceID()%>"><%= table.getServiceName()%></a>
                                        </li>



                                        <%

                                            }
                                        %>
                                    </ul>   
                                    <%
                                            }

                                        }
                                    %>
                                </li>
                                <%
                                    }

                                %>
                                <%        }
                                    }

                                %>  
                            </ul>
                        </li>
                        <li class="active"><a href="priceServiceHome.jsp">BẢNG GIÁ</a></li>
                        <li class=""><a href="knowledge.jsp">KIẾN THỨC </a></li>
                        <li class=""><a href="expert.jsp">CHUYÊN GIA</a></li>
                            <%if (loginUser == null || !loginUser.getRoleID().equals("PT")) {
                            %>
                        <li class=""><a href="login.jsp" onclick="control()">ĐẶT LỊCH</a></li>
                            <%
                            } else {
                            %>
                        <li class=""><a href="MainController?action=ShowService" >ĐẶT LỊCH</a></li>
                            <%
                                }
                            %>

                    </ul>

                    <% if (loginUser == null) {
                    %>
                    <div class="login-icon ml-2">
                        <a class="user" href="login.jsp"> LOGIN </a>
                    </div>
                    <% } else if (loginUser != null && loginUser.getRoleID().equals("AD")) {
                    %>
                    <div class="dropdown btn-group">
                        <a class="navbar-brand dropdown-toggle" href="admin.jsp" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="./assets/images/users/1.jpg" style="width: 50px; border-radius: 30px; margin-top: -7px; margin-left: 5px" alt="admin" class="profile-pic me-2">
                        </a>
                        <ul class="dropdown-menu" style="background-color: #63B43E">
                            <a href="admin.jsp" style="padding: 0">
                                <button class="dropdown-item" type="button">
                                    <i class="fa-solid fa-circle-arrow-right"></i>
                                    Tài Khoản Của Tôi
                                </button>
                            </a>
                            <a href="login.jsp" style="padding: 0">
                                <form action="MainController">
                                    <button class="dropdown-item" type="button">
                                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                        <input type="submit" name="action" value="Logout" style=" background-color: transparent; border: none"/>
                                    </button>
                                </form>
                            </a>
                        </ul>
                    </div>
                    <%
                    } else if (loginUser != null && loginUser.getRoleID().equals("PT")) {
                    %> 

                    <div class="dropdown btn-group">
                        <a class="navbar-brand dropdown-toggle" href="patient.jsp" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="./images/customers/${LOGIN_USER.image}" style="width: 50px; height: 50px ; border-radius: 40px; margin-top: -7px; margin-left: 5px" alt="patient" class="profile-pic me-2">
                        </a>
                        <ul class="dropdown-menu" style="background-color: #63B43E">
                            <a href="ShowProfilePatientController?patientID=${LOGIN_USER.getUserID()}" style="padding: 0">
                                <button class="dropdown-item" type="button">
                                    <i class="fa-solid fa-circle-arrow-right"></i>
                                    Tài Khoản Của Tôi
                                </button>
                            </a>
                            <a href="MainController?action=SearchHSBK&searchHSBK" style="padding: 0">
                                <button class="dropdown-item" type="button">
                                    <i class="fa-solid fa-circle-arrow-right"></i>
                                    Lịch Sử Đặt Lịch
                                </button>
                            </a>
                            <a href="login.jsp" style="padding: 0">
                                <form action="MainController">
                                    <button class="dropdown-item" type="button">
                                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                        <input type="submit" name="action" value="Logout" style=" background-color: transparent; border: none"/>
                                    </button>
                                </form>
                            </a>
                        </ul>
                    </div>
                    <%
                    } else if (loginUser != null && loginUser.getRoleID().equals("DR")) {
                    %>
                    <div class="dropdown btn-group">
                        <a class="navbar-brand dropdown-toggle" href="doctor.jsp" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="./images/blog4.jpg" style="width: 50px; border-radius: 30px; margin-top: -7px; margin-left: 5px" alt="doctor" class="profile-pic me-2">
                        </a>
                        <ul class="dropdown-menu" style="background-color: #63B43E">
                            <a href="doctor.jsp" style="padding: 0">
                                <button class="dropdown-item" type="button">
                                    <i class="fa-solid fa-circle-arrow-right"></i>
                                    Tài Khoản Của Tôi
                                </button>
                            </a>
                            <a href="login.jsp" style="padding: 0">
                                <form action="MainController">
                                    <button class="dropdown-item" type="button">
                                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                        <input type="submit" name="action" value="Logout" style=" background-color: transparent; border: none"/>
                                    </button>
                                </form>
                            </a>
                        </ul>
                    </div>
                    <%
                        }
                    %>


                </nav>
                <div class="clear"></div>
                <!-- //nav -->
            </div>
        </header>
        <!-- //header -->

        <!-- banner -->
        <div class="innerpage-banner" id="home">
            <div class="inner-page-layer">
            </div>
        </div>
        <!-- //banner -->

        <!-- contact -->
        <section class="mail">
            <div class="container pt-lg-5">
                <h2 class="heading text-center mb-sm-5 mb-4">Đặt Lịch</h2>
                <div class="row agileinfo_mail_grids">
                    <div class="col-lg-8 agileinfo_mail_grid_right" style="background-color: #f5f6f5bf; border-radius: 2px">
                        <div class="row">
                            <div class="col-md-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-11">
                                <div class="form-group">
                                    <label>
                                        <span> <h4>Chọn Dịch Vụ</h4>
                                            <form action="MainController" id="form_SV">
                                                <div class="booking-input">
                                                    <select name = "serviceName" onchange = "showService()"
                                                            > <option 
                                                            class="form-option" value =
                                                            "<%=sName%>"><%=sName%></option>
                                                        <% List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("LIST_SERVICE");
                                                            if (listService != null) {
                                                                if (listService.size() > 0) {
                                                                    for (ServiceDTO service : listService) {
                                                        %> 
                                                        <option class="form-option" value="<%=service.getServiceName()%>"><%=service.getServiceName()%> <%=service.getPrice()%>$ </option>
                                                        <%
                                                                    }

                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                    <input type="hidden" name="action" value="ShowDRByCT"/> 
                                                </div>
                                            </form> 
                                        </span>
                                    </label>
                                    <label class="form-group--item" style="width: 100%;">
                                        <span>
                                            <form action="MainController" id="form_DR" name="from_DR">
                                                <div class="booking-input--date">
                                                    <input type="hidden" name="serviceName" value="<%=sName%>"/>
                                                    <h4>Chọn Bác Sĩ</h4> 
                                                    <select name="doctorID" id="doctorID">
                                                        <option class="form-option" value="<%=drID%>"><%=drName%></option>
                                                        <%
                                                            List<DoctorDTO> listDoctor = (List<DoctorDTO>) request.getAttribute("LIST_DOCTOR_CT");
                                                            if (listDoctor != null) {
                                                                if (listDoctor.size() > 0) {

                                                                    for (DoctorDTO doctor : listDoctor) {

                                                        %>
                                                        <option class="form-option" value="<%=doctor.getUserID()%>"><%=doctor.getFullName()%></option>
                                                        <%
                                                                    }
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                    <h4>Chọn Ngày Khám</h4>
                                                    <input type="date" id="dateB" name="bookingDate" value="<%=dateBooking%>" required="" onchange="showDate()"/></br></br>
                                                    <input type="hidden" name="action" value="ShowSlotDR" /> 
                                                </div>
                                            </form>
                                            <%=error%>
                                        </span>
                                    </label>
                                </div>
                            </div>
                            <div class="booking-time" >
                                <div class="dv-title"> Chọn giờ thăm khám</div>
                                <form action="MainController" > 
                                    <input type="hidden" name="serviceID" value="<%=sID%>"/>
                                    <input type="hidden" name="serviceName" value="<%=sName%>"/>
                                    <input type="hidden" name="doctorID" value="<%=drID%>"/>
                                    <input type="hidden" name="dateBooking" value="<%=dateBooking%>"/>
                                    <input type="hidden" name="patientID" value="<%=patientID%>"/>
                                    <div class="time">
                                        <%
                                            List<SlotDTO> listFT = (List<SlotDTO>) request.getAttribute("LIST_SLOT_FT");
                                            if (listFT != null) {
                                                if (listFT.size() > 0) {

                                                    for (SlotDTO slot : listFT) {
                                                        String slotTime = slot.getSlotTime();
                                        %>
                                        <div class="time__space" > <input type="radio" id="slotTime" required="" onchange="displayVals()" name="slotTime" value="<%=slotTime%>"/><%=slotTime%></div>
                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Nha Khoa Thiên Thần</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h4>Bạn có xác nhận đạt lịch hẹn này hay không?</h4>
                                                        <p>Dịch vụ: <%=sName%></p>
                                                        <p>Bác sĩ: <%=drName%></p>
                                                        <p>Ngày hẹn: <%=dateBooking%></p>
                                                        <p id="info1"></p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Từ chối</button>
                                                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                    }
                                                }
                                            }
                                        %>
                                    </div>
                                    </br></br>
                                    <input type="hidden" name="action" value="CreateBooking" />                            
                                    <div style="margin-top: -40px">
                                        <button type="button" class="btn-banner" data-toggle="modal" data-target="#exampleModalCenter">Submit</button>
                                    </div>
                                </form></br>
                                <h4>
                                <%=mess%>
                                <%=slot_doctorEmmty%></br></br>
                                <%=errorTime%></br></br>
                                </h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-lg-0 mt-4 contact-info">
                        <h4 class="mb-4">Thông Tin Địa Chỉ</h4>
                        <p><span class="fa mr-2 fa-map-marker"></span>Đường D1, Long Thạnh Mỹ, <span>T.Phố Thủ Đức, T.Phố Hồ
                                Chí Minh.</span></p>
                        <p class="phone py-2"><span class="fa mr-2 fa-phone"></span>Phone : +1 123 456 789 </p>
                        <p><span class="fa mr-2 fa-envelope"></span>Email : <a
                                href="mailto:phongkhamnhakhoathienthan@gmail.com">phongkhamnhakhoathienthan@gmail.com</a></p>

                        <h4 class="my-4">Đặt Lịch Ngay</h4>
                        <p class="phone"><span class="fa mr-2 fa-phone"></span>Gọi Ngay +84 123 456 789 </p>
                        <div class="map mt-5 mb-5">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.609941491709!2d106.8076943144412!3d10.841132860961343!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1653028757762!5m2!1svi!2s"
                                width="600" height="300" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //contact -->
        <!-- footer -->
        <footer class="py-5">
            <div class="container py-sm-3">
                <div class="row footer-grids">
                    <div class="col-lg-6 col-sm-6 mb-lg-0 mb-sm-5 mb-4">
                        <h4 class="mb-sm-4 mb-3"><span class="fa fa-stethoscope"></span> Nha Khoa Thiên Thần</h4>
                        <p class="mb-3">Nha khoa Thiên Thần -Trung tâm trồng răng và Niềng răng. Tự hào là một trong những nha
                            khoa ở TP.HCM đi đầu về công nghệ và chất lượng đội ngũ Y bác sỹ.</p>
                        <h5>Được tin cậy bởi <span>500+ Người</span> </h5>
                    </div>
                    <div class="col-lg-6 col-sm-6 mb-lg-0 mb-sm-5 mb-4">
                        <h4 class="mb-sm-4 mb-3">Thông Tin Địa Chỉ</h4>
                        <p><span class="fa mr-2 fa-map-marker"></span>Đường D1, Long Thạnh Mỹ, <span>T.Phố Thủ Đức, T.Phố Hồ
                                Chí Minh.</span></p>
                        <p class="phone py-2"><span class="fa mr-2 fa-phone"></span> +1(12) 123 456 789 </p>
                        <p><span class="fa mr-2 fa-envelope"></span><a href="mailto:info@example.com">info@example.com</a>
                        </p>
                        <p><span class=""><span class="fa fa-clock-o"></span></span>Thứ 2 - Thứ 6 : <%=stMF%> - <%=etMF%></span>
                        </p>
                        <p><span class=""><span class="fa fa-clock-o"></span></span>Thứ 7 & CN : <%=stSS%> - <%=etSS%></span>
                        </p>
                    </div>
                    <!-- <div class="col-lg-2 col-sm-6 mb-sm-0 mb-4">
                            <h4 class="mb-sm-4 mb-3">Liên Hệ Phòng Khám</h4>
                            <ul>
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li class="my-2"><a href="#">Support Helpline</a></li>
                                    <li><a href="#">Healthy Tips</a></li>
                                    <li class="mt-2"><a href="#">Privacy Ploicy</a></li>
                            </ul>
                    </div> -->
                </div>
            </div>
        </footer>
        <!-- //footer -->

        <!-- copyright -->

        <!-- //copyright -->

        <!-- move top -->
        <div class="move-top text-right">
            <a href="#home" class="move-top">
                <span class="fa fa-angle-up  mb-3" aria-hidden="true"></span>
            </a>
        </div>
        <!-- move top -->


        <script>
            function  showService()
            {
                var form = document.getElementById("form_SV");
                form.submit();

            }
            function showDoctor()
            {
                alert("Hãy nhập doc!");
                var doctor = document.getElementById("doctorID").value;
                if (doctor !== null && doctor !== "") {
                    var form = document.getElementById("form_DR");
                    form.submit();

                }
            }
            function showDate() {
                var doctor = document.getElementById("doctorID").value;
                if (doctor !== null && doctor !== "") {
                    var form = document.getElementById("form_DR");
                    form.submit();

                } else {
                    alert("Hãy lựa chọn bác sĩ mà bạn muốn!!!");
                    location.reload();
                }

            }
            function displayVals() {
                var checkedradio = $('[name="slotTime"]:radio:checked').val();
                $("p#info1").html("Giờ hẹn: " + checkedradio);
            }


        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <script>
            function control() {
                alert("Xin hãy đăng nhập để được đặt lịch!!!");
            }
        </script>
    </body>
</html>
