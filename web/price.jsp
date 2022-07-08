<%-- 
    Document   : price
    Created on : Jun 26, 2022, 4:32:20 PM
    Author     : Lenovo Legion
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.AdminDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <c:set var="txtSearch" value="${param.txtSearchValue}"/>
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
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/price.css" rel="stylesheet" type="text/css"/>
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
    </head>
    <body>
        
        <form action="SearchInformationController" >
            <input type="text" name="txtSearch"  value="${param.txtSearchValue}" placeholder="input your text"/>
            <input type="submit" name="action"  value="Tìm kiếm"/>
            <input type="hidden" name="index" value="1"/>
        </form>
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
                                <a href="mailto:phongkhamnhakhoathienthan@gmail.com" class="">phongkhamnhakhoathienthan@gmail.com</a>
                            </li>
                            <!-- <li>
                                    <span class="fa fa-phone"></span>
                                    <p class="d-inline">Call Us +12 345 678</p>
                            </li> -->
                            <li class="mr-lg-3">
                                <span class=""><span class="fa fa-phone"></span>Liên hệ +12 345 678</span>
                            </li>
                        </ul>
                    </div>

                    <div class="col-sm-6 header-right-w3_pvt">
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
        <div class="innerpage-banner" id="home">
            <div class="inner-page-layer">
            </div>
        </div>
        <main id="main" class="">
            <div id="content" role="main" class="content-area">
                <div class="row row-collapse row-full-width align-center" id="row-622117674">
                    <div id="col-2021140538" class="col small-12 large-12">
                        <div class="col-inner text-center">
                            <div class="banner has-hover show-for-small" id="banner-1216324343">
                                <div class="banner-inner fill">
                                    <div class="banner-bg fill">
                                        <div class="bg fill bg-fill "></div>
                                    </div>
                                    <div class="banner-layers container">
                                        <a class="fill" href="https://nhakhoafamily.vn/boc-rang-su-tham-my/"><div class="fill banner-link"></div></a>            
                                        <div id="text-box-920915226" class="text-box banner-layer x50 md-x50 lg-x50 y50 md-y50 lg-y50 res-text">
                                            <div class="text-box-content text dark">
                                                <div class="text-inner text-center">
                                                </div>
                                            </div>
                                            <style>
                                                #text-box-920915226 {
                                                    width: 60%;
                                                }
                                                #text-box-920915226 .text-box-content {
                                                    font-size: 100%;
                                                }
                                            </style>
                                        </div>
                                    </div>
                                </div>
                                <div class="height-fix is-invisible"></div>
                                <style>
                                    #banner-1216324343 .bg.bg-loaded {
                                        background-image: 15681;
                                    }
                                </style>
                            </div>

                            <div class="banner has-hover hide-for-small" id="banner-288351956">
                                <div class="banner-inner fill">
                                    <div class="banner-bg fill">
                                        <div class="bg fill bg-fill bg-loaded"></div>
                                    </div>
                                    <div class="banner-layers container">
                                        <a class="fill" href="https://nhakhoafamily.vn/boc-rang-su-tham-my/"><div class="fill banner-link"></div></a>            
                                        <div id="text-box-1114964449" class="text-box banner-layer x50 md-x50 lg-x50 y50 md-y50 lg-y50 res-text">
                                            <div class="text-box-content text dark">
                                                <div class="text-inner text-center">
                                                </div>
                                            </div>

                                            <style>
                                                #text-box-1114964449 {
                                                    width: 60%;
                                                }
                                                #text-box-1114964449 .text-box-content {
                                                    font-size: 100%;
                                                }
                                            </style>
                                        </div>
                                    </div>
                                </div>
                                <div class="height-fix is-invisible"></div>
                                <style>
                                    #banner-288351956 .bg.bg-loaded {
                                        background-image: 15680;
                                    }
                                </style>
                            </div>
                            <div class="container section-title-container"><h2 class="section-title section-title-bold-center"><b></b><span class="section-title-main"><i class="icon-menu"></i>Bảng giá dịch vụ nha khoa tại Nha khoa Thiên Thần</span><b></b></h2></div>
                        </div>
                    </div>
                </div>
                <div class="row align-center" style="max-width:900px" id="row-1366531008">

                    <div id="col-384072966" class="col small-12 large-12">
                        <div class="col-inner text-center">
                            <div class="motangan">
                                <p>Nha Khoa Thiên Thần – Hệ thống nha khoa thẩm mỹ công nghệ cao lớn và uy tín tại Việt Nam, nơi hội tụ đội ngũ Thạc Sĩ, Bác Sĩ đầu ngành với chuyên môn cao và tận tâm với khách hàng, nhất quán với mục tiêu:</p>
                                <p style="text-align: center;"><span style="color: #ff0000;"><em><span style="font-size: 110%;">“Lấy sự hài lòng của Khách Hàng làm kim chỉ nam cho sự phát triển của Nha khoa Thiên Thần”</span></em></span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <h2 style="text-align: center;">BẢNG GIÁ KHUYẾN MẠI THÁNG 3</h2>
                <p>&nbsp;</p>
                <div class="row row-collapse" id="row-409067757">
                </div>
                <div class="row" style="max-width:900px" id="row-2037044618">
                    <div id="col-592795447" class="col small-12 large-12">
                        <div class="col-inner">
                            <div class="is-divider divider clearfix"></div>
                            <h3 class="tt-dichvunhakhoa"><a href="https://nhakhoafamily.vn/boc-rang-su-tham-my/"><span id="dv_lam_rang_tham_my" class="pagebanggia">bảng giá răng sứ thẩm mỹ công nghệ 4.0</span></a></h3>
                            <table id="tablepress-24" class="tablepress tablepress-id-24">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Răng sứ Ceramay Pearl</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Răng sứ Lava Esthetic  🇺🇸</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Răng sứ Nacera (Đức)</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">Răng sứ SageMax (Đức)</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-6 even">
                                        <td class="column-1">Răng sứ HT Smile (Đức)</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-7 odd">
                                        <td class="column-1">Răng sứ Ceramill FX (Đức)</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-8 even">
                                        <td class="column-1">Răng sứ Cercon HT (Đức)</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-9 odd">
                                        <td class="column-1">Dmax(Hàn Quốc)</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-10 even">
                                        <td class="column-1">Răng sứ Emax Press (Đức)</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-11 odd">
                                        <td class="column-1">Răng sứ DDBio (Đức)</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-12 even">
                                        <td class="column-1">Răng sứ Katana</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-13 odd">
                                        <td class="column-1">Răng sứ Venus</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-14 even">
                                        <td class="column-1">Răng sứ Zirconia</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-15 odd">
                                        <td class="column-1">Răng sứ Kim Loại</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-24 from cache -->
                            <h3 class="tt-dichvunhakhoa"><a href="https://nhakhoafamily.vn/mat-dan-su-veneer/"><span id="veneer" class="pagebanggia">BẢNG GIÁ Dán sứ Veneer laminate</span></a></h3>

                            <table id="tablepress-15" class="tablepress tablepress-id-15">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Mặt dán sứ Veneer Ceramay Pearl</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Mặt dán sứ Veneer Laminate E.Max Press</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Mặt dán sứ Veneer Ultrathin</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">Dán sứ Veneer bán phần DDBio</td><td class="column-2">1 răng</td><td class="column-3">Liên hệ</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-15 from cache -->
                            <h3 class="tt-dichvunhakhoa"><span style="font-size: 95%;"><a href="https://nhakhoafamily.vn/nieng-rang-3m-unitek/"><span id="nieng-rang" class="pagebanggia">bảng giá Niềng răng chỉnh nha 3m unitek</span></a></span></h3>

                            <table id="tablepress-3" class="tablepress tablepress-id-3">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Niềng răng tháo lắp ( Cấp độ 1-4 )</td><td class="column-2">Trọn gói</td><td class="column-3">3.000.000 - 12.000.000</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Niềng răng mắc cài kim loại ( Cấp độ 1-3 )</td><td class="column-2">Trọn gói</td><td class="column-3">26.000.000 - 36.000.000</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Niềng răng mắc cài sứ ( Cấp độ 1-3 )</td><td class="column-2">Trọn gói</td><td class="column-3">34.000.000 - 38.000.000</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">Niềng răng thẩm mỹ mắc cài mặt lưỡi ( Cấp độ 1-3 )</td><td class="column-2">Trọn gói</td><td class="column-3">60.000.000 - 80.000.000</td>
                                    </tr>
                                    <tr class="row-6 even">
                                        <td class="column-1">Niềng răng khay trong Invisalign</td><td class="column-2">Trọn gói</td><td class="column-3">80.000.000 - 140.000.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-3 from cache -->
                            <div class="udrs-pages">
                                <div class="tt-udrs" style="text-align: center;"><i class="fas fa-gift"></i><strong>NIỀNG RĂNG CHỈNH NHA 3M UNITEK</strong></div>
                                <div class="des-udrs" style="text-align: center;">( Không Đau Nhức - Rút Ngắn Thời Gian - Cam Kết Hiệu Quả )</div>
                                <i class="fas fa-tooth"></i><span style="color: #ff6600;"><strong>Mừng sinh nhật 17 tuổi, giảm chi phí niềng răng thẩm mỹ lên đến 20% chỉ từ</strong></span> <span style="color: #ed1c24;"><span style="background-color: #f5f0f0;"><strong>10</strong></span><strong><span style="background-color: #f5f0f0;">&nbsp;</span></strong><strong>triệu đồng.</strong></span>

                                <span style="font-size: 130%;"><strong><span style="color: #00a859;">Chính sách trả góp khi niềng răng tại Nha khoa Thiên Thần:</span></strong></span>
                                <ul>
                                    <li>Trả trước <span style="color: #ed1c24;"><strong>8 triệu</strong></span> với mắc cài kim loại (các tháng sau chỉ trả 1 triệu/ tháng)</li>
                                    <li>Trả trước <strong><span style="color: #ed1c24;">14 triệu</span></strong> với mắc cài sứ (các tháng sau chỉ trả 1 triệu/ tháng)</li>
                                </ul>
                                Thăm khám và tư vấn trực tiếp hoàn toàn miễn phí.
                                <div class="callaction textaligncenter"><a class="nutgoidien" href="tel:19000058">1900.0058</a><a class="nutdangky" href="https://nhakhoafamily.vn/bang-gia-nieng-rang/">&gt;&gt; Chi Tiết Ưu Đãi &lt;&lt;</a></div>
                                <div><strong>LƯU Ý:</strong></div>
                                <ul class="uluudaithem">
                                    <li>- Có chính sách ưu đãi đặc biệt với sinh viên và khách hàng có hoàn cảnh khó khăn khi thăm khám trực tiếp</li>
                                    <li>- Chi tiết bảng giá, các ưu đãi và hỗ trợ khách hàng tham khảo tại <a href="https://nhakhoafamily.vn/bang-gia-nieng-rang/">&gt;&gt; Bảng Giá Chi Tiết Niềng Răng &lt;&lt;</a></li>
                                </ul>
                            </div>
                            <h3 class="tt-dichvunhakhoa"><a href="https://nhakhoafamily.vn/cay-ghep-rang-implant-sure/"><span id="implant" class="pagebanggia">bảng giá Trồng răng implant sure</span></a></h3>

                            <table id="tablepress-4" class="tablepress tablepress-id-4">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Implant Osstem, SG, BioTem (Hàn Quốc)</td><td class="column-2">1 Trụ</td><td class="column-3">14.000.000</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Implant Dentium, Platon, Mis (Đức)</td><td class="column-2">1 Trụ</td><td class="column-3">18.000.000</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Implant Tekka, Kontact, Brath (Pháp)</td><td class="column-2">1 Trụ</td><td class="column-3">22.000.000</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">Implant Nobel CC, Ankylos, Straumann SLA (Thụy Sĩ)</td><td class="column-2">1 Trụ</td><td class="column-3">26.000.000</td>
                                    </tr>
                                    <tr class="row-6 even">
                                        <td class="column-1">Implant Straumann SLA Active (Thụy Sỹ)</td><td class="column-2">1 Trụ</td><td class="column-3">32.000.000</td>
                                    </tr>
                                    <tr class="row-7 odd">
                                        <td class="column-1">Implant Nobel Active (Mỹ)</td><td class="column-2">1 Trụ</td><td class="column-3">32.000.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-4 from cache -->
                            <div class="udrs-pages">
                                <div class="tt-udrs" style="text-align: center;"><i class="fas fa-gift"></i><strong>TRỒNG RĂNG KHÔNG ĐAU IMPLANT SURE</strong></div>
                                <div class="tt-udrs" style="text-align: center;"><span class="_7oe">&nbsp;( An Toàn - Bền Chắc - Thẩm Mỹ )</span></div>
                                <div></div>
                                ✨ <em><strong>Cấy ghép Implant Hàn Quốc trọn gói chỉ <span style="color: #ff0000;">7,2tr</span> tặng thêm mão sứ Titan.</strong></em>
                                <div>

                                    <span class="_7oe"> ✨</span> Thực hiện theo công nghệ Implant Sure tiêu chuẩn Châu Âu, phần mềm mô phỏng cắm Implant 3D, cùng trình độ chuyên môn cao của các Bác sĩ. Chúng tôi đã thực hiện thành công trên 99% các ca cấy ghép Implant.
                                    <div><span class="_7oe"> ✨</span> Dịch vụ cấy ghép Implant Sure tại Nha khoa Thiên Thần đang được áp dụng rất nhiều ưu đãi và hỗ trợ lên tới <strong>hơn <span style="color: #ff0000;">20 triệu đồng</span></strong>, tùy theo các gói dịch vụ, quý khách hàng vui lòng liên hệ tư vấn hoặc bấm vào xem thêm để biết chi tiết.</div>
                                    <div></div>
                                </div>
                                <div><span style="font-size: 120%;"><span style="color: #339966;">Xem thêm</span> <strong><span style="color: #ff0000;"><a style="color: #ff0000;" href="https://nhakhoafamily.vn/trong-rang-implant/">Ưu điểm vượt trội của công nghệ trông răng Implant sure</a></span></strong></span></div>
                                <div>
                                    <div></div>
                                    <div></div>
                                    <div></div>
                                    <div class="callaction textaligncenter"><a class="nutgoidien" href="tel:19000058">1900.0058</a><a class="nutdangky" href="https://nhakhoafamily.vn/bang-gia-trong-implant/">&gt;&gt; Xem Thêm &lt;&lt;</a></div>
                                    <div></div>
                                </div>
                            </div>
                            <h3 class="tt-dichvunhakhoa"><a href="https://nhakhoafamily.vn/tay-trang-rang-tham-my/"><span id="implant" class="pagebanggia">bảng giá Tẩy trắng răng Whiteness</span></a></h3>

                            <table id="tablepress-7" class="tablepress tablepress-id-7">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Tẩy trắng răng tại nhà</td><td class="column-2">Trọn gói</td><td class="column-3">1.500.000<br>
                                        </td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Tẩy trắng răng Whiteness</td><td class="column-2">Trọn gói</td><td class="column-3">2.500.000</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Tẩy trắng răngcông nghệ cao ( kết hợp tại phòng khám và ở nhà )</td><td class="column-2">Trọn gói</td><td class="column-3">3.000.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-7 from cache -->
                            <div class="udrs-pages">
                                <div class="tt-udrs" style="text-align: center;"><i class="fas fa-gift"></i><strong>TẨY TRẮNG RĂNG WHITENESS</strong></div>
                                <div class="des-udrs" style="text-align: center;">( Hiệu quả cao - Không ê buốt - Không hại men răng )</div>
                                <em>&gt;&gt; Nha khoa Thiên Thần triển khai chương trình ưu đãi cực hấp dẫn đối với dịch vụ tẩy trắng răng &lt;&lt;</em>
                                <div>

                                    <span class="_7oe">✨ </span><span class="_7oe">Tẩy trắng răng công nghệ mới kết hợp tại phòng khám và ở nhà <span style="color: #ed1c24;"><strong>1,8tr đồng</strong></span> ( giá gốc 3tr )</span>

                                </div>
                                <div><span class="_7oe"><span class="_7oe">✨ </span></span><span class="_7oe"><span class="_7oe">Tẩy trắng răng Whiteness tại phòng khám ưu đãi sốc chỉ với <span style="color: #ed1c24;"><strong>1,5tr đồng</strong></span> ( giá gốc 2,5tr )</span></span></div>
                                <div>
                                    <div></div>
                                    <div class="callaction textaligncenter"><a class="nutgoidien" href="tel:19000058">1900.0058</a><a class="nutdangky" href="https://nhakhoafamily.vn/bang-gia-trong-implant/">&gt;&gt; Xem Thêm &lt;&lt;</a></div>
                                    <div></div>
                                </div>
                            </div>
                            <h3 class="tt-dichvunhakhoa"><a href="https://nhakhoafamily.vn/nho-rang/"><span id="nho-rang" class="pagebanggia">bảng giá Nhổ răng không đau</span></a></h3>

                            <table id="tablepress-5" class="tablepress tablepress-id-5">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Nhổ răng cửa</td><td class="column-2">1 răng</td><td class="column-3">200.000 - 400.000</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Nhổ răng hàm</td><td class="column-2">1 răng</td><td class="column-3">400.000 - 700.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-5 from cache -->
                            <h3 class="tt-dichvunhakhoa"><a href="https://nhakhoafamily.vn/tram-rang-tham-my/"><span id="han-tram-rang" class="pagebanggia">bảng giá Hàn trám răng thẩm mỹ</span></a></h3>

                            <table id="tablepress-6" class="tablepress tablepress-id-6">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Trám răng sữa</td><td class="column-2">1 răng</td><td class="column-3">100.000</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Hàn trám cổ răng</td><td class="column-2">1 răng</td><td class="column-3">200.000</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Trám bít hố rãnh</td><td class="column-2">1 răng</td><td class="column-3">150.000</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">Hàn trám răng thẩm mỹ</td><td class="column-2">1 răng</td><td class="column-3">500.000</td>
                                    </tr>
                                    <tr class="row-6 even">
                                        <td class="column-1">Tái tạo răng thẩm mỹ bằng Composite</td><td class="column-2">1 răng</td><td class="column-3">500.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-6 from cache -->
                            <h3 class="tt-dichvunhakhoa"><span id="#" class="pagebanggia">bảng giá – Răng đính kim cương</span></h3>

                            <table id="tablepress-8" class="tablepress tablepress-id-8">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Kim cương tự nhiên</td><td class="column-2">1 viên</td><td class="column-3">3.000.000 – 6.000.000</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Kim cương nhân tạo</td><td class="column-2">1 viên</td><td class="column-3">1.000.000</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Gắn đá và kim cương của khách lên răng thật</td><td class="column-2">1 răng</td><td class="column-3">200.000</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">Gắn đá và kim cương của khách lên răng sứ</td><td class="column-2">1 răng</td><td class="column-3">500.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-8 from cache -->
                            <h3 class="tt-dichvunhakhoa"><span id="dieu-tri-nha-chu" class="pagebanggia">bảng giá Điều trị nha chu</span></h3>

                            <table id="tablepress-9" class="tablepress tablepress-id-9">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Khám răng</td><td class="column-2">Trọn gói</td><td class="column-3">Miễn phí</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Đánh bóng răng</td><td class="column-2">1 ca</td><td class="column-3">100.000</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Lấy cao răng &amp; đánh bóng</td><td class="column-2">1 ca</td><td class="column-3">200.000</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">Điều trị viêm nha chu</td><td class="column-2">1 ca</td><td class="column-3">1.000.000 - 3.000.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-9 from cache -->
                            <h3 class="tt-dichvunhakhoa"><span id="dieu-tri-tuy-rang" class="pagebanggia">bảng giá Điều trị tủy răng</span></h3>

                            <table id="tablepress-11" class="tablepress tablepress-id-11">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị tính</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Điều trị tủy răng sữa</td><td class="column-2">1 răng</td><td class="column-3">300.000 - 500.000</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Điều trị tủy răng vĩnh viễn</td><td class="column-2">1 răng</td><td class="column-3">700.000 - 1.500.000</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Điều trị tủy lại răng cửa</td><td class="column-2">1 răng</td><td class="column-3">1.000.000</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">Điều trị tủy lại răng hàm</td><td class="column-2">1 răng</td><td class="column-3">1.500.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-11 from cache -->
                            <h3 class="tt-dichvunhakhoa"><span id="xu-ly-cuoi-ho-loi" class="pagebanggia">bảng giá Điều trị cười hở lợi, tụt lợi</span></h3>

                            <table id="tablepress-12" class="tablepress tablepress-id-12">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Đơn vị tính</th><th class="column-3">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Chữa cười hở lợi -Smile Design ( Cắt nướu )</td><td class="column-2">Liệu trình</td><td class="column-3">12.000.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-12 from cache -->
                            <h3 class="tt-dichvunhakhoa"><span id="xu-ly-cap-cuu-nha-khoa" class="pagebanggia">bảng giá Xử lý cấp cứu nha khoa</span></h3>

                            <table id="tablepress-13" class="tablepress tablepress-id-13">
                                <thead>
                                    <tr class="row-1 odd">
                                        <th class="column-1">Dịch vụ</th><th class="column-2">Chi phí (VNĐ)</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">Cắm từ 1 - 2 răng + cố định răng bằng kẽm</td><td class="column-2">2.000.000 - 3.000.000</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">Cố định hàm bằng cung ( 1 - 2 hàm )</td><td class="column-2">2.000.000 - 3.000.000</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">Cắm lại răng + Cố định ( 1 - 2 hàm )</td><td class="column-2">2.000.000 - 3.000.000</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">Cắm từ 2 răng + cố định ( 1 - 2 hàm )</td><td class="column-2">2.500.000 - 3.500.000</td>
                                    </tr>
                                    <tr class="row-6 even">
                                        <td class="column-1">Cố định hàm</td><td class="column-2">1.000.000</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- #tablepress-13 from cache -->
                            <h2 class="h2-sv">BẢO HÀNH RĂNG SỨ</h2>
                            <blockquote>
                                <ul>
                                    <li><strong><span style="color: #ff0000;">Bảo hành 5 năm</span></strong> đối với các dòng răng sứ kim loại</li>
                                    <li><span style="color: #ff0000;"><strong>Bảo hành 5-10 năm</strong></span> đối với các dòng răng toàn sứ</li>
                                    <li><span style="color: #ff0000;"><strong>Bảo hành 10-20 năm</strong> </span>đối với dòng răng sứ cao cấp Ceramill, Emax Nacera, Veneer,…</li>
                                    <li><span style="color: #ff0000;"><b>Hỗ trợ bảo hành trọn đời cho tất cả khách hàng làm răng sứ thẩm mỹ.</b></span></li>
                                </ul>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </main>

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
                    function control() {
                        alert("Xin hãy đăng nhập để được đặt lịch!!!");
                    }
        </script>
    </body>
</html>
