/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
import sample.user.DoctorDTO;

/**
 *
 * @author Xqy
 */
@WebServlet(name = "UpdateDoctorByADController", urlPatterns = {"/UpdateDoctorByADController"})
public class UpdateDoctorByADController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String doctorID = request.getParameter("doctorID");
            String categoryID = request.getParameter("categoryID");
            String shift = request.getParameter("shift");
            String aboutDR = request.getParameter("aboutDR");

            AdminDAO dao = new AdminDAO();
            DoctorDTO dt = dao.getPFDR_UD(doctorID);
            if (!dt.getCategoryID().equals(categoryID) || !dt.getShift().equals(shift)) {
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

            }
            dt = new DoctorDTO(categoryID, aboutDR, shift);
            boolean checkU = dao.updateDR_ShiftCTAB(dt, doctorID);
            if (checkU) {
                request.setAttribute("MESS", "Cập nhật thành công!");
            } else {
                request.setAttribute("MESS", "Cập nhật không thành công!");
            }
            request.getRequestDispatcher("ViewProfile_DRByADController?doctorID=" + doctorID).forward(request, response);
        } catch (Exception ex) {
            log("Error at UpdateDoctorByADController: " + ex.toString());
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
