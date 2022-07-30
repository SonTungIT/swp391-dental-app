/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("lamdcj");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String gender = "";
            String address = "";
            String image = "macdinh.jpg";
            Date birthday = null;
            String email = request.getParameter("email");
            String phone = "";
            String re_pass = request.getParameter("re_pass");

            boolean status = true;
            UserDAO dao = new UserDAO();
            UserError PE = new UserError();

            boolean checkDuplicate = dao.checkDuplicate(userID);
            boolean checkValidation = true;
            boolean checkMail = dao.checkDuplicateEmail(email);

            if (checkDuplicate) {
                PE.setDuplicateError("Tên đăng nhập " + userID + " không khả dụng");
                checkValidation = false;
            }
            if (userID.length() < 2 || userID.length() > 50) {
                PE.setUserIDError("Tên đăng nhập phải từ 2 đến 50 kí tự");
                checkValidation = false;
            }
            if (fullName.length() < 2 || fullName.length() > 50) {
                PE.setFullNameError("Tên phải từ 2 đến 50 kí tự");
                checkValidation = false;
            }
            if (checkMail) {
                PE.setEmailError("Email " + email + " không khả dụng");
                checkValidation = false;
            }
            if (!password.equals(re_pass)) {
                PE.setPasswordError("Mật khẩu không khớp nhau");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
                boolean checkCreate = dao.create(user);
                if (checkCreate) {
                    request.setAttribute("MESSAGE", "Đăng ký thành công !!!");
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", PE);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
