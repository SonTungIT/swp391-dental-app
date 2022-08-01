<%-- 
    Document   : knowledge
    Created on : Jun 6, 2022, 12:18:01 PM
    Author     : Lenovo Legion
--%>

<%@page import="sample.services.ServiceDTO"%>
<%@page import="sample.services.CategoryServiceDTO"%>
<%@page import="sample.user.PatientDAO"%>
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


        <title>Dental Health Medical Category Flat Bootstrap Responsive Website Template | Gallery :: W3layouts</title>
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
                            <img src="./images/customers/" style="width: 50px; border-radius: 30px; margin-top: -7px; margin-left: 5px" alt="patient" class="profile-pic me-2">
                        </a>
                        <ul class="dropdown-menu" style="background-color: #63B43E">
                            <a href="patient.jsp" style="padding: 0">
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

        <!-- gallery -->

        <section class="gallery py-5" id="gallery">
            <div class="container py-lg-5" style="display: flex">
                <div class="col-lg-9 left-blog-info text-left">
                    <h2 class="heading text-center mb-sm-5 mb-4">Kết quả tìm kiếm</h2>
                    <h3>${requestScope.ERROR}</h3>
                    <div class="row news-grids text-center">
                        <div class="row item-list">
                            <c:forEach items="${list}" var="s">
                                <c:if test="${s.categoryId == 1}"> 
                                    <div style="border: 1px solid #333;
                                         border-radius: 5px;
                                         background: #f6f8fa;
                                         font-weight: 600;
                                         padding: 20px;
                                         box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);" class="form-content">
                                        <a style="font-size: 30px; color: #000" href="DetailNewsController?idDetail=${s.idDetai}">
                                            ${s.title1}
                                        </a>
                                        <div class="form-text--center">
                                            <p>${s.context1}</p>
                                        </div>
                                        <div class="image">
                                            <img src="${s.image1}"/>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${s.categoryId == 2}">

                                    <div style="border: 1px solid #333;
                                         border-radius: 5px;
                                         background: #f6f8fa;
                                         font-weight: 600;
                                         padding: 20px;
                                         box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);" class="form-content">
                                        <a style="font-size: 30px; color: #000" href="DetailKnowledgeController?idDetai=${s.idDetai}">
                                            ${s.title1}
                                            <div class="form-text--center">
                                                <p>${s.context1}</p>
                                            </div>
                                            <div class="image">
                                                <img src="${s.image1}"/>
                                            </div>
                                    </div> 
                                </c:if>
                                <c:if test="${s.categoryId == 3}">

                                    <div style="border: 1px solid #333;
                                         border-radius: 5px;
                                         background: #f6f8fa;
                                         font-weight: 600;
                                         padding: 20px;
                                         box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);" class="form-content">
                                        <a style="font-size: 30px; color: #000" href="about.jsp">
                                            ${s.title1}
                                            <div class="form-text--center">
                                                <p>${s.context1}</p>
                                            </div>
                                            <div class="image">
                                                <img src="${s.image1}"/>
                                            </div>
                                    </div> 
                                </c:if>
                                <c:if test="${s.categoryId == 4}">

                                    <div style="border: 1px solid #333;
                                         border-radius: 5px;
                                         background: #f6f8fa;
                                         font-weight: 600;
                                         padding: 20px;
                                         box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);" class="form-content">
                                        <a style="font-size: 30px; color: #000" href="expert.jsp">
                                            ${s.title1}
                                            <div class="form-text--center">
                                                <p>${s.context1}</p>
                                            </div>
                                            <div class="image">
                                                <img src="${s.image1}"/>
                                            </div>
                                    </div> 
                                </c:if>
                            </c:forEach>


                            <div>
                                <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                    <a style="padding: 10px; background: #2d7745; margin-left: 10px; color: white; font-size: 20px; border-radius: 10px" href="SearchInformationController?index=${i}&txtSearch=${requestScope.saveinfo}">
                                        ${i}
                                    </a>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- //gallery -->

        <!-- appointment -->
        <section class="appointment text-center py-5">
            <div class="container py-sm-3">
                <h4>Biến nụ cười mơ ước của bạn thành sự thật</h4>
                <p class="mt-3">Gọi chúng tôi để đặt lịch ngay</p>
                <p>+84123456789</p>
                <a style="font-size: 30px" href="MainController?action=ShowService">ĐẶT LỊCH NGAY</a>
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
