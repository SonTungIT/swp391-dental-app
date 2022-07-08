/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.booking.BookingDTO;

import sample.user.PatientDAO;

/**
 *
 * @author Xqy
 */
@WebServlet(name = "CreateBookController", urlPatterns = {"/CreateBookController"})
public class CreateBookController extends HttpServlet {

    private static final String ERROR = "MainController?action=ShowService";
    private static final String SUCCESS = "MainController?action=ShowService";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String doctorID = request.getParameter("doctorID");
            String slotTime = request.getParameter("slotTime");
            String serviceName = request.getParameter("serviceName");
            Date dateBooking = Date.valueOf(request.getParameter("dateBooking"));
            String patientID = request.getParameter("patientID");
            String status = "Active";
            //Lay serviceID ra
            PatientDAO dao = new PatientDAO();
            String serviceID = dao.select_ServiceID(serviceName);
            //So sanh gio book neu hom nay booking
            long millis = System.currentTimeMillis();
            Date curDate = new java.sql.Date(millis);
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String date1 = formatter.format(curDate);
            String date2 = formatter.format(dateBooking);

            String nowTime = (new SimpleDateFormat("HH:mm").format(Calendar.getInstance().getTime()));
            String[] nt = nowTime.split(":");
            int nt1 = Integer.parseInt(nt[0]);
            String[] st = slotTime.split(":");
            int st1 = Integer.parseInt(st[0]);

            if (dateBooking.after(curDate) || (date2.equals(date1) && (nt1 < st1))) {
                //Tao bookingID
                int count = 1;
                String bookingID = "";
                if (count < 10) {
                    bookingID = "BK0" + count;
                } else {
                    bookingID = "BK" + count;
                }
                while (dao.checkDuplicate_BK_ID(bookingID)) {
                    count++;
                    if (count < 10) {
                        bookingID = "BK0" + count;
                    } else {
                        bookingID = "BK" + count;
                    }
                }

                BookingDTO bk = new BookingDTO(bookingID, patientID, serviceID, doctorID, dateBooking, slotTime, status);
                boolean check = dao.createBooking(bk);

                if (check) {
                    request.setAttribute("MESSAGE_CRBK", "Bạn đã đặt lịch thành công!");
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("ERROR_TIME", "Giờ hẹn ít nhất trước 30 phút so với giờ bạn muốn đặt!!");
            }

        } catch (Exception e) {
            log("Error at CreateBookController" + e.toString());
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
