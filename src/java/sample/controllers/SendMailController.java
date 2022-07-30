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

    private static final String ERROR = "showbooking.jsp";
    private static final String SUCCESS = "showbooking.jsp";

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
                sb.append("Dear ").append(userID).append("<br>");
                sb.append("The appointment you have booked is wrong or someone has booked the same time as you. <br> ");
                sb.append("Please click on this link to rebook: booking.jsp" );
                sb.append("Regards <br>");
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
