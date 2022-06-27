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
import sample.booking.ScheduleDTO;
import sample.user.AdminDAO;
import sample.user.DoctorDTO;

/**
 *
 * @author Xqy
 */
@WebServlet(name = "ShowScheduleController", urlPatterns = {"/ShowScheduleController"})
public class ShowScheduleController extends HttpServlet {

    private static final String ERROR = "manageSchedule_Slot.jsp";
    private static final String SUCCESS = "manageSchedule_Slot.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String searchSC = request.getParameter("searchSC");
            AdminDAO dao = new AdminDAO();
            List<DoctorDTO> listDRSC = dao.getListDoctorSC(searchSC);
            if (listDRSC.size() > 0) {
                request.setAttribute("LIST_DOCTOR_SC", listDRSC);
                List<ScheduleDTO> listSC = dao.showListAllSchedule();
                if (listSC.size() > 0) {
                    request.setAttribute("LIST_SC_ALL", listSC);
                    url = SUCCESS;
                }

            }
        } catch (Exception e) {
            log("Error at ShowScheduleController:" + e.toString());
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
