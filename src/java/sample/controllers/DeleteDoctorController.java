/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.booking.BookingDTO;
import sample.user.AdminDAO;

/**
 *
 * @author QUANG VAN
 */
@WebServlet(name = "DeleteDoctorController", urlPatterns = {"/DeleteDoctorController"})
public class DeleteDoctorController extends HttpServlet {

    private static final String ERROR = "manageDoctor.jsp";
    private static final String SUCCESS = "ShowDoctorController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String doctorID = request.getParameter("doctorID");

            AdminDAO dao = new AdminDAO();
            long millis = System.currentTimeMillis();
            Date curDate = new java.sql.Date(millis);
            List<BookingDTO> list = dao.getListBKOFDR(doctorID, curDate);
            boolean checkC = dao.clearSchedule(doctorID);
            if (checkC) {
                request.setAttribute("MESS_C", "Lịch làm việc của bác sĩ đã xoá xin thêm lại!");
            }
            if (!list.isEmpty()) {
                for (BookingDTO bk : list) {
                    boolean check = dao.updateBKConflic_BY_DLSC(bk.getBookingID());
                    if (check) {
                        request.setAttribute("MESS_CF", "Có một số cuộc hẹn của khách hàng bị xung đột!");
                    }
                }
            }
            boolean check = dao.deteleDoctor(doctorID);
            if (check) {
                request.setAttribute("MESS", "Xoá thành công!");
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at DeleteDoctorController:" + e.toString());
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
