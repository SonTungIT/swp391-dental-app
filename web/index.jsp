<%-- 
    Document   : index
    Created on : Jun 6, 2022, 12:14:03 PM
    Author     : Lenovo Legion
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nha Khoa Thiên Thần</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Thien Than Dental" />

        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>

        <!-- css files -->


        <link href="CSS/css_slider.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        
        <!-- //css files -->

        <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->

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
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
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
                            <!-- <li>
                                    <span class="fa fa-phone"></span>
                                    <p class="d-inline">Call Us +12 345 678</p>
                            </li> -->
                            <li class="mr-lg-3">
                                <span class=""><span class="fa fa-phone"></span>Call Us +12 345 678</span>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-6 header-right-w3_pvt">
                        <ul class="d-lg-flex header-w3_pvt justify-content-lg-end">
                            <li class="mr-lg-3">
                                <span class=""><span class="fa fa-clock-o"></span>Thứ 2 - Thứ 6 : 7h - 16:30h</span>
                            </li>
                            <li class="mr-lg-3">
                                <span class=""><span class="fa fa-clock-o"></span>Thứ 7 & CN : 7h - 11h</span>
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
                    <h1> <a href="MainController?action=Home"><span class="fa fa-solid fa-tooth" aria-hidden="true"></span> Nha Khoa Thiên
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
                        <li class="active"><a href="price.jsp">BẢNG GIÁ</a></li>
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
                            <img src="./images/sontung.jpg" style="width: 50px; border-radius: 30px; margin-top: -7px; margin-left: 5px" alt="patient" class="profile-pic me-2">
                        </a>
                        <ul class="dropdown-menu" style="background-color: #63B43E">
                            <a href="patient.jsp" style="padding: 0">
                                <button class="dropdown-item" type="button">
                                    <i class="fa-solid fa-circle-arrow-right"></i>
                                    Tài Khoản Của Tôi
                                </button>
                            </a>
                            <a href="#" style="padding: 0">
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
                            <img src="./images/t6.jpg" style="width: 50px; border-radius: 30px; margin-top: -7px; margin-left: 5px" alt="doctor" class="profile-pic me-2">
                        </a>
                        <ul class="dropdown-menu" style="background-color: #63B43E">
                            <a href="doctor.jsp.jsp" style="padding: 0">
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
        <!-- banner-clinic -->

        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/banner5.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/banner2.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/banner3.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- <img src="./images/banner2.jpg" class="d-block w-100" alt="..."> -->
        <!-- banner-clinic -->
        <!-- banner -->
        <div class="banner" id="home">
            <div class="layer">
                <div class="container">
                    <div class="banner-text-agile">
                        <div class="row">
                            <div class="col-lg-6 p-0">
                                <!-- banner slider-->
                                <div class="csslider infinity" id="slider1">
                                    <input type="radio" name="slides" checked="checked" id="slides_1" />
                                    <input type="radio" name="slides" id="slides_2" />
                                    <input type="radio" name="slides" id="slides_3" />
                                    <ul class="banner_slide_bg">
                                        <li>
                                            <div class="container-fluid">
                                                <div class="w3ls_banner_txt">
                                                    <h3 class="b-w3ltxt text-capitalize mt-md-4">
                                                        Chất lượng luôn là Hàng đầu.</h3>
                                                    <p class="w3ls_pvt-title my-3">Với 12 năm kinh nghiệm, cùng đội ngũ nha
                                                        sĩ đứng hàng đầu Việt Nam. Chúng tôi luôn mong muốn cung cấp dịch vụ
                                                        nha khoa tốt nhất cho khách hàng.</p>
                                                    <a href="about.html" class="btn btn-banner my-sm-3 mb-3">Tìm hiểu
                                                        thêm</a>
                                                    <a href="booking.html" class="btn btn-banner1 my-sm-3 mb-3">Đặt lịch
                                                        ngay</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="container-fluid">
                                                <div class="w3ls_banner_txt">
                                                    <h3 class="b-w3ltxt text-capitalize mt-md-4"><span>Dịch vụ chăm sóc
                                                            răng</span> Tốt nhất.</h3>
                                                    <p class="w3ls_pvt-title my-3">Với đa dạng dịch vụ chăm sóc nha khoa.
                                                        Chúng tôi luôn mong muốn đem lại những trải nghiệm tốt nhất cho
                                                        khách hàng. Nụ cười của khách hàng chính là niềm hạnh phúc của chúng
                                                        tôi.</p>
                                                    <a href="about.html" class="btn btn-banner my-sm-3 mb-3">Tìm hiểu
                                                        thêm</a>
                                                    <a href="booking.html" class="btn btn-banner1 my-sm-3 mb-3">Đặt lịch
                                                        ngay</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="container-fluid">
                                                <div class="w3ls_banner_txt">
                                                    <h3 class="b-w3ltxt text-capitalize mt-md-4"><span>Đội ngũ nha sĩ</span>
                                                        Chuyên nghiệp.</h3>
                                                    <p class="w3ls_pvt-title my-3"> Với đội ngũ nha sĩ, y tá được đào tạo
                                                        bài bản, chuyên nghiệp nhất, cùng với nhiều năm kinh nghiệm trong
                                                        giới nha khoa. Chúng tôi luôn tự tin rằng sẽ mang lại sự hài lòng
                                                        cho khách hàng. </p>
                                                    <a href="about.html" class="btn btn-banner my-sm-3 mb-3">Tìm hiểu
                                                        thêm</a>
                                                    <a href="booking.html" class="btn btn-banner1 my-sm-3 mb-3">Đặt lịch
                                                        ngay</a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="navigation">
                                        <div>
                                            <label for="slides_1"></label>
                                            <label for="slides_2"></label>
                                            <label for="slides_3"></label>
                                        </div>
                                    </div>
                                </div>
                                <!-- //banner slider-->

                            </div>
                            <div class="col-lg-6 col-md-8">
                                <img src="./images/logo1.jpg" alt="" class="img-fluid" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //banner -->

        <!-- about -->
        <section class="about py-5">
            <div class="container py-md-3">
                <h2 class="heading text-center mb-sm-5 mb-4"> GIỚI THIỆU </h2>
                <div class="row">
                    <div class="col-lg-8">
                        <h4 class="about-left">Chuyên nghiệp, tốt nhất dành cho khách hàng!</h4>
                        <p class="mt-sm-4 mt-3">Sau hai mươi năm thành lập, phòng khám Thiên Thần luôn luôn đồng hành với
                            khách hàng và mang lại những nụ cười toả nắng cho họ. Mục tiêu của chúng tôi là chăm sóc, tư vấn
                            đưa ra những dịch vụ tốt nhất để khách hàng có những trải nghiệm hoàn hảo.</p>
                        <div class="row mt-4">
                            <div class="col-md-3 col-6">
                                <div class="about-box">
                                    <span class="icon">
                                        <span class="fa fa-birthday-cake"></span>
                                    </span>
                                    <h4>Niềng Răng Chỉnh Nha</h4>
                                </div>
                            </div>
                            <div class="col-md-3 col-6">
                                <div class="about-box">
                                    <span class="icon">
                                        <span class="fa fa-rocket"></span>
                                    </span>
                                    <h4>Răng Sứ Thẩm Mỹ</h4>
                                </div>
                            </div>
                            <!-- .about-box ends here -->
                            <div class="col-md-3 col-6 mt-md-0 mt-4">
                                <div class="about-box">
                                    <span class="icon">
                                        <span class="fa fa-stethoscope"></span>
                                    </span>
                                    <h4>Cấy ghép răng implant</h4>
                                </div>
                            </div>
                            <div class="col-md-3 col-6 mt-md-0 mt-4">
                                <div class="about-box">
                                    <span class="icon">
                                        <span class="fa fa-coffee"></span>
                                    </span>
                                    <h4>Dịch vụ bệnh lý</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-8 dental">
                        <img src="images/sale1.jpg" class="img-fluid" alt="" />
                    </div>
                </div>
            </div>
        </section>
        <!-- //about -->

        <!-- about bottom -->
        <section class="about-bottom pb-5">
            <div class="container pb-lg-3">
                <div class="row bottom-grids">
                    <div class="col-lg-6">
                        <img src="images/logo2.jpg" class="img-fluid" alt="" />
                    </div>
                    <div class="col-lg-6 mt-lg-0 mt-5">
                        <h4>Sứ mệnh, tầm nhìn & Định hướng của Nha Khoa Thiên Thần.</h4>
                        <p class="py-3">Nha khoa Thiên Thần ra đời với sứ mệnh mang đến cho khách hàng “nụ cười mới –
                            cuộc
                            sống mới”, giúp khách hàng xóa tan đi sự tự tị bởi ngoại hình, tự tin hơn trong giao tiếp, công
                            việc và cuộc sống.</p>
                        <p class="">Với tầm nhìn tới 2025, hệ thống Nha Khoa Thiên Thần sẽ có mặt tại 63 tỉnh thành phố của
                            Việt
                            Nam & trở thành hệ thống khám chữa răng lớn nhất.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- //about bottom -->

        <!-- services -->
        <section class="services py-5">
            <div class="container py-lg-5">
                <h3 class="heading text-center mb-sm-5 mb-4">DỊCH VỤ NỔI BẬT</h3>
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

        <!-- testimonials -->
        <section class="feedback" id="testimonials">
            <div class="feedback-layer py-5">
                <div class="container py-lg-5">
                    <h3 class="heading text-center mb-sm-5 mb-4">TRẢI NGHIỆM CỦA KHÁCH HÀNG</h3>
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="feedback-info">
                                <div class="feedback-top p-4">
                                    <span class="fa fa-quote-right"></span>
                                    <p>“Về vấn đề ăn uống cải thiện rất nhiều. Tôi rất tin tưởng vào tay nghề của bác sĩ tại
                                        Nha Khoa Thiên Thần!.</p>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="feedback-grids">
                                    <div class="feedback-img">
                                        <img src="images/khachhang1.png" class="img-fluid" alt="">
                                    </div>
                                    <div class="feedback-img-info">
                                        <h5>Chú Đặng Xuân Bính</h5>
                                        <p class="font-italic">- June 5, 2022.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mt-md-0 mt-5">
                            <div class="feedback-info">
                                <div class="feedback-top p-4">
                                    <span class="fa fa-quote-right"></span>
                                    <p> “Cô rất vui vì ở nha khoa nhiệt tình với cô lắm, bác sĩ nhiệt tình hết ý. Làm răng
                                        xong cô đã có thể đi hát thánh ca mà không có một vấn đề gì cả.”</p>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="feedback-grids">
                                    <div class="feedback-img">
                                        <img src="images/khachhang2.jpg" class="img-fluid" alt="">
                                    </div>
                                    <div class="feedback-img-info">
                                        <h5>Cô Đỗ Thị Loan </h5>
                                        <p class="font-italic">- June 5, 2022.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mt-lg-0 mt-5">
                            <div class="feedback-info">
                                <div class="feedback-top p-4">
                                    <span class="fa fa-quote-right"></span>
                                    <p> “Đến với Nha Khoa Thiên Thần mình cảm thấy thoải mái, đội ngũ nhân viên và y bác sĩ
                                        rất tận tâm.
                                        Mình đã tự tin hơn nhiều sau khi làm thẩm mỹ răng ở đây!.</p>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="feedback-grids">
                                    <div class="feedback-img">
                                        <img src="images/khachhang3.jpg" class="img-fluid" alt="">
                                    </div>
                                    <div class="feedback-img-info">
                                        <h5>Dương Sỹ Lượng </h5>
                                        <p class="font-italic">- June 5, 2022.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //testimonials -->

        <!-- blog -->
        <section class="blog py-5">
            <div class="container py-md-5 py-3">
                <h3 class="heading text-center mb-sm-5 mb-4">Tin Tức Nổi Bật</h3>
                <div class="row blog-grids">
                    <div class="col-lg-7 mb-lg-5 blog-img1">
                        <img src="images/news1.jpg" alt="" class="img-fluid" />
                        <!-- <a href="single.html">Blog #1</a> -->
                    </div>
                    <div class="col-lg-5 mb-lg-5 mb-4">
                        <h5>June 5, 2022.</h5>
                        <h4 class="my-3">Niềng răng Invisalign là gì? Giá bao nhiêu tiền? Kết quả Trước & Sau.</h4>
                        <p class="my-3">Bác sĩ nha khoa - 05/06/2022</p>
                        <a href="single.html" class="btn-banner"> View Post </a>
                    </div>
                    <div class="col-lg-7 mb-lg-0 mb-4">
                        <h5>June 5, 2022.</h5>
                        <h4 class="my-3">TOP 9 Dáng răng sứ Đẹp, Phong Cách, Form chuẩn
                            <br> Xu thế Nhất.
                        </h4>
                        <p class="my-3">Bác sĩ nha khoa - 05/06/2022</p>
                        <a href="single.html" class="btn-banner"> View Post </a>
                    </div>
                    <div class="col-lg-5 blog-img2">
                        <img src="images/news2.jpg" alt="" class="img-fluid" />
                        <!-- <a href="single.html">Blog #2</a> -->
                    </div>
                </div>
            </div>
        </section>
        <!-- //blog -->

        <!-- appointment -->
        <section class="appointment text-center py-5">
            <div class="container py-sm-3">
                <h4>Biến nụ cười mơ ước của bạn thành sự thật</h4>
                <p class="mt-3">Gọi chúng tôi để đặt lịch ngay</p>
                <p>+84123456789</p>
                <a style="font-size: 30px" href="booking.html">ĐẶT LỊCH NGAY</a>
            </div>
        </section>
        <!-- //appointment -->

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

        <!-- //copyright -->

        <!-- move top -->
        <div class="move-top text-right">
            <a href="#home" class="move-top">
                <span class="fa fa-angle-up  mb-3" aria-hidden="true"></span>
            </a>
        </div>
        <div class="flex-1 ms-2">            
            <p class="text-muted mb-0">Số lượng truy cập web</p>
            <p>${view}</p>
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
        <script>
            function control(){
                alert("Xin hãy đăng nhập để được đặt lịch!!!");
            }
        </script>
    </body>
</html>
