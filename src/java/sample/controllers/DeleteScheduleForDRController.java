/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.booking.BookingDTO;
import sample.booking.DateofApp;
import sample.user.AdminDAO;

/**
 *
 * @author Xqy
 */
@WebServlet(name = "DeleteScheduleForDRController", urlPatterns = {"/DeleteScheduleForDRController"})
public class DeleteScheduleForDRController extends HttpServlet {

    private static final String ERROR = "MainController?action=SearchSC&searchSC";
    private static final String SUCCESS = "MainController?action=SearchSC&searchSC";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String doctorID = request.getParameter("doctorID");

            //Lay cac thứ được chọn
            String day1 = request.getParameter("day1");
            String day2 = request.getParameter("day2");
            String day3 = request.getParameter("day3");
            String day4 = request.getParameter("day4");
            String day5 = request.getParameter("day5");
            String day6 = request.getParameter("day6");
            String day7 = request.getParameter("day7");
            List<String> listDOW = new ArrayList<>();
            listDOW.add(day1);
            listDOW.add(day2);
            listDOW.add(day3);
            listDOW.add(day4);
            listDOW.add(day5);
            listDOW.add(day6);
            listDOW.add(day7);
            AdminDAO dao = new AdminDAO();
            int count = 0;
            if (listDOW.size() > 0) {
                for (String day : listDOW) {
                    if (day != null) {
                        long millis = System.currentTimeMillis();
                        Date curDate = new java.sql.Date(millis);
                        List<BookingDTO> listBK = dao.getListBKOFDR(doctorID, curDate);
                        DateofApp dow = new DateofApp();
                        for (BookingDTO bk : listBK) {
                            String dayBK = dow.DayofWeek(bk.getDateBooking().toString());
                            if (dayBK.equals(day)) {
                                boolean checkup = dao.updateBKConflic_BY_DLSC(bk.getBookingID());
                                if (checkup) {
                                    request.setAttribute("MESS_UD", "Có một số lịch hẹn đã bị xung đột do đổi lịch!");
                                }
                            }
                        }
                        boolean check = dao.updateScheduleDR(doctorID, day, false);
                        if (check) {
                            count++;
                        }
                    }
                }
            }
            if (count != 0) {
                request.setAttribute("MESS", "Cập nhật thành công!");
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at DeleteScheduleForDRController: " + e.toString());
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
