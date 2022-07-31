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
import sample.Email.EmailDAO;
import sample.Email.EmailDTO;
import sample.user.AdminDAO;
import sample.user.UserDTO;

/**
 *
 * @author PC
 */
@WebServlet(name = "SendMailController", urlPatterns = {"/SendMailController"})
public class SendMailController extends HttpServlet {

    private static final String ERROR = "showBooking.jsp";
    private static final String SUCCESS = "showBooking.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String email = request.getParameter("email");
            AdminDAO dao = new AdminDAO();
            UserDTO user = dao.findByUserIdAndEmail(userID, email);
            HttpSession session = request.getSession();
            if (user != null) {
                EmailDTO _email = new EmailDTO();
                _email.setFrom("namptse150442@fpt.edu.vn");
                _email.setFromPassword("namlataone123");
                _email.setTo(email);
                _email.setSubject("Delay Funtion");
                StringBuilder sb = new StringBuilder();
                sb.append("Gửi ").append(userID).append("<br>");
                sb.append("Cuộc hẹn bạn đã đặt bị sai hoặc ai đó đã đặt cùng thời gian với bạn. <br> ");
                sb.append("Vui lòng quay lại trang \"booking.jsp\" để liên hệ đặt lại lịch dịch vụ của bạn " );
                sb.append("Chúng tôi chân thành xin lỗi vì sự bất tiện <br>");
                sb.append("Administrator.");

                _email.setContent(sb.toString());
                EmailDAO.send(_email);
                url = SUCCESS;
                session.setAttribute("ERROR", "Email send to the email Address."
                        + "Please check and get your password!");
            } else {
                session.setAttribute("ERROR", "UserName or Email are incorrect!");
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
