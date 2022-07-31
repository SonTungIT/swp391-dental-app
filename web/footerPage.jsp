<%-- 
    Document   : footerPage
    Created on : Jul 11, 2022, 11:05:14 AM
    Author     : Lenovo Legion
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.AdminDAO"%>
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
                    <p>
                        <span class="fa mr-2 fa-envelope">
                            
                        </span>
                        <a href="https://mail.google.com/mail/u/0/#inbox?compose=GTvVlcSDbFbKXhBscndchvNMgKCFXwjJHxXXzXfPHPdmVSlstvvzbkFPTPwWmsHMdGBnDjXqzxkML">phongkhamnhakhoathienthan@gmail.com</a>
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
</body>
</html>
