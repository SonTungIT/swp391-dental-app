<%-- 
    Document   : changePasswordDoctor
    Created on : Jul 30, 2022, 9:24:05 AM
    Author     : PC
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="card-body">
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <div class="col-lg-8 col-xlg-9 col-md-7">
            <div class="card">
                <div class="card-body">
                    <form action="MainController"  class="form-horizontal form-material mx-2">
                        <div>
                            <input type="hidden" name="doctorID" value="${ID}">
                        </div>
                        <input class="form-control ps-0 form-control-line" type="hidden" name="oldPassword" value="${PROFILE_DR.password}">
                        <div class="form-group">
                            <label class="col-md-12 mb-0">Nhập mật khẩu cũ:</label>
                            <div class="col-md-12">
                                <td>  
                                    <input class="form-control ps-0 form-control-line" type="password" name="oldPassword1" value="">
                                </td> 
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-12 mb-0">Mật khẩu mới:</label>
                            <div class="col-md-12">
                                <td>  
                                    <input class="form-control ps-0 form-control-line" type="password" name="newPassword" value="">
                                </td> 
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-12 mb-0">Xác nhận mật khẩu mởi:</label>
                            <div class="col-md-12">
                                <td>  
                                    <input class="form-control ps-0 form-control-line" type="password" name="newPassword1" value="">
                                </td> 
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 d-flex">
                                <button class="btn btn-success mx-auto mx-md-0 text-white" type="submit" name="action" value="Update_Password_Doctor">Cập Nhật</button>
                            </div>
                        </div>
                    </form>
                        <a href="doctor.jsp"a/>
                    <p>${MESSAGE}</p>
                </div>
            </div>
        </div>
        <!-- Column -->
    </div>       
</html>