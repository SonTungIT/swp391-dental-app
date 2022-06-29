<%-- 
    Document   : about
    Created on : Jun 6, 2022, 12:14:54 PM
    Author     : Lenovo Legion
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.AdminDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dental Health Medical Category Flat Bootstrap Responsive Website Template | About :: W3layouts</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Dental Health Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
                F
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
                        <li class=""><a href="booking.jsp">ĐẶT LỊCH</a></li>
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

        <!-- banner -->
        <div class="innerpage-banner" id="home">
            <div class="inner-page-layer">

            </div>
        </div>
        <!-- //banner -->

        <!-- about -->
        <section class="about py-5">
            <div class="container py-md-3">
                <h2 class="heading text-center mb-sm-5 mb-4">GIỚI THIỆU </h2>
                <div class="row">
                    <div class="col-lg-8">
                        <h4 class="about-left">Uy tín luôn là hàng đầu!</h4>
                        <p class="mt-sm-4 mt-3">Trung tâm Nha khoa Thiên Thần được thành lập từ tháng 8 năm 2009. Sau hơn 12
                            năm hoạt động, trung tâm đã tạo dựng được uy tín và sự tin cậy từ phía khách hàng, dần khẳng
                            định được vị thế của mình trong những trung tâm chăm sóc răng miệng hàng đầu Việt Nam, chuyên về
                            cấy ghép Implant và răng sứ thẩm mỹ.</p>
                        <div class="row mt-4">
                            <img src="images/banner-dental.jpg" class="img-fluid" alt="" />
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-8 dental">
                        <img src="images/tooth.png" class="img-fluid" alt="" />
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
                        <img src="images/service-1.jpg" class="img-fluid" alt="" />
                    </div>
                    <div class="col-lg-6 mt-lg-0 mt-5">
                        <h4>Dịch vụ đa dạng đem đến những trải nghiệm tốt nhất.</h4>
                        <p class="py-3">Là địa chỉ uy tín, chất lượng hàng đầu về điều trị, thẩm mỹ. Cấy ghép Implant, Răng
                            sứ thẩm mỹ, Niềng răng chỉnh nha là những dịch vụ được Nha Khoa chú trọng, liên tục phát triển
                            cả về kỹ thuật lẫn thiết bị. Sau nhiều năm hoạt động, Nha Khoa tự tin với con số hơn 10.000 ca
                            Cấy ghép Implant, 100 ca sứ thẩm mỹ/ tháng và triệu các ca chỉnh nha lớn, nhỏ đều nhận được phản
                            hồi tốt và sự hài lòng tuyệt đối từ khách hàng.</p>
                        <p class="">Luôn đón nhận, cập nhật những công nghệ nha khoa mới nhất, tốt nhất, nha khoa Thiên Thần
                            hiện ứng dụng các công nghệ nha khoa thẩm mỹ và điều trị bệnh lý bao gồm: Bọc răng sứ Perfect
                            Smile ,Niềng răng 3D UGSL, Cấy ghép implant, Tẩy trắng răng flash white, Nhổ răng máy siêu âm
                            Piezotome...</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container pb-lg-3">
            <div class="row bottom-grids">
                <div class="col-lg-6">
                    <img src="images/room-dental.jpg" class="img-fluid" alt="" />
                </div>
                <div class="col-lg-6 mt-lg-0 mt-5">
                    <h4>Trang thiết bị tiên tiến, hiện đại nhất.</h4>
                    <p class="py-3">Nha khoa Thiên Thần là đơn vị tiên phong ứng dụng và nhập khẩu hệ thống trang thiết
                        bị, máy móc hiện đại, qua những kiểm định khắt khe trong và ngoài nước để đưa về các cơ sở sử
                        dụng như:
                    </p>
                    <p class="">
                        Máy nhổ răng siêu âm Piezotome .
                    </p>
                    <p>Máy chụp phim Xquang ConeBeam CT 3D.</p>
                    <p>Máy cấy ghép implant.</p>
                    <p>Phần mềm thiết kế nụ cười DSD.</p>
                    <p>Phần mềm 3D .</p>


                </div>
            </div>
    </section>
    <!-- //about bottom -->



    <!-- appointment -->
    <section class="appointment text-center py-5">
        <div class="container py-sm-3">
            <h4>Biến nụ cười mơ ước của bạn thành sự thật</h4>
            <p class="mt-3">Gọi chúng tôi để đặt lịch ngay</p>
            <p>+84123456789</p>
            <a style="font-size: 30px" href="booking.jsp">ĐẶT LỊCH NGAY</a>
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
</html>
