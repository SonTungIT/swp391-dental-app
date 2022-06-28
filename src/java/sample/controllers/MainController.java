/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Xqy
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String HOME = "Home";
    private static final String HOME_CONTROLLER = "HomeController";
    //Login and logout
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SHOW_DOCTOR = "Show";
    private static final String SHOW_DOCTOR_CONTROLLER = "ShowDoctorController";
    private static final String SEARCH_DOCTOR = "Search";
    private static final String SEARCH_DOCTOR_CONTROLLER = "SearchDoctorController";
    private static final String ADD_DOCTOR = "AddDoctor";
    private static final String ADD_DOCTOR_CONTROLLER = "AddDoctorController";
    private static final String DELETE_DOCTOR = "Delete";
    private static final String DELETE_DOCTOR_CONTROLLER = "DeleteDoctorController";

    private static final String SHOW_ALL_PATIENT = "ShowAllPatient";
    private static final String SHOW_ALL_PATIENT_CONTROLLER = "ShowPatientController";
    private static final String SEARCH_PATIENT = "Tìm kiếm";
    private static final String SEARCH_PATIENT_CONTROLLER = "SearchPatientController";
    private static final String DELETE_PATIENT = "Xóa";
    private static final String DELETE_PATIENT_CONTROLLER = "DeletePatientController";

    private static final String SHOW_BOOKING = "ShowBooking";
    private static final String SHOW_BOOKING_CONTROLLER = "ShowBookingController";
    private static final String DELETE_BOOKING = "Xóa lịch hẹn";
    private static final String DELETE_BOOKING_CONTROLLER = "DeleteBookingController";

    private static final String SEARCH_BOOKING = "Search Booking";
    private static final String SEARCH_BOOKING_CONTROLLER = "SearchBookingController";

    private static final String SHOWDASHBOARD = "ShowDashboard";
    private static final String SHOWDASHBOARD_CONTROLLER = "ShowDashBoardController";

    //Schedule
    private static final String SHOWSCHEDULE = "SearchSC";
    private static final String SHOWSCHEDULE_CONTROLLER = "ShowScheduleController";
    private static final String UPDATE_SCHEDULEDR = "CreateSC";
    private static final String UPDATE_SCHEDULEDR_CONTROLLER = "UpdateScheduleForDRController";
    private static final String DELETE_SCHEDULEDR = "DeleteSC";
    private static final String DELETE_SCHEDULEDR_CONTROLLER = "DeleteScheduleForDRController";
    //Slot
    private static final String UPDATESLOT = "UpdateSlot";
    private static final String UPDATESLOT_CONTROLLER = "UpdateSlotController";

    //Doctor
    private static final String SHOWDR_BYCT = "ShowDRByCT";
    private static final String SHOWDR_BYCT_CONTROLLER = "ShowDRByCTController";
    private static final String SHOWSLOT_DR = "ShowSlotDR";
    private static final String SHOWSLOT_DR_CONTROLLER = "ShowSlotDRController";
    //Service
    private static final String SHOWSERVICE = "ShowService";
    private static final String SHOWSERVICE_CONTROLLER = "ShowServiceController";
    //Patient
    private static final String CREATE_BK = "CreateBooking";
    private static final String CREATE_BK_CONTROLLER = "CreateBookController";
    private static final String VIEW_HISTORY_BK = "SearchHSBK";
    private static final String VIEW_HISTORY_BK_CONTROLLER = "ViewHistoryBKController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (HOME.equals(action)) {
                url = HOME_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (ADD_DOCTOR.equals(action)) {
                url = ADD_DOCTOR_CONTROLLER;
            } else if (SEARCH_DOCTOR.equals(action)) {
                url = SEARCH_DOCTOR_CONTROLLER;
            } else if (SHOW_DOCTOR.equals(action)) {
                url = SHOW_DOCTOR_CONTROLLER;
            } else if (DELETE_DOCTOR.equals(action)) {
                url = DELETE_DOCTOR_CONTROLLER;
            } else if (SHOW_ALL_PATIENT.equals(action)) {
                url = SHOW_ALL_PATIENT_CONTROLLER;
            } else if (SEARCH_PATIENT.equals(action)) {
                url = SEARCH_PATIENT_CONTROLLER;
            } else if (DELETE_PATIENT.equals(action)) {
                url = DELETE_PATIENT_CONTROLLER;
            } else if (SHOW_BOOKING.equals(action)) {
                url = SHOW_BOOKING_CONTROLLER;
            } else if (DELETE_BOOKING.equals(action)) {
                url = DELETE_BOOKING_CONTROLLER;
            } else if (SEARCH_BOOKING.equals(action)) {
                url = SEARCH_BOOKING_CONTROLLER;
            } else if (SHOWDASHBOARD.equals(action)) {
                url = SHOWDASHBOARD_CONTROLLER;
            } else if (UPDATESLOT.equals(action)) {
                url = UPDATESLOT_CONTROLLER;
            } else if (SHOWSERVICE.equals(action)) {
                url = SHOWSERVICE_CONTROLLER;
            } else if (SHOWDR_BYCT.equals(action)) {
                url = SHOWDR_BYCT_CONTROLLER;
            } else if (SHOWSLOT_DR.equals(action)) {
                url = SHOWSLOT_DR_CONTROLLER;
            } else if (CREATE_BK.equals(action)) {
                url = CREATE_BK_CONTROLLER;
            } else if (SHOWSCHEDULE.equals(action)) {
                url = SHOWSCHEDULE_CONTROLLER;
            } else if (UPDATE_SCHEDULEDR.equals(action)) {
                url = UPDATE_SCHEDULEDR_CONTROLLER;
            } else if (DELETE_SCHEDULEDR.equals(action)) {
                url = DELETE_SCHEDULEDR_CONTROLLER;
            } else if (VIEW_HISTORY_BK.equals(action)) {
                url = VIEW_HISTORY_BK_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
