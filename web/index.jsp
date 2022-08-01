<%-- 
    Document   : index
    Created on : Jun 6, 2022, 12:14:03 PM
    Author     : Lenovo Legion
--%>

<%@page import="sample.feedback.FeedbackDTO"%>
<%@page import="sample.services.ServiceDTO"%>
<%@page import="sample.services.CategoryServiceDTO"%>
<%@page import="sample.user.PatientDAO"%>
<%@page import="sample.user.AdminDAO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <!-- //header -->
        <jsp:include page="headerPage.jsp"></jsp:include>
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
                                                        <a href="about.jsp" class="btn btn-banner my-sm-3 mb-3">Tìm hiểu
                                                            thêm</a>
                                                        <%if (loginUser == null || !loginUser.getRoleID().equals("PT")) {
                                                        %>
                                                    <a href="login.jsp" onclick="control()" class="btn btn-banner1 my-sm-3 mb-3">Đặt lịch
                                                        ngay</a>
                                                        <%
                                                        } else {
                                                        %>
                                                    <a href="MainController?action=ShowService" class="btn btn-banner1 my-sm-3 mb-3">Đặt lịch
                                                        ngay</a>
                                                        <%
                                                            }
                                                        %>

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
                                                    <a href="about.jsp" class="btn btn-banner my-sm-3 mb-3">Tìm hiểu
                                                        thêm</a>
                                                        <%if (loginUser == null || !loginUser.getRoleID().equals("PT")) {
                                                        %>
                                                    <a href="login.jsp" onclick="control()" class="btn btn-banner1 my-sm-3 mb-3">Đặt lịch
                                                        ngay</a>
                                                        <%
                                                        } else {
                                                        %>
                                                    <a href="MainController?action=ShowService" class="btn btn-banner1 my-sm-3 mb-3">Đặt lịch
                                                        ngay</a>
                                                        <%
                                                            }
                                                        %>
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
                                                    <a href="about.jsp" class="btn btn-banner my-sm-3 mb-3">Tìm hiểu
                                                        thêm</a>
                                                        <%if (loginUser == null || !loginUser.getRoleID().equals("PT")) {
                                                        %>
                                                    <a href="login.jsp" onclick="control()" class="btn btn-banner1 my-sm-3 mb-3">Đặt lịch
                                                        ngay</a>
                                                        <%
                                                        } else {
                                                        %>
                                                    <a href="MainController?action=ShowService" class="btn btn-banner1 my-sm-3 mb-3">Đặt lịch
                                                        ngay</a>
                                                        <%
                                                            }
                                                        %>
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
                <h3 class="heading text-center mb-sm-5">DỊCH VỤ NỔI BẬT</h3>
                <div class="row offer-grids">
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
                    <%
                        List<ServiceDTO> listService = dao.getTop6Service();
                        if (listService.size() > 0) {
                            for (ServiceDTO ser : listService) {

                    %>
                    <div class="col-lg-4 col-md-6 mt-md-0 hoverItem">
                        <a href="MainController?action=Show_About&serviceID=<%=ser.getServiceID()%>">
                            <div class="bg-layer--img">
                                <img width="348px" height="260px" src="./images/<%= ser.getImage()%>" alt="can't show">
                            </div>
                            <div class="ser1">
                                <div class="bg-layer">
                                    <h4 class=""><%=ser.getServiceName()%></h4>
                                </div>
                            </div>
                        </a>
                    </div> 

                    <%
                            }
                        }
                    %>           
                </div>
            </div>
        </section>
        <!-- //services -->

        <!-- testimonials -->
        <section class="feedback" id="testimonials">
            <div class="feedback-layer">
                <div class="container py-lg-5">
                    <h3 class="heading text-center mb-sm-5 mb-4">TRẢI NGHIỆM CỦA KHÁCH HÀNG</h3>
                    <div class="row">
                        <%
                            AdminDAO daoAD = new AdminDAO();
                            List<FeedbackDTO> listFB = daoAD.getListFeedBackActive3();
                            if (listFB != null) {
                                if (listFB.size() > 0) {
                        %>


                        <tbody>
                            <%
                                for (FeedbackDTO feedback : listFB) {
                            %>

                            <tr>
                        <div class="col-lg-4 col-md-6">    
                            <div class="feedback-info">


                                <div class="feedback-top p-4">
                                    <span class="fa fa-quote-right"></span>
                                    <p>  
                                        <%= feedback.getComment()%>
                                    <div class="clearfix"></div>
                                    </p>
                                </div>

                                <div class="feedback-grids">    
                                    <div class="feedback-img">
                                        <td>  
                                            <img width="80px" height="60px" src="images/customers/<%=feedback.getImage()%>" alt="Image can't show">
                                        </td>
                                    </div>
                                    <div class="feedback-img-info">
                                        <h5> <%= feedback.getPatientName()%></h5>
                                        <p class="font-italic">   <%= feedback.getDateFeedback()%> </p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div> 


                            </div>
                        </div>
                        <%
                            }

                        %>
                        </tr>

                        </tbody>

                        <%                            }
                            }
                        %>


                    </div>
                    <a href="MainController?action=active" class="btn-banner"> Xem Thêm </a>
                </div>
            </div>
        </section>
        <!-- //testimonials -->

        <!-- blog -->
        <section class="blog py-5">
            <div class="container py-md-5 py-3">
                <h3 class="heading text-center mb-sm-5 mb-4">
                    <a href="news.jsp">Tin tức nổi bật</a>

                </h3>
                <div class="row blog-grids">
                    <div class="col-lg-7 mb-lg-5 blog-img1">
                        <img src="https://newgatedental.com/wp-content/uploads/2022/02/cac-dang-rang-1.jpeg" alt="" class="img-fluid" />
                        <!-- <a href="single.html">Blog #1</a> -->
                    </div>
                    <div class="col-lg-5 mb-lg-5 mb-4">
                        <h5>29-06-2022.</h5>
                        <h4 class="my-3">Nụ cười mới, cuộc sống mới với chỉnh nha</h4>

                        <a href="DetailNewsController?idDetail=0006" class="btn-banner">Xem Bài Đăng</a>
                    </div>
                    <div class="col-lg-7 mb-lg-0 mb-4">
                        <h5>20-05-2022.</h5>
                        <h4 class="my-3">TOP 4 Dáng răng sứ Đẹp, Phong Cách, Form chuẩn
                            <br> Xu thế Nhất.
                        </h4>

                        <a href="DetailNewsController?idDetail=0001" class="btn-banner">Xem Bài Đăng</a>
                    </div>
                    <div class="col-lg-5 blog-img2">
                        <img src="images/news2.jpg" alt="" class="img-fluid" />
                        <!-- <a href="single.html">Blog #2</a> -->
                    </div>
                </div>
            </div>
        </section>
        <!-- //blog -->

        <!-- //footer -->
        <jsp:include page="footerPage.jsp"></jsp:include>
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
        <script>
                                                        function control() {
                                                            alert("Xin hãy đăng nhập để được đặt lịch!!!");
                                                        }
        </script>
    </body>


</html>