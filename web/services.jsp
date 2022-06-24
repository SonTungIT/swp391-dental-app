<%-- 
    Document   : services
    Created on : Jun 6, 2022, 12:18:42 PM
    Author     : Lenovo Legion
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dental Health Medical Category Flat Bootstrap Responsive Website Template | Services :: W3layouts</title>
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
        <!-- //css files -->

        <!-- google fonts -->
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&amp;subset=latin-ext" rel="stylesheet">
        <!-- //google fonts -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
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
                    <h1> <a href="index.jsp"><span class="fa fa-solid fa-tooth" aria-hidden="true"></span> Nha Khoa Thiên Thần </a></h1>
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
                        <li class=""><a href="knowledge.jsp">KIẾN THỨC</a></li>
                        <li class=""><a href="expert.jsp">CHUYÊN GIA</a></li>
                        <li class=""><a href="booking.jsp">ĐẶT LỊCH</a></li>
                    </ul>
                    <% if (loginUser == null) {
                    %>
                    <div class="login-icon ml-2">
                        <a class="user" href="login.jsp"> LOGIN </a>
                    </div>
                    <% } else {
                    %>
                    <div class="dropdown btn-group">
                        <a class="navbar-brand dropdown-toggle" href="patient.jsp" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="./images/sontung.jpg" style="width: 50px; border-radius: 30px; margin-top: -7px; margin-left: 5px" alt="user" class="profile-pic me-2">
                        </a>
                        <ul class="dropdown-menu" style="background-color: #63B43E">
                            <a href="patient.jsp" style="padding: 0">
                                <button class="dropdown-item" type="button">
                                    <i class="fa-solid fa-circle-arrow-right"></i>
                                    Tài Khoản Của Tôi
                                </button>
                            </a>
                            <a href="patient.jsp" style="padding: 0">
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

        <!-- Services -->
        <!-- <section class="services-inner py-5">
                <div class="container py-md-3">
                        <h2 class="heading text-center mb-sm-5 mb-4">CÁC DỊCH VỤ TẠI NHA KHOA THIÊN THẦN</h2>
                        <div class="row service-grids">
                                <div class="row col-lg-6 mb-5 padder-none">
                                        <div class="col-sm-3 ser_icon">
                                                <span class="icon bg1 mx-auto">
                                                        <span class="fa fa-heartbeat"></span>
                                                </span>
                                        </div>
                                        <div class="col-sm-9 mt-sm-0 mt-3">
                                                <h4>Root Canal and Teeth Whitening</h4>
                                                <p class="">Quisque ac sapien quis orci pulvinar finibus quisn eu urna Quisque Suspendisse id felisut sed felise tincidunt finibus.
                                                Nulla sed justo tellus. Donec et felis ante ipsum urna Quisque sed felis dolor.</p>
                                        </div>
                                </div>
                                <div class="row col-lg-6 mb-sm-5 padder-none">
                                        <div class="col-sm-9 text-sm-right">
                                                <h4> Orthodontics and Dental Filling</h4>
                                                <p class="">Quisque ac sapien quis orci pulvinar finibus quisn eu urna Quisque Suspendisse id felisut sed felise tincidunt finibus.
                                                Nulla sed justo tellus. Donec et felis ante ipsum urna Quisque sed felis dolor.</p>
                                        </div>
                                        <div class="col-sm-3 mt-sm-0 mt-4 ser_icon ser-right">
                                                <span class="icon bg2 mx-auto">
                                                        <span class="fa fa-stethoscope"></span>
                                                </span>
                                        </div>
                                </div>
                                <div class="row col-lg-6 mb-lg-0 mb-5 mt-sm-0 mt-5 padder-none">
                                        <div class="col-sm-3 mb-sm-0 mb-4 ser_icon">
                                                <span class="icon bg3 mx-auto">
                                                        <span class="fa fa-bullseye"></span>
                                                </span>
                                        </div>
                                        <div class="col-sm-9">
                                                <h4>Tooth Extraction Treatment</h4>
                                                <p class="">Quisque ac sapien quis orci pulvinar finibus quisn eu urna Quisque Suspendisse id felisut sed felise tincidunt finibus.
                                                Nulla sed justo tellus. Donec et felis ante ipsum urna Quisque sed felis dolor.</p>
                                        </div>
                                </div>
                                <div class="row col-lg-6 padder-none">
                                        <div class="col-sm-9 text-sm-right">
                                                <h4>Daily Routine Check-up</h4>
                                                <p class="">Quisque ac sapien quis orci pulvinar finibus quisn eu urna Quisque Suspendisse id felisut sed felise tincidunt finibus.
                                                Nulla sed justo tellus. Donec et felis ante ipsum urna Quisque sed felis dolor.</p>
                                        </div>
                                        <div class="col-sm-3 mt-sm-0 mt-4 ser_icon ser-right">
                                                <span class="icon bg4 mx-auto">
                                                        <span class="fa fa-user-md"></span>
                                                </span>
                                        </div>
                                </div>
                        </div>
                </div>
        </section> -->
        <!-- //Services -->


        <!-- services -->
        <section class="services py-5">
            <div class="container py-lg-5">
                <h3 class="heading text-center mb-5">CÁC DỊCH VỤ TẠI NHA KHOA THIÊN THẦN</h3>
                <div class="row offer-grids">
                    <div class="col-lg-4 col-md-6">
                        <a href="listService/niengrang1.html">
                            <div class="bg-layer--img">
                                <img src="./images/dichvu1.png" alt="">
                            </div>
                            <div class="ser1">
                                <div class="bg-layer">
                                    <h4 class="">NIỀNG RĂNG MẮC CÀI</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-md-0 mt-4">
                        <a href="listService/niengrang2.html">
                            <div class="bg-layer--img">
                                <img src="./images/dichvu2.png" alt="">
                            </div>
                            <div class="ser2">
                                <div class="bg-layer">
                                    <h4 class="">NIỀNG RĂNG TRONG SUỐT</h4>

                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-lg-0 mt-4">
                        <a href="./listService/cayghep1.html">
                            <div class="bg-layer--img">
                                <img src="./images/dichvu3.png" alt="">
                            </div>
                            <div class="ser3">
                                <div class="bg-layer">
                                    <h4 class="">CẤY GHÉP RĂNG IMPLANT</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-4">
                        <a href="./listService/rangsu2.html">
                            <div class="bg-layer--img">
                                <img src="./images/dichvu4.png" alt="">
                            </div>
                            <div class="ser4">
                                <div class="bg-layer">
                                    <h4 class="">BỌC RĂNG SỨ THẨM MỸ</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-4">
                        <a href="./listService/rangsu1.html">
                            <div class="bg-layer--img">
                                <img src="./images/dichvu5.png" alt="">
                            </div>
                            <div class="ser5">
                                <div class="bg-layer">
                                    <h4 class="">DÁN RĂNG SỨ VENEER</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-4">
                        <a href="./listService/dichvu2.html">
                            <div class="bg-layer--img">
                                <img src="./images/dichvu6.png" alt="">
                            </div>
                            <div class="ser6">
                                <div class="bg-layer">
                                    <h4 class="">NHỔ RĂNG KHÔNG ĐAU</h4>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- //services -->	

        <!-- join -->
        <section class="join py-5">
            <div class="container py-lg-5 py-sm-3">
                <div class="row join_grids">
                    <div class="col-lg-6">
                        <img src="./images/csht.jpg" class="img-fluid" alt="" />
                    </div>
                    <div class="col-lg-6">
                        <h4 class="mt-2">CƠ SỞ HẠ TẦNG CỦA NHA KHOA THIÊN THẦN</h4>
                        <p class="py-sm-4 py-3">Bên cạnh việc chú trọng nâng cao tay nghề của đội ngũ bác sĩ. Nha khoa Thiên Thần luôn dành sự quan tâm đặc biệt đến việc đầu tư xây dựng đồng bộ cơ sở vật chất hạ tầng với nhiều trang thiết bị hiện đại. Chính vì vậy 99% khách hàng khi sau khi đến và trải nghiệm dịch vụ tại Nha khoa Thiên Thần đều cảm thấy hài lòng và an tâm.</p>
                        <p class="pb-3">Là một cơ sở được cấp phép hoạt động của Bộ Y Tế nha khoa Thiên Thần luôn nỗ lực nâng cấp cơ sở hạ tầng, vật chất nhằm mang đến trải nghiệm dịch vụ thư giãn, thoải mái nhất.</p>
                        <a class="btn btn-banner text-capitalize" href="#" role="button">Book Now</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- //join -->

        <!-- footer -->
        <footer class="py-5">
            <div class="container py-sm-3">
                <div class="row footer-grids">
                    <div class="col-lg-4 col-sm-6 mb-lg-0 mb-sm-5 mb-4">
                        <h4 class="mb-sm-4 mb-3"><span class="fa fa-stethoscope"></span> Nha Khoa Thiên Thần</h4>
                        <p class="mb-3">Nha khoa Thiên Thần -Trung tâm trồng răng và Niềng răng. Tự hào là một trong những nha
                            khoa ở TP.HCM đi đầu về công nghệ và chất lượng đội ngũ Y bác sỹ.</p>
                        <h5>Được tin cậy bởi <span>500+ Người</span> </h5>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-lg-0 mb-sm-5 mb-4">
                        <h4 class="mb-sm-4 mb-3">Thông Tin Địa Chỉ</h4>
                        <p><span class="fa mr-2 fa-map-marker"></span>Đường D1, Long Thạnh Mỹ, <span>T.Phố Thủ Đức, T.Phố Hồ
                                Chí Minh.</span></p>
                        <p class="phone py-2"><span class="fa mr-2 fa-phone"></span> +1(12) 123 456 789 </p>
                        <p><span class="fa mr-2 fa-envelope"></span><a href="mailto:info@example.com">info@example.com</a>
                        </p>
                        <p><span class=""><span class="fa fa-clock-o"></span>Giờ mở cửa: 7h - 16:30h (cả Thứ 7 và CN)</span>
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
                    <div class="col-lg-4 col-sm-6">
                        <h4 class="mb-sm-4 mb-3">ĐĂNG KÝ NHẬN ƯU ĐÃI</h4>
                        <!-- <p class="mb-3">Subscribe to our newsletter</p> -->
                        <form action="#" method="post" class="d-flex">
                            <input type="email" id="email" name="EMAIL" placeholder="Nhập Gmail của bạn" required="">
                            <button type="submit" class="btn">Đăng Ký</button>
                        </form>
                        <div class="icon-social mt-3">
                            <a href="#" class="button-footr">
                                <!-- <span class="fa mx-2 fa-facebook"></span> -->
                                <i class="fa-brands mx-3 fa-facebook"></i>
                            </a>
                            <a href="#" class="button-footr">
                                <!-- <span class="fa mx-2 fa-twitter"></span> -->
                                <i class="fa-brands mx-3 fa-instagram"></i>
                            </a>
                            <a href="#" class="button-footr">
                                <!-- <span class="fa mx-2 fa-dribbble"></span> -->
                                <i class="fa-brands mx-3 fa-youtube" style="color: red;"></i>
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
                    <p>© 2019 Dental Health. All Rights Reserved | Design by <a href="http://w3layouts.com/"> W3layouts</a> </p>
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
        <!-- JS bootstrap banner -->
        <!-- JavaScript Bundle with Popper -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <!-- JavaScript Bundle with Popper -->  

    </body>
</html>
