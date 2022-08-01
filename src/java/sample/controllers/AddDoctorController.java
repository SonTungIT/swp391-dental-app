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
import sample.user.AdminDAO;
import sample.user.DoctorDTO;
import sample.user.UserError;

/**
 *
 * @author QUANG VAN
 */
@WebServlet(name = "AddDoctorController", urlPatterns = {"/AddDoctorController"})
public class AddDoctorController extends HttpServlet {

    public static final String ERROR = "addDoctor.jsp";
    public static final String SUCCESS = "MainController?action=Show";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String password = "1";
            String shift = request.getParameter("shift");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String gender = request.getParameter("gender");;
            String address = request.getParameter("address");
            String categoryID = request.getParameter("categoryID");
            String image = "macdinh.jpg";
            String phone = request.getParameter("phone");
            Date birthday = null;
            String email = request.getParameter("email");

            boolean status = true;
            AdminDAO dao = new AdminDAO();
            UserError PE = new UserError();

            boolean checkDuplicate = dao.checkDuplicate(userID);
            boolean checkValidation = true;
            if (checkDuplicate) {
                PE.setDuplicateError("Tài khoản " + userID + " không khả dụng !");
                checkValidation = false;
            }
            
            if (userID.length() < 5 || userID.length() > 50) {
                PE.setUserIDError("Tài khoản từ 5 đến 50 kí tự");
                checkValidation = false;
            }
            if (fullName.length() < 5 || fullName.length() > 50) {
                PE.setFullNameError("Họ và tên phải từ 5 đến 50 kí tự!");
                checkValidation = false;
            }
            if (address.length() < 5 || address.length() > 50) {
                PE.setAddressError("Địa chỉ phải từ 5 đến 50 kí tự!");
                checkValidation = false;
            }
            boolean checkMail = dao.checkDuplicateEmail(email);
            if (checkMail) {
                PE.setEmailError("Email không khả dụng!");
                checkValidation = false;
            }

            if (checkValidation) {
                
                DoctorDTO doctor = new DoctorDTO(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);

                boolean checkAddDoctor = dao.addDoctor(doctor);
                if (checkAddDoctor) {
                    DoctorDTO dt = new DoctorDTO(categoryID, "", shift);
                    boolean checkDR = dao.buildDR(doctor.getUserID(), dt);
                    if (checkDR) {

                        request.setAttribute("SUCCESS_INFO", "Created successfully !!!");
                        url = SUCCESS;

                    }
                }
            } else {
                request.setAttribute("USER_ERROR", PE);
            }

        } catch (Exception e) {
            log("Error at AddDoctorController: " + e.toString());
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
