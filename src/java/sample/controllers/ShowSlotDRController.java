/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.booking.DateofApp;
import sample.booking.ScheduleDTO;
import sample.booking.SlotDTO;
import sample.user.PatientDAO;

/**
 *
 * @author Xqy
 */
@WebServlet(name = "ShowSlotDRController", urlPatterns = {"/ShowSlotDRController"})
public class ShowSlotDRController extends HttpServlet {

    private static final String ERROR = "MainController?action=ShowService&sName&action=ShowDRByCT&drID&dateBooking&action=ShowSlotDR";
    private static final String SUCCESS = "MainController?action=ShowService&sName&action=ShowDRByCT&drID&dateBooking&action=ShowSlotDR";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {           
            String doctorID = request.getParameter("doctorID");
            Date bookingDate = Date.valueOf(request.getParameter("bookingDate"));
            long millis = System.currentTimeMillis();
            Date curDate = new java.sql.Date(millis);

            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String date1 = formatter.format(curDate);
            String date2 = formatter.format(bookingDate);
            PatientDAO dao = new PatientDAO();
            String doctorName = dao.select_doctorName(doctorID);
            request.setAttribute("doctorName", doctorName);

            if (bookingDate.after(curDate) || date1.equals(date2)) {
                DateofApp dateOA = new DateofApp();
                String dateOW = dateOA.DayofWeek(bookingDate.toString());
                List<ScheduleDTO> listFT = dao.showListSC_FT(doctorID, dateOW);
                List<SlotDTO> listSlot_FT = new ArrayList<>();
                if (listFT.size() > 0) {
                    for (ScheduleDTO schedule : listFT) {
                        if (!dao.checkDuplicate_BK_SLOT(schedule.getSlotID(), bookingDate)) {
                            SlotDTO slot = dao.checkSlot(schedule.getSlotID());
                            listSlot_FT.add(slot);
                            request.setAttribute("LIST_SLOT_FT", listSlot_FT);
                        }
                    }
                    url = SUCCESS;
                } else {
                    request.setAttribute("NOSLOT", "Bác sĩ không có lịch vào ngày này. Xin quý khách vui lòng chọn ngày khác!!!");
                }
            } else {
                request.setAttribute("ERROR", "Date of booking must be greater than or equal to current date!");
            }
        } catch (Exception e) {
            log("Error at ShowSlotDRController:" + e.toString());
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
