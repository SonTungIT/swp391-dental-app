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
    private static final String SEND_MAIL = "Send";
    private static final String SEND_MAIL_CONTROLLER ="SendMailController";
    //Login and logout
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "CreateController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String FORGOT_PASSWORD = "Retrieve";
    private static final String FORGOT_PASSWORD_CONTROLLER ="ResetPasswordController";
    private static final String SHOW_DOCTOR = "Show";
    private static final String SHOW_DOCTOR_CONTROLLER = "ShowDoctorController";
    private static final String UPDATE_PASSWORD_PATIENT = "Update_Password";
    private static final String UPDATE_PASSWORD_PATIENT_CONTROLLER ="UpdatePatientPasswordControler";
    private static final String UPDATE_PASSWORD_DOCTOR = "Update_Password_Doctor";
    private static final String UPDATE_PASSWORD_DOCTOR_CONTROLLER ="UpdatePasswordDoctorController";
    private static final String SEARCH_DOCTOR = "Search";
    private static final String SEARCH_DOCTOR_CONTROLLER = "SearchDoctorController";
    private static final String ADD_DOCTOR = "Add";
    private static final String ADD_DOCTOR_CONTROLLER = "AddDoctorController";
    private static final String SHOWTRUE_DOCTOR = "Update_DR";
    private static final String SHOWTRUE_DOCTOR_CONTROLLER = "UpdateTDoctorController";
    private static final String DELETE_DOCTOR = "Delete_DR";
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
    private static final String CANCEL_BK = "CancelBK";
    private static final String CANCEL_BK_CONTROLLER = "CancelBKController";

    private static final String CREATE_FEEDBACK = "Create_Feedback";
    private static final String CREATE_FEEDBACK_CONTROLLER = "CreatefeedbackController";
    private static final String SHOW_BOOKING_DETAIL = "ShowBookingDetail";
    private static final String SHOW_BOOKING_DETAIL_CONTROLLER = "ShowBookingDetailController";
    private static final String FEEDBACK_ACTIVE = "active";
    private static final String FEEDBACK_ACTIVE_CONTROLLER = "FeedbackActiveController";
    private static final String SHOW_FEEDBACK = "Search_Feedback";
    private static final String SHOW_FEEDBACK_CONTROLLER = "ShowfeedbackController";
    private static final String UPDATE_FEEDBACK = "Update_Feedback";
    private static final String UPDATE_FEEDBACK_CONTROLLER = "UpdatefeedbackController";
    private static final String DELETE_FEEDBACK = "Delete_Feedback";
    private static final String DELETE_FEEDBACK_CONTROLLER = "DeleteFeedbackController";

    private static final String SEARCH_CATEGORY = "Search_Category";
    private static final String SEARCH_CATEGORY_CONTROLLER = "SearchCategoryServicesController";
    private static final String DELETE_CATEGORY = "DeleteCategory";
    private static final String DELETE_CATEGORY_CONTROLLER = "DeleteCategoryServicesController";
    private static final String UPDATE_CATEGORY = "Update_Category";
    private static final String UPDATE_CATEGORY_CONTROLLER = "UpdateCategoryServicesController";
    private static final String CREATE_CATEGORY = "Create_Category";
    private static final String CREATE_CATEGORY_CONTROLLER = "CreateCategoryServicesController";

    private static final String SEARCH_SERVICE = "Search_Service";
    private static final String SEARCH_SERVICE_CONTROLLER = "SearchServiceController";
    private static final String UPDATE_SERVICE = "Update_Service";
    private static final String UPDATE_SERVICE_CONTROLLER = "UpdateServiceController";
    private static final String DELETE_SERVICE = "DeleteService";
    private static final String DELETE_SERVICE_CONTROLLER = "DeleteServiceController";
    private static final String CREATE_SERVICE = "Create_Service";
    private static final String CREATE_SERVICE_CONTROLLER = "CreateServiceController";
    private static final String SHOW_SERVICE_DETAIL = "SUService";
    private static final String SHOW_SERVICE_DETAIL_CONTROLLER = "DetailServiceController";
    private static final String ACTIVE_SERVICE = "ActiveService";
    private static final String ACTIVE_SERVICE_CONTROLLER = "ActiveServiceController";

    private static final String SEARCH_PRICE_SERVICE = "Search_Price";
    private static final String SEARCH_PRICE_SERVICE_CONTROLLER = "SearchPriceServiceController";
    private static final String UPDATE_PRICE_SERVICE = "Update_Price";
    private static final String UPDATE_PRICE_SERVICE_CONTROLLER = "UpdatePriceServiceController";

    private static final String SHOW_ABOUT_SERVICE = "Show_About";
    private static final String SHOW_ABOUT_SERVICE_CONTROLLER = "ShowAboutServiceController";

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
            } else if (REGISTER.equals(action)) {
                url = REGISTER_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
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
            } else if (SEND_MAIL.equals(action)) {
                url = SEND_MAIL_CONTROLLER;
            } else if (SHOWSCHEDULE.equals(action)) {
                url = SHOWSCHEDULE_CONTROLLER;
            } else if (UPDATE_SCHEDULEDR.equals(action)) {
                url = UPDATE_SCHEDULEDR_CONTROLLER;
            } else if (DELETE_SCHEDULEDR.equals(action)) {
                url = DELETE_SCHEDULEDR_CONTROLLER;
            } else if (VIEW_HISTORY_BK.equals(action)) {
                url = VIEW_HISTORY_BK_CONTROLLER;
            } else if (CANCEL_BK.equals(action)) {
                url = CANCEL_BK_CONTROLLER;
            } else if (CREATE_FEEDBACK.equals(action)) {
                url = CREATE_FEEDBACK_CONTROLLER;
            } else if (SHOW_BOOKING_DETAIL.equals(action)) {
                url = SHOW_BOOKING_DETAIL_CONTROLLER;
            } else if (FEEDBACK_ACTIVE.equals(action)) {
                url = FEEDBACK_ACTIVE_CONTROLLER;
            } else if (SHOW_FEEDBACK.equals(action)) {
                url = SHOW_FEEDBACK_CONTROLLER;
            } else if (UPDATE_FEEDBACK.equals(action)) {
                url = UPDATE_FEEDBACK_CONTROLLER;
            } else if (SEARCH_CATEGORY.equals(action)) {
                url = SEARCH_CATEGORY_CONTROLLER;
            } else if (DELETE_CATEGORY.equals(action)) {
                url = DELETE_CATEGORY_CONTROLLER;
            } else if (UPDATE_CATEGORY.equals(action)) {
                url = UPDATE_CATEGORY_CONTROLLER;
            } else if (CREATE_CATEGORY.equals(action)) {
                url = CREATE_CATEGORY_CONTROLLER;
            } else if (SEARCH_SERVICE.equals(action)) {
                url = SEARCH_SERVICE_CONTROLLER;
            } else if (DELETE_SERVICE.equals(action)) {
                url = DELETE_SERVICE_CONTROLLER;
            } else if (UPDATE_SERVICE.equals(action)) {
                url = UPDATE_SERVICE_CONTROLLER;
            } else if (CREATE_SERVICE.equals(action)) {
                url = CREATE_SERVICE_CONTROLLER;
            } else if (SEARCH_PRICE_SERVICE.equals(action)) {
                url = SEARCH_PRICE_SERVICE_CONTROLLER;
            } else if (UPDATE_PRICE_SERVICE.equals(action)) {
                url = UPDATE_PRICE_SERVICE_CONTROLLER;
            } else if (FORGOT_PASSWORD.equals(action)) {
                url = FORGOT_PASSWORD_CONTROLLER;
            } else if (SHOW_ABOUT_SERVICE.equals(action)) {
                url = SHOW_ABOUT_SERVICE_CONTROLLER;
            } else if (SHOW_SERVICE_DETAIL.equals(action)) {
                url = SHOW_SERVICE_DETAIL_CONTROLLER;
            } else if (ADD_DOCTOR.equals(action)) {
                url = ADD_DOCTOR_CONTROLLER;
            }else if (SHOWTRUE_DOCTOR.equals(action)) {
                url = SHOWTRUE_DOCTOR_CONTROLLER;
            }else if (ACTIVE_SERVICE.equals(action)) {
                url = ACTIVE_SERVICE_CONTROLLER;
            }else if (DELETE_FEEDBACK.equals(action)) {
                url = DELETE_FEEDBACK_CONTROLLER;
            }else if (UPDATE_PASSWORD_PATIENT.equals(action)) {
                url = UPDATE_PASSWORD_PATIENT_CONTROLLER;
            } else if (UPDATE_PASSWORD_DOCTOR.equals(action)) {
                url = UPDATE_PASSWORD_DOCTOR_CONTROLLER;
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
