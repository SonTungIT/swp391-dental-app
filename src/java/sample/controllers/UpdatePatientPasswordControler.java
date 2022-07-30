/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.PatientDAO;
import sample.user.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdatePatientPasswordControler", urlPatterns = {"/UpdatePatientPasswordControler"})
public class UpdatePatientPasswordControler extends HttpServlet {

    private static final String ERROR = "changePasswordPatient.jsp";
    private static final String SUCCESS = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String patientID = request.getParameter("patientID");
            String userID = request.getParameter("userID");
            String oldpassword = request.getParameter("oldPassword");
            String oldpassword1 = request.getParameter("oldPassword1");
            String newPassword = request.getParameter("newPassword");
            String newPassword1 = request.getParameter("newPassword1");
            PatientDAO dao = new PatientDAO();
            UserDTO us = dao.getProfile(patientID);
            session.setAttribute("PROFILE_PT", us);
            session.setAttribute("ID", patientID);

            if (oldpassword1.equalsIgnoreCase(oldpassword)) {
                if (newPassword.equalsIgnoreCase(newPassword1)) {
                    dao.updatePassword(patientID, newPassword);
                    request.setAttribute("MESSAGE", "Thay đổi mật khẩu thành công, Trở về trang cá nhân");
                    url = ERROR;
                } else {
                    request.setAttribute("MESSAGE", "Không trùng với mật khẩu mới");
                    url = ERROR;
                }
            } else {
                request.setAttribute("MESSAGE", "Mật khẩu cũ không khớp");
                url = ERROR;
            }

        } catch (Exception e) {
            log("Error at UpdatePriceServiceController: " + e.toString());
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
