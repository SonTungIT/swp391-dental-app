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
import sample.user.AdminDAO;

/**
 *
 * @author QUANG VAN
 */
@WebServlet(name = "ShowDashBoardController", urlPatterns = {"/ShowDashBoardController"})
public class ShowDashBoardController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "dashboard.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        AdminDAO dao = new AdminDAO();
        if (session.isNew()) {
            dao.updateNumberOfView();
        }
        try {
//            long millis = System.currentTimeMillis();
//            java.sql.Date date2 = new java.sql.Date(millis);
//            String DateString = String.valueOf(date2);
//            LocalDate dateLocal1 = LocalDate.parse(DateString);
//            LocalDate dateLocal2 = dateLocal1.minusDays(7);
//            java.sql.Date date1 = java.sql.Date.valueOf(dateLocal2);

//            int numberBookingInOneWeek = dao.totalOfBookingByStatusInOneWeek("1", date1, date2);
            int view = dao.getNumberOfView();
            int numberOfDoctor = dao.getNumberOfDoctor();
            int numberOfPatient = dao.getNumberOfPatient();
            int numberOfBooking = dao.getNumberOfBooking();
            request.setAttribute("view", view);
            request.setAttribute("doctor", numberOfDoctor);
            request.setAttribute("patient", numberOfPatient);
            request.setAttribute("booking", numberOfBooking);
//            request.setAttribute("numberBookingInOneWeek", numberBookingInOneWeek);

            url = SUCCESS;
        } catch (Exception e) {
            log("Error at ShowDashBoardController: " + e.toString());
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
