<%-- 
    Document   : booking
    Created on : Jun 6, 2022, 12:15:47 PM
    Author     : Lenovo Legion
--%>

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
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("PT")) {
                response.sendRedirect("login.jsp");
            }

            String sID = request.getParameter("serviceID");
            if (sID == null) {
                sID = "";
            }
            String sName = request.getParameter("serviceName");
            if (sName == null) {
                sName = "--------------Dịch Vụ--------------";
            }
            String drID = request.getParameter("doctorID");
            if (drID == null) {
                drID = "";
            }
            String drName = (String) request.getAttribute("doctorName");
            if (drName == null) {
                drName = "----------Bác Sĩ----------";
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
        %>

        <!-- top header -->
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <ul class="d-lg-flex header-w3_pvt">
                            <li class="mr-lg-3">
                                <span class="fa fa-envelope-open"></span>
                                <a href="mailto:info@example.com" class="">info@example.com</a>
                            </li>
                            <li>
                                <span class="fa fa-phone"></span>
                                <p class="d-inline">Call Us +12 345 678</p>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-6 header-right-w3_pvt">
                        <ul class="d-lg-flex header-w3_pvt justify-content-lg-end">
                            <li class="mr-lg-3">
                                <span class=""><span class="fa fa-clock-o"></span>Mon - Fri : 8:30am to 9:30pm</span>
                            </li>
                            <li class="">
                                <span class=""><span class="fa fa-clock-o"></span>Sat & Sun : 9:00am to 6:00pm</span>
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
                        <li class="active"><a href="index.jsp">TRANG CHỦ</a></li>
                        <li class=""><a href="about.jsp">GIỚI THIỆU</a></li>
                        <li class="menu-sub menu-sub--has-table">
                            <a href="services.jsp">DỊCH VỤ</a>
                            <ul class="menu__service-list">
                                <li class="menu__service-description">
                                    <a href="#" class="menu__service-link"><span>Niềng răng chỉnh nha</span></a>
                                    <ul class="menu__service-colume">
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/niengrang1.html">Niềng răng mắc cài</a>
                                        </li>
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/niengrang2.html">Niềng răng Invisalign</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu__service-description">
                                    <a href="#" class="menu__service-link"><span>Răng sứ thẩm mỹ</span></a>
                                    <ul class="menu__service-colume">
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/rangsu1.html">Dán sứ Veneer</a>
                                        </li>
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/rangsu2.html">Bọc răng sứ</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu__service-description">
                                    <a href="#" class="menu__service-link"><span>Cấy ghép răng implant</span></a>
                                    <ul class="menu__service-colume">
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/cayghep1.html">Trồng răng Implant</a>
                                        </li>
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/cayghep2.html">Trồng Implant toàn hàm</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu__service-description">
                                    <a href="#" class="menu__service-link"><span>Dịch vụ bệnh lý</span></a>
                                    <ul class="menu__service-colume">
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/dichvu1.html">Lấy cao răng</a>
                                        </li>
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/dichvu2.html">Nhổ răng khôn</a>
                                        </li>
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/dichvu3.html">Hàn trám răng</a>
                                        </li>
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/dichvu4.html">Điều trị tủy</a>
                                        </li>
                                        <li class="menu__service-colume--item">
                                            <a href="./listService/dichvu5.html">Tẩy trắng răng</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class=""><a href="knowledge.jsp">KIẾN THỨC </a></li>
                        <li class=""><a href="expert.jsp">CHUYÊN GIA</a></li>
                        <li class=""><a href="booking.jsp">ĐẶT LỊCH</a></li>
                    </ul>
                    <div class="login-icon ml-2">
                        <a class="user" href="login.jsp"> LOGIN </a>
                    </div>
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
        <section class="mail pt-lg-5 pt-4">
            <div class="container pt-lg-5">
                <h2 class="heading text-center mb-sm-5 mb-4">Đặt Lịch</h2>
                <div class="row agileinfo_mail_grids">
                    <div class="col-lg-8 agileinfo_mail_grid_right">

                        <div class="row">


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label style="width: 50%;padding: 0 10px;">
                                        Service
                                        <span class="">
                                            <form action="MainController" id="form_SV">
                                                <select  name="serviceName"  onchange="showService()">
                                                    <option class="form-option" value="<%=sName%>"><%=sName%></option>
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
                                            </form> 
                                        </span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label style="width: 50%;padding: 0 10px;">
                                        Chọn ngày khám:
                                        <span class="wpcf7-form-control-wrap date-ngay">
                                            <form action="MainController" id="form_DR" name="from_DR">
                                                <div id="dateBK">
                                                    <input type="date" id="dateB" name="bookingDate" value="<%=dateBooking%>" required="" onchange="showDate()"/></br></br>
                                                </div>
                                                <input type="hidden" name="serviceName" value="<%=sName%>"/>
                                                <div class="" id="doctor" style="display: none" > 
                                                    <select name="doctorID" onchange="showDoctor()">
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
                                                </div>                                            
                                                <input type="hidden" name="action" value="ShowSlotDR" /> 
                                            </form>
                                            <%=error%>
                                        </span>
                                    </label>
                                </div>
                            </div>


                            <div class="booking-time">
                                <div class="dv-title"> Chọn giờ thăm khám</div>
                                <form action="MainController"> 
                                    <input type="hidden" name="serviceID" value="<%=sID%>"/>
                                    <input type="hidden" name="serviceName" value="<%=sName%>"/>
                                    <input type="hidden" name="doctorID" value="<%=drID%>"/>
                                    <input type="hidden" name="dateBooking" value="<%=dateBooking%>"/>
                                    <input type="hidden" name="patientID" value="<%=loginUser.getUserID()%>"/>
                                    <div class="time">


                                        <%
                                            List<SlotDTO> listFT = (List<SlotDTO>) request.getAttribute("LIST_SLOT_FT");
                                            if (listFT != null) {
                                                if (listFT.size() > 0) {

                                                    for (SlotDTO slot : listFT) {
                                        %>
                                        <div class="time__space"><input type="radio" required="" name="slotTime" value="<%=slot.getSlotTime()%>"/><%=slot.getSlotTime()%></div>
                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                                    </div>
                                    <%=errorTime%></br>
                                    <input type="hidden" name="action" value="CreateBooking" />                            
                                    <div class="submit-buttons">
                                        <button type="submit" class="btn">Submit</button>
                                    </div>
                                </form>

                            </div>


                        </div>

                    </div>
                    <div class="col-lg-4 col-md-6 mt-lg-0 mt-4 contact-info">
                        <h4 class="mb-4">Address Information</h4>
                        <p><span class="fa mr-2 fa-map-marker"></span>64d canal street TT 3356 <span>Newyork, NY.</span></p>
                        <p class="phone py-2"><span class="fa mr-2 fa-phone"></span>Phone : +1 123 456 789 </p>
                        <p><span class="fa mr-2 fa-envelope"></span>Email : <a
                                href="mailto:info@example.com">info@example.com</a></p>

                        <h4 class="my-4">Book Your Appointment</h4>
                        <p class="phone"><span class="fa mr-2 fa-phone"></span>Call us at +1 123 456 789 </p>
                    </div>
                </div>
            </div>
            <div class="map mt-5">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.609941491709!2d106.8076943144412!3d10.841132860961343!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1653028757762!5m2!1svi!2s"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </section>
        <!-- //contact -->

        <!-- footer -->
        <footer class="py-5">
            <div class="container py-sm-3">
                <div class="row footer-grids">
                    <div class="col-lg-3 col-sm-6 mb-lg-0 mb-sm-5 mb-4">
                        <h4 class="mb-sm-4 mb-3"><span class="fa fa-stethoscope"></span> Dental Health</h4>
                        <p class="mb-3">Onec Consequat sapien ut cursus rhoncus. Nullam dui mi, vulputate ac metus semper
                            quis luctus sed.</p>
                        <h5>Trusted by <span>500+ People</span> </h5>
                    </div>
                    <div class="col-lg-3 col-sm-6 mb-lg-0 mb-sm-5 mb-4">
                        <h4 class="mb-sm-4 mb-3">Address Info</h4>
                        <p><span class="fa mr-2 fa-map-marker"></span>64d canal street TT 3356 <span>Newyork, NY.</span></p>
                        <p class="phone py-2"><span class="fa mr-2 fa-phone"></span> +1(12) 123 456 789 </p>
                        <p><span class="fa mr-2 fa-envelope"></span><a href="mailto:info@example.com">info@example.com</a>
                        </p>
                    </div>
                    <div class="col-lg-2 col-sm-6 mb-sm-0 mb-4">
                        <h4 class="mb-sm-4 mb-3">Quick Links</h4>
                        <ul>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li class="my-2"><a href="#">Support Helpline</a></li>
                            <li><a href="#">Healthy Tips</a></li>
                            <li class="mt-2"><a href="#">Privacy Ploicy</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <h4 class="mb-sm-4 mb-3">Subscribe Us</h4>
                        <p class="mb-3">Subscribe to our newsletter</p>
                        <form action="#" method="post" class="d-flex">
                            <input type="email" id="email" name="EMAIL" placeholder="Enter your email here" required="">
                            <button type="submit" class="btn">Subscribe</button>
                        </form>
                        <div class="icon-social mt-3">
                            <a href="#" class="button-footr">
                                <span class="fa mx-2 fa-facebook"></span>
                            </a>
                            <a href="#" class="button-footr">
                                <span class="fa mx-2 fa-twitter"></span>
                            </a>
                            <a href="#" class="button-footr">
                                <span class="fa mx-2 fa-dribbble"></span>
                            </a>
                            <a href="#" class="button-footr">
                                <span class="fa mx-2 fa-pinterest"></span>
                            </a>
                            <a href="#" class="button-footr">
                                <span class="fa mx-2 fa-google-plus"></span>
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- //footer -->

        <!-- copyright -->
        <div class="copyright">
            <div class="container py-4">
                <div class=" text-center">
                    <p>© 2019 Dental Health. All Rights Reserved | Design by <a href="http://w3layouts.com/"> W3layouts</a>
                    </p>
                </div>
            </div>
        </div>
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
                var form = document.getElementById("form_DR");
                form.submit();
            }
            function showDate() {
                document.getElementById("doctor").style.display = 'block';
            }
        </script>


    </body>
</html>
