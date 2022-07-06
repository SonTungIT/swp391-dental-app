/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.DoctorDAO;

/**
 *
 * @author Xqy
 */
@WebServlet(name = "UpdateBKByDRController", urlPatterns = {"/UpdateBKByDRController"})
public class UpdateBKByDRController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String doctorID = request.getParameter("doctorID");
            String bookingID = request.getParameter("bookingID");
            String action = request.getParameter("action");
            DoctorDAO dao = new DoctorDAO();
            if (action.equals("Finish")) {
                dao.updateBK(bookingID, "Finished");
                request.getRequestDispatcher("ManagePTBK_DRController?doctorID="+doctorID).forward(request, response);
            } else {
                dao.updateBK(bookingID, "Inactive");
                request.getRequestDispatcher("ManagePTBK_DRController?doctorID="+doctorID).forward(request, response);
            }
        } catch (Exception ex) {
            log("Error at UpdateBKByDRController: " + ex.toString());
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
