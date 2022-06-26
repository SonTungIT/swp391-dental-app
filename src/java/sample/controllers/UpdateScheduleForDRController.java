/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.booking.ScheduleDTO;
import sample.booking.SlotDTO;
import sample.user.AdminDAO;
import sample.user.DoctorDTO;

/**
 *
 * @author Xqy
 */
@WebServlet(name = "UpdateScheduleForDRController", urlPatterns = {"/UpdateScheduleForDRController"})
public class UpdateScheduleForDRController extends HttpServlet {

    private static final String ERROR = "MainController?action=SearchSC&searchSC";
    private static final String SUCCESS = "MainController?action=SearchSC&searchSC";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String doctorID = request.getParameter("doctorID");
            String shift = request.getParameter("shift");

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
            if (listDOW.size() > 0) {
                for (String day : listDOW) {
                    if (day != null) {
                        if (!day.equals("Saturday") && !day.equals("Sunday")) {
                            List<SlotDTO> listSlotC = dao.showListSlot("Monday", "Friday");
                            //Create Schedule
                            if (listSlotC.size() > 0) {
                                for (SlotDTO slot : listSlotC) {
                                    //So sánh với shift của Doctor nếu slot Name <= 8 thì shift là Morning, >8 là Afternoon 
                                    String slotID = slot.getSlotID();
                                    String slotName = slot.getSlotName();
                                    String[] st = slotName.split(" ");
                                    int st1 = Integer.parseInt(st[1]);
                                    String scheduleID = "";
                                    if (dao.checkDuplicate_SCD_DR_DW_SL(doctorID, slotID, day)) {
                                        dao.updateScheduleDR(doctorID, day, true);
                                    } else {
                                        if (shift.equals("Full time")) {
                                            int count = 1;
                                            if (count < 10) {
                                                scheduleID = "SCD0" + count;
                                            } else {
                                                scheduleID = "SCD" + count;
                                            }
                                            while (dao.checkDuplicate_SCD_ID(scheduleID)) {
                                                count++;
                                                if (count < 10) {
                                                    scheduleID = "SCD0" + count;
                                                } else {
                                                    scheduleID = "SCD" + count;
                                                }
                                            }
                                            ScheduleDTO sc = new ScheduleDTO(scheduleID, doctorID, slotID, day, true);
                                            dao.createSchedule(sc);
                                        } else if (shift.equals("Morning") && st1 <= 8) {
                                            int count = 1;
                                            if (count < 10) {
                                                scheduleID = "SCD0" + count;
                                            } else {
                                                scheduleID = "SCD" + count;
                                            }
                                            while (dao.checkDuplicate_SCD_ID(scheduleID)) {
                                                count++;
                                                if (count < 10) {
                                                    scheduleID = "SCD0" + count;
                                                } else {
                                                    scheduleID = "SCD" + count;
                                                }
                                            }
                                            ScheduleDTO sc = new ScheduleDTO(scheduleID, doctorID, slotID, day, true);
                                            dao.createSchedule(sc);
                                        } else if (shift.equals("Afternoon") && st1 > 8) {
                                            int count = 1;
                                            if (count < 10) {
                                                scheduleID = "SCD0" + count;
                                            } else {
                                                scheduleID = "SCD" + count;
                                            }
                                            while (dao.checkDuplicate_SCD_ID(scheduleID)) {
                                                count++;
                                                if (count < 10) {
                                                    scheduleID = "SCD0" + count;
                                                } else {
                                                    scheduleID = "SCD" + count;
                                                }
                                            }
                                            ScheduleDTO sc = new ScheduleDTO(scheduleID, doctorID, slotID, day, true);
                                            dao.createSchedule(sc);
                                        }
                                    }
                                }
                            }
                        } else if (day.equals("Saturday") || day.equals("Sunday")) {
                            List<SlotDTO> listSlotC = dao.showListSlot("Saturday", "Sunday");
                            //Create Schedule
                            if (listSlotC.size() > 0) {
                                for (SlotDTO slot : listSlotC) {
                                    //So sánh với shift của Doctor nếu slot Name <= 8 thì shift là Morning, >8 là Afternoon 
                                    String slotID = slot.getSlotID();
                                    String slotName = slot.getSlotName();
                                    String[] st = slotName.split(" ");
                                    int st1 = Integer.parseInt(st[1]);
                                    String scheduleID = "";
                                    if (dao.checkDuplicate_SCD_DR_DW_SL(doctorID, slotID, day)) {
                                        dao.updateScheduleDR(doctorID, day, true);
                                    } else {
                                        if (shift.equals("Full time")) {
                                            int count = 1;
                                            if (count < 10) {
                                                scheduleID = "SCD0" + count;
                                            } else {
                                                scheduleID = "SCD" + count;
                                            }
                                            while (dao.checkDuplicate_SCD_ID(scheduleID)) {
                                                count++;
                                                if (count < 10) {
                                                    scheduleID = "SCD0" + count;
                                                } else {
                                                    scheduleID = "SCD" + count;
                                                }
                                            }
                                            ScheduleDTO sc = new ScheduleDTO(scheduleID, doctorID, slotID, day, true);
                                            dao.createSchedule(sc);
                                        } else if (shift.equals("Morning") && st1 <= 8) {
                                            int count = 1;
                                            if (count < 10) {
                                                scheduleID = "SCD0" + count;
                                            } else {
                                                scheduleID = "SCD" + count;
                                            }
                                            while (dao.checkDuplicate_SCD_ID(scheduleID)) {
                                                count++;
                                                if (count < 10) {
                                                    scheduleID = "SCD0" + count;
                                                } else {
                                                    scheduleID = "SCD" + count;
                                                }
                                            }
                                            ScheduleDTO sc = new ScheduleDTO(scheduleID, doctorID, slotID, day, true);
                                            dao.createSchedule(sc);
                                        } else if (shift.equals("Afternoon") && st1 > 8) {
                                            int count = 1;
                                            if (count < 10) {
                                                scheduleID = "SCD0" + count;
                                            } else {
                                                scheduleID = "SCD" + count;
                                            }
                                            while (dao.checkDuplicate_SCD_ID(scheduleID)) {
                                                count++;
                                                if (count < 10) {
                                                    scheduleID = "SCD0" + count;
                                                } else {
                                                    scheduleID = "SCD" + count;
                                                }
                                            }
                                            ScheduleDTO sc = new ScheduleDTO(scheduleID, doctorID, slotID, day, true);
                                            dao.createSchedule(sc);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

        } catch (Exception e) {
            log("Error at UpdateScheduleForDRController: " + e.toString());
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
