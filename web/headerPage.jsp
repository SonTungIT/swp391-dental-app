<%-- 
    Document   : headerPage
    Created on : Jul 7, 2022, 3:30:36 PM
    Author     : Lenovo Legion
--%>

<%@page import="sample.services.ServiceDTO"%>
<%@page import="sample.services.CategoryServiceDTO"%>
<%@page import="sample.user.PatientDAO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.AdminDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="a" class="sample.informattion.NewsDAO" scope="request" />
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
    <link href="CSS/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/style.css" rel="stylesheet" type="text/css"/>

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
                    <ul style="flex-direction: column; justify-content: center" class="d-lg-flex header-w3_pvt justify-content-lg-end">
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
                        <%if (loginUser
                                    == null || !loginUser.getRoleID()
                                            .equals("PT")) {
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

                <% if (loginUser
                            == null) {
                %>
                <div class="login-icon ml-2">
                    <a class="user" href="login.jsp"> LOGIN </a>
                </div>
                <% } else if (loginUser
                        != null && loginUser.getRoleID()
                                .equals("AD")) {
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
                } else if (loginUser
                        != null && loginUser.getRoleID()
                                .equals("PT")) {
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
                } else if (loginUser
                        != null && loginUser.getRoleID()
                                .equals("DR")) {
                %>
                <div class="dropdown btn-group">
                    <a class="navbar-brand dropdown-toggle" href="doctor.jsp" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="./images/doctors/${LOGIN_USER.image}" style="width: 50px; height: 50px ; border-radius: 40px; margin-top: -7px; margin-left: 5px" alt="Doctor" class="profile-pic me-2">
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

    <!--ChatBot-->
    <a  style="background-color: transparent;
        position: fixed;
        bottom: 45px;
        right: 15px;
        display: block;
        z-index: 1000" 
        class="social-icon social-icon--facebook" href="https://www.facebook.com/messages/t/100005933477553/" target="_blank"> 
        <img style="width: 50px" src="images/logo-mess.png"> 
    </a>
    
    <!--ChatBot-->
</body>
</html>
