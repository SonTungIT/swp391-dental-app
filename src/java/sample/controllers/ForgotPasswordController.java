/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import sample.Email.EmailDTO;
import sample.Email.EmailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ResetPasswordController", urlPatterns = {"/ResetPasswordController"})
public class ForgotPasswordController extends HttpServlet {

   private static final String ERROR = "resetpassword.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String email = request.getParameter("email");
            UserDAO dao = new UserDAO();
            UserDTO user = dao.findByUserIdAndEmail(userID, email);
            HttpSession session = request.getSession();
            if (user != null) {
                EmailDTO _email = new EmailDTO();
                _email.setFrom("namptse150442@fpt.edu.vn");
                _email.setFromPassword("namlataone123");
                _email.setTo(email);
                _email.setSubject("Forgot Password Funtion");
                StringBuilder sb = new StringBuilder();
                sb.append("Gửi ").append(userID).append("<br>");
                sb.append("Bạn đã sử dụng chức năng quên mật khẩu. <br> ");
                sb.append("Mật khẩu của bạn là: <b>").append(user.getPassword()).append("</b><br>");
                sb.append("Thân! <br>");
                sb.append("Administrator.");

                _email.setContent(sb.toString());
                EmailDAO.send(_email);
                url = SUCCESS;
                session.setAttribute("ERROR2", "Mật khẩu đã được gửi về gmail của bạn ."
                        + "Xin kiểm tra gmail của bạn!");
            } else {
                session.setAttribute("ERROR", "Tài khoản hoặc Email không chính xác!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", e.getMessage());
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
