<%-- 
    Document   : showBooking
    Created on : Jun 20, 2022, 10:46:00 PM
    Author     : QUANG VAN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.booking.BookingDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Booking Page</title>
    </head>
    <style>

        .pagination{
            display: inline-block;
        }
        .pagina a{
            color: black;
            font-size: 22px;
            float: left ;
            padding: 8px 16px;
            text-decoration: none;
        }
        .pagination a.active{
            background-color: #4CAF50;
            color: while;
        }
        .pagination a:hover:not(.active){
            background-color: chocolate;
        }
    </style>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
            }

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        <div class="content">     
            <form action="MainController">
                <input type="text" name="search"  value="<%= search%>" placeholder="Tìm kiếm lịch hẹn..."/>
                <input type="submit" name="action"  value="Search Booking" />

            </form>
        </div>
                
    </div>
           
    <div class="table-responsive">
        <%  List<BookingDTO> list = (List<BookingDTO>) session.getAttribute("LIST_BOOKING");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <c:set var="page" value="${sessionScope.page}"/>
        <div class="pagination">
            <c:forEach begin="${1}" end="${sessionScope.number}" var="i">
                <a class="${i==page?"active":""}" href="MainController?action=ShowBooking&page=${i}">${i}</a>
            </c:forEach>
        </div>
        <table border="1">
            <thead>
                <tr>
                    <th>Số thứ tự</th>
                    <th>Mã lịch hẹn</th>
                    <th>Họ và tên bệnh nhân</th>
                    <th>Giới tính</th>
                    <th>Dịch vụ khám</th>
                    <th>Bác sĩ </th>
                    <th>Ngày đặt lịch</th>
                    <th>Thời gian đặt lịch</th>
                    <th>Slot Name</th>
                    <th>Slot Time</th>
                    <th>Trạng thái</th>
                    <th>Xóa</th>


                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (BookingDTO booking : list) {
                %>
            <form action="MainController">
                <tr>

                    <td><%=count++%></td>
                    <td><%=booking.getBookingID()%></td>
                    <td><%=booking.getPatientName()%></td>
                    <td><%=booking.getPatientGender()%></td>                                              
                    <td><%=booking.getServiceName()%></td>
                    <td><%=booking.getDoctorName()%></td>
                    <td><%=booking.getDateBooking()%></td>
                    <td><%=booking.getTimeBooking()%></td>
                    <td><%=booking.getSlotName()%></td>
                    <td><%=booking.getSlotTime()%></td>
                    <td><%=booking.getStatus()%></td>                    
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="bookingID" value="<%=booking.getBookingID()%>"/>
                            <input type="submit"  name="action" value="Xóa lịch hẹn"/>
                        </form>

                    </td>   
                </tr>
            </form>
            <%
                }
            %>
            </tbody>
        </table>


        <%
                }
            }
        %> 
    </div>
    </body>
</html>
