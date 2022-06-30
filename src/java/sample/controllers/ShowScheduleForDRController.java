/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.booking.SlotDTO;
import sample.user.DoctorDAO;

/**
 *
 * @author Xqy
 */
@WebServlet(name = "ShowScheduleForDRController", urlPatterns = {"/ShowScheduleForDRController"})
public class ShowScheduleForDRController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String doctorID = request.getParameter("doctorID");
            DoctorDAO dao = new DoctorDAO();
            List<SlotDTO> list1 = dao.showListSlot(doctorID, "Monday");
            request.setAttribute("listSC_FDR_1", list1);
            List<SlotDTO> list2 = dao.showListSlot(doctorID, "Tuesday");
            request.setAttribute("listSC_FDR_2", list2);
            List<SlotDTO> list3 = dao.showListSlot(doctorID, "Wednesday");
            request.setAttribute("listSC_FDR_3", list3);
            List<SlotDTO> list4 = dao.showListSlot(doctorID, "Thursday");
            request.setAttribute("listSC_FDR_4", list4);
            List<SlotDTO> list5 = dao.showListSlot(doctorID, "Friday");
            request.setAttribute("listSC_FDR_5", list5);
            List<SlotDTO> list6 = dao.showListSlot(doctorID, "Saturday");
            request.setAttribute("listSC_FDR_6", list6);
            List<SlotDTO> list7 = dao.showListSlot(doctorID, "Sunday");
            request.setAttribute("listSC_FDR_7", list7);
            request.getRequestDispatcher("scheduleOFDR.jsp").forward(request, response);
        } catch (Exception ex) {
            log("Error at ShowScheduleForDRController: " + ex.toString());
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
