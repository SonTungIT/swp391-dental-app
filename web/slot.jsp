<%-- 
    Document   : slot
    Created on : Jun 10, 2022, 2:39:34 PM
    Author     : Xqy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slot Page</title>
    </head>
    <body>
        <%
            String mes = (String) request.getAttribute("MESSAGE_SLOTUD");
            if(mes == null){
                mes = "";
            }
        %>
        <!-- form chọn time hoạt động -->
        <form action="MainController">

            <h1>Từ Thứ 2 đến thứ 6:</h1>
            Giờ bắt đầu:
            <input type="text" list="timeStart" name="timeStart" required=""> 
            <datalist  id ="timeStart" >
                <option value="OFF">
                <option value="7:00">
                <option value="7:30">
                <option value="8:00">
                <option value="8:30">
                <option value="9:00">
                <option value="9:30">
                <option value="10:00">
                <option value="10:30">
                <option value="13:00">
                <option value="13:30">
                <option value="14:00">
                <option value="14:30">
                <option value="15:00">
                <option value="15:30">
                <option value="16:00">
                <option value="16:30">
            </datalist></br></br>

            Giờ kết thúc:
            <input type="text" list="timeEnd" name="timeEnd" required=""> 
            <datalist id ="timeEnd">
                <option value="OFF">
                <option value="7:00">
                <option value="7:30">
                <option value="8:00">
                <option value="8:30">
                <option value="9:00">
                <option value="9:30">
                <option value="10:00">
                <option value="10:30">
                <option value="13:00">
                <option value="13:30">
                <option value="14:00">
                <option value="14:30">
                <option value="15:00">
                <option value="15:30">
                <option value="16:00">
                <option value="16:30">
                <option value="17:00">
            </datalist></br></br>
            <h1>Thứ 7 và Chủ nhật:</h1>
            Giờ bắt đầu:
            <input type="text" list="timeStartL" name="timeStartL" required=""> 
            <datalist id ="timeStartL">
                <option value="OFF">
                <option value="7:00">
                <option value="7:30">
                <option value="8:00">
                <option value="8:30">
                <option value="9:00">
                <option value="9:30">
                <option value="10:00">
                <option value="10:30">
                <option value="13:00">
                <option value="13:30">
                <option value="14:00">
                <option value="14:30">
                <option value="15:00">
                <option value="15:30">
                <option value="16:00">
                <option value="16:30">
                <option value="17:00">
            </datalist></br></br>

            Giờ kết thúc:
            <input type="text" list="timeEndL" name="timeEndL" required=""> 
            <datalist id ="timeEndL">
                <option value="OFF">
                <option value="7:00">
                <option value="7:30">
                <option value="8:00">
                <option value="8:30">
                <option value="9:00">
                <option value="9:30">
                <option value="10:00">
                <option value="10:30">
                <option value="13:00">
                <option value="13:30">
                <option value="14:00">
                <option value="14:30">
                <option value="15:00">
                <option value="15:30">
                <option value="16:00">
                <option value="16:30">
                <option value="17:00">
            </datalist></br></br>
            <input type="hidden" name="action" value="UpdateSlot"/>
            <button type="submit" ">
                Cập Nhật
            </button>
        </form>
        <%=mes%>
    </body>
</html>
