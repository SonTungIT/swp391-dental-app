<%-- 
    Document   : knowledge
    Created on : Jun 6, 2022, 12:18:01 PM
    Author     : Lenovo Legion
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="t" class="sample.informattion.KnowledgeDAO" scope="request" />
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
        
        <!-- //header -->
        <jsp:include page="headerPage.jsp"></jsp:include>
        <!-- //header -->

        <!-- banner -->
        <div class="innerpage-banner" id="home">
            <div class="inner-page-layer">
            </div>
        </div>
        <!-- //banner -->

        <!-- gallery -->
        <section class="gallery" id="gallery">
            <div class="container py-lg-5" style="display: flex">
                <div class="col-lg-9 left-blog-info text-left">
                    <h2 class="heading text-center mb-sm-5 mb-4">Kiến thức Nha Khoa</h2>
                    <div style="text-align: end">Ngày Đăng: ${oneknowledge.timepost}</div>
                    <div class="row news-grids text-center">
                        <div class="row item-list">
                            <div class="form-content">
                                <div class="title-know  title--know-big">
                                    ${oneknowledge.title1}
                                </div>
                                <div class="form-text--center">
                                    ${oneknowledge.context1}
                                </div>
                                <div class="image">
                                    <img src="${oneknowledge.image1}" width="900" height="600"/>
                                </div>
                            </div>
                            <div class="form-content">
                                <div class="title-know  title--know-big">
                                    ${oneknowledge.title2}
                                </div>
                                <div class="form-text--center">
                                    ${oneknowledge.context2}
                                </div>
                                <div class="image">
                                    <img src="${oneknowledge.image2}" width="900" height="600"/>
                                </div>
                            </div>        
                            <div class="form-content">
                                <div class="title-know  title--know-big">
                                    ${oneknowledge.title3}
                                </div>
                                <div class="form-text--center">
                                    ${oneknowledge.context3}
                                </div>
                                <div class="image">
                                    <img src="${oneknowledge.image3}" width="900" height="600"/>
                                </div>
                            </div>
                            <div class="form-content">
                                <div class="title-know  title--know-big">
                                    ${oneknowledge.title4}
                                </div>
                                <div class="form-text--center">
                                    ${oneknowledge.context4}
                                </div>
                                <div class="image">
                                    <img src="${oneknowledge.image4}" width="900" height="600"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <aside class="col-lg-3 right-blog-con text-left ml-5">
                    <div class="right-blog-info text-left mt-5">
                        <div class="widget">
                            <div class="title-bl"><span>Kiến thức mới nhất</span></div>
                            <div class="sidebar-menu">
                                <ul class="widget-list">
                                    <c:forEach items="${t.top4}" var="o">
                                        <li>
                                            <a style="line-height: 5px; font-size: 16px" href="DetailKnowledgeController?idDetai=${o.idDetai}">
                                                ${o.title1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </aside>                
            </div>
        </section>
        <!-- //gallery -->

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
    </body>
</html>
