<%-- 
    Document   : services
    Created on : Jun 6, 2022, 12:18:42 PM
    Author     : Lenovo Legion
--%>

<%@page import="sample.user.PatientDAO"%>
<%@page import="sample.services.CategoryServiceDTO"%>
<%@page import="sample.services.ServiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.AdminDAO"%>
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
        <!-- //header -->
        <jsp:include page="headerPage.jsp"></jsp:include>
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
                        <a href="MainController?action=Show_About&serviceID=<%=ser.getServiceID() %>">
                            <div class="bg-layer--img">
                                <img width="348px" height="260px" src="./images/<%= ser.getImage() %>" alt="can't show">
                            </div>
                            <div class="ser1">
                                <div class="bg-layer">
                                    <h4 class=""><%=ser.getServiceName() %></h4>
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
