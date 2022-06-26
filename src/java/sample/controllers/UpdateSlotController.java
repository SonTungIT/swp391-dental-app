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

import sample.booking.ScheduleDTO;
import sample.booking.SlotDTO;
import sample.user.AdminDAO;
import sample.user.DoctorDTO;

/**
 *
 * @author Xqy
 */
@WebServlet(name = "UpdateSlotController", urlPatterns = {"/UpdateSlotController"})
public class UpdateSlotController extends HttpServlet {

    private static final String ERROR = "slot.jsp";
    private static final String SUCCESS = "slot.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String timeStart = request.getParameter("timeStart");
            String timeEnd = request.getParameter("timeEnd");
            String timeStartL = request.getParameter("timeStartL");
            String timeEndL = request.getParameter("timeEndL");
            if (timeStart.equals("OFF")) {
                timeStart = "0:00";
            }
            if (timeEnd.equals("OFF")) {
                timeEnd = "1:00";
            }
            if (timeStartL.equals("OFF")) {
                timeStartL = "0:00";
            }
            if (timeEndL.equals("OFF")) {
                timeEndL = "1:00";
            }
            List<String> listSlot = new ArrayList<String>();
            listSlot.add("07:00");
            listSlot.add("07:30");
            listSlot.add("08:00");
            listSlot.add("08:30");
            listSlot.add("09:00");
            listSlot.add("09:30");
            listSlot.add("10:00");
            listSlot.add("10:30");
            listSlot.add("13:00");
            listSlot.add("13:30");
            listSlot.add("14:00");
            listSlot.add("14:30");
            listSlot.add("15:00");
            listSlot.add("15:30");
            listSlot.add("16:00");
            listSlot.add("16:30");
            String startDate = "", endDate = "";
            //Cat chuoi de so sanh time tu thu 2 den thu 6
            String[] ts = timeStart.split(":");
            int ts1 = Integer.parseInt(ts[0]);
            int ts2 = Integer.parseInt(ts[1]);
            String[] te = timeEnd.split(":");
            int te1 = Integer.parseInt(te[0]);
            int te2 = Integer.parseInt(te[1]);

            //Cat chuoi de so sanh time t7 and CN
            String[] tsL = timeStartL.split(":");
            int tsL1 = Integer.parseInt(tsL[0]);
            int tsL2 = Integer.parseInt(tsL[1]);
            String[] teL = timeEndL.split(":");
            int teL1 = Integer.parseInt(teL[0]);
            int teL2 = Integer.parseInt(teL[1]);

            AdminDAO dao = new AdminDAO();
            boolean check = dao.updateSlot(startDate, endDate, "07:00");
            if ((ts1 <= te1 && ts2 <= te2) || (tsL1 <= teL1 && tsL2 <= teL2)) {
                for (String slot : listSlot) {
                    String[] s = slot.split(":");
                    int s1 = Integer.parseInt(s[0]);
                    int s2 = Integer.parseInt(s[1]);

                    //Xet các lịch vào t2 - t6
                    if ((ts1 < s1 || (ts1 == s1 && ts2 <= s2)) && (te1 > s1 || (te1 == s1 && te2 > s2))) {
                        startDate = "Monday";
                        endDate = "Friday";
                        //Slot co trong ca T7 va CN
                        if ((tsL1 < s1 || (tsL1 == s1 && (tsL2 <= s2))) && (teL1 > s1 || (teL1 == s1 && teL2 > s2))) {
                            endDate = "Sunday";
                            check = dao.updateSlot(startDate, endDate, slot);
                        }
                        check = dao.updateSlot(startDate, endDate, slot);
                    } else {
                        //Slot chi co o T7 va CN
                        if ((tsL1 < s1 || (tsL1 == s1 && (tsL2 <= s2))) && (teL1 > s1 || (teL1 == s1 && teL2 > s2))) {
                            startDate = "Saturday";
                            endDate = "Sunday";
                            check = dao.updateSlot(startDate, endDate, slot);
                        } else {//Nhung slot trong
                            startDate = "";
                            endDate = "";
                            check = dao.updateSlot(startDate, endDate, slot);
                        }
                    }
                }
            } else {
                request.setAttribute("ERROR", "Time start < Time end !!!");
            }
            //Check các booking bị mất do đổi lịch
            long millis = System.currentTimeMillis();
            Date curDate = new java.sql.Date(millis);
            DateofApp dateOFA = new DateofApp();
            List<BookingDTO> listBKF = dao.getListBookingFailByUDSlot(curDate);
            if (listBKF.size() > 0) {
                for (BookingDTO bk : listBKF) {
                    boolean checkSlot = dao.checkSL_FAIL_BY_UPSL(bk.getTimeBooking());
                    boolean checkBooking;
                    if (checkSlot) {
                        request.setAttribute("MESSAGE_SLOTUD", "Bạn đã cập nhật lịch thành công.");
                    } else {
                        checkBooking = dao.updateBooking_FailBy_UpdateSlot(bk.getBookingID());
                        if (checkBooking) {
                            request.setAttribute("MESSAGE_SLOTUD", "Bạn đã cập nhật lịch thành công. Một số lịch bị xung đột do bạn đổi lịch!");
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Error at UpdateSlotController: " + e.toString());
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
