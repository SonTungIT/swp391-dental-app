<%-- 
    Document   : dashbord.jsp
    Created on : Jun 25, 2022, 3:17:05 PM
    Author     : QUANG VAN
--%>
<%@page import="sample.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("index.jsp");
            }

        %>
        <div class="flex-1 ms-2">            
            <p class="text-muted mb-0">Số lượng truy cập web</p>
            <p>${view}</p>
        </div>
        <div class="flex-1 ms-2">            
            <p class="text-muted mb-0">Bác sĩ</p>
            <p>${doctor}</p>
        </div>
        <div class="flex-1 ms-2">            
            <p class="text-muted mb-0">Bệnh nhân</p>
            <p>${patient}</p>
        </div>
        <div class="flex-1 ms-2">            
            <p class="text-muted mb-0">Lịch hẹn</p>
            <p>${booking}</p>
        </div>
        <div class="flex-1 ms-2">            
            <p class="text-muted mb-0">Lịch hẹn trong 1 tuần</p>
            <p>${numberBookingInOneWeek}</p>
        </div>
    </body>
</html>
