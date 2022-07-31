<%-- 
    Document   : priceServiceHome
    Created on : Jun 26, 2022, 9:30:30 PM
    Author     : dangk
--%>


<%@page import="sample.user.AdminDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.services.ServiceDTO"%>
<%@page import="sample.services.CategoryServiceDTO"%>
<%@page import="sample.user.PatientDAO"%>
<%@page import="java.util.List"%>
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
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/price.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/bkstyle.css" rel="stylesheet" type="text/css"/>
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
    <%
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
    %>
    <body>       

        <!--ChatBot-->
        <a  style="background-color: transparent;
            position: fixed;
            bottom: 55px;
            right: 15px;
            display: block;
            z-index: 1000" 
            class="social-icon social-icon--facebook" href="https://www.facebook.com/messages/t/100005933477553/" target="_blank"> 
            <img style="width: 50px" src="images/logo-mess.png"> 
        </a>
        <!--ChatBot-->
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
                        <ul style="flex-direction: column;" class="d-lg-flex header-w3_pvt justify-content-lg-end">
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
                            <img src="./images/doctors/${LOGIN_USER.image}" style="width: 50px; height: 50px ; border-radius: 40px; margin-top: -7px; margin-left: 5px" alt="patient" class="profile-pic me-2">
                        </a>
                        <ul class="dropdown-menu" style="background-color: #63B43E">
                            <a href="ShowProfileDoctorController?doctorID=${LOGIN_USER.getUserID()}" style="padding: 0">
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
                    <div style="max-width: 100%;" id="col-2021140538" class="col small-12 large-12">
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
                            <div style="margin-bottom: 20px" class="container section-title-container"><h2 class="section-title section-title-bold-center"><b></b><span class="section-title-main"><i class="icon-menu"></i>Bảng giá dịch vụ nha khoa tại Nha khoa Thiên Thần</span><b></b></h2></div>
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
                <%
                    List<CategoryServiceDTO> listCate1 = dao1.getTableCategory();
                    if (listCate1 != null) {
                        if (listCate1.size() > 0) {
                            for (CategoryServiceDTO cate : listCate1) {


                %>
                <p>&nbsp;</p>
                <div class="row row-collapse" id="row-409067757">
                </div>
                <div class="row" style="max-width:900px" id="row-2037044618">
                    <div id="col-592795447" class="col small-12 large-12">
                        <div class="col-inner">
                            <h3 class="title-know"> 
                                <a>
                                    <span class="">Bảng Giá <%= cate.getCategoryName()%></span>
                                </a>
                            </h3>
                            <%
                                String cate1 = cate.getCategoryName();

                                List<ServiceDTO> listPrice = dao1.getListPriceServiceHome(cate1);
                                if (listPrice != null) {
                                    if (listPrice.size() > 0) {
                            %>
                            <table id="tablepress-24" class="col-lg-12 tablepress">
                                <thead>
                                    <tr class="editPrice row-1 odd">
                                        <th class="column-1">NO</th>  
                                        <th class="column-2">TÊN DỊCH VỤ</th> 
                                        <th class="column-3">CHI PHÍ(VNĐ)</th> 
                                    </tr>
                                </thead>
                                <%
                                    int count = 1;
                                    for (ServiceDTO PriceService : listPrice) {

                                %>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1">
                                            <%= count++%>
                                        </td>

                                        <td class="column-2">
                                            <%= PriceService.getServiceName()%>
                                        </td>

                                        <td class="column-3">
                                            <%= PriceService.getPrice()%>
                                        </td>
                                    </tr>
                                    <%
                                        }

                                    %> 
                                </tbody>
                            </table>
                            <%                    }
                                            }
                                        }
                                    }
                                }

                            %>
                            <!-- #tablepress-13 from cache -->
                            <h2 class="title-know mt-5 mb-4 ">BẢO HÀNH RĂNG SỨ</h2>
                            <blockquote class="mb-5">
                                <ul style="border-left: 3px solid; border-color: #2d7745; font-size: 18px">
                                    <li><strong><span style="margin-left: 10px; color: #ff0000;">Bảo hành 5 năm</span></strong> đối với các dòng răng sứ kim loại</li>
                                    <li><span style="margin-left: 10px; color: #ff0000;"><strong>Bảo hành 5-10 năm</strong></span> đối với các dòng răng toàn sứ</li>
                                    <li><span style="margin-left: 10px; color: #ff0000;"><strong>Bảo hành 10-20 năm</strong> </span>đối với dòng răng sứ cao cấp Ceramill, Emax Nacera, Veneer,…</li>
                                    <li><span style="margin-left: 10px; color: #ff0000;"><b>Hỗ trợ bảo hành trọn đời cho tất cả khách hàng làm răng sứ thẩm mỹ.</b></span></li>
                                </ul>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <!-- appointment -->
        <section class="appointment text-center py-5">
            <div class="container py-sm-3">
                <h4>Biến nụ cười mơ ước của bạn thành sự thật</h4>
                <p class="mt-3">Gọi chúng tôi để đặt lịch ngay</p>
                <p>+84123456789</p>
                <%if (loginUser == null || !loginUser.getRoleID().equals("PT")) {
                %>
                <li class=""><a href="login.jsp" onclick="control()">ĐẶT LỊCH NGAY</a></li>
                    <%
                    } else {
                    %>
                <li class=""><a href="MainController?action=ShowService" >ĐẶT LỊCH NGAY</a></li>
                    <%
                        }
                    %>
                <!--                <a href="MainController?action=ShowService">ĐẶT LỊCH NGAY</a>-->
            </div>
        </section>
        <!-- //appointment -->

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
                        <p><span class="fa mr-2 fa-envelope"></span><a href="https://mail.google.com/mail/u/0/#inbox?compose=GTvVlcSDbFbKXhBscndchvNMgKCFXwjJHxXXzXfPHPdmVSlstvvzbkFPTPwWmsHMdGBnDjXqzxkML">phongkhamnhakhoathienthan@gmail.com</a>

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
    <script>
                    function control() {
                        alert("Xin hãy đăng nhập để được đặt lịch!!!");
                    }
    </script>






</html>
