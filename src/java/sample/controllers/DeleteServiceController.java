/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import sample.services.ServiceDTO;
import sample.user.AdminDAO;


/**
 *
 * @author dangk
 */
@WebServlet(name = "DeleteServiceController", urlPatterns = {"/DeleteServiceController"})
public class DeleteServiceController extends HttpServlet {

    private static final String ERROR = "SearchServiceController";
    private static final String SUCCESS = "SearchServiceController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String url = ERROR;
        try {
            String serviceID = request.getParameter("serviceID");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            ServiceDTO service = new ServiceDTO(serviceID, status);
            AdminDAO dao = new AdminDAO();
            boolean check = dao.deleteService(service);
            
            long millis = System.currentTimeMillis();
            Date curDate = new java.sql.Date(millis);
            List<BookingDTO> list = dao.getListBKOFSV(serviceID, curDate);
             if (!list.isEmpty()) {
                    for (BookingDTO bk : list) {
                        boolean checkUP = dao.updateBKConflict_SV(bk.getBookingID());
                        if (checkUP) {
                            request.setAttribute("MESS_CF", "Có một số cuộc hẹn của khách hàng bị xung đột!");
                        }
                    }
                }
            
            
            if (check) {
                if(status == true){
                    request.setAttribute("MESS_UP_SV", "Mã dịch vụ "+ serviceID + " đã được hiện trên trang chủ");
                }else if(status == false){
                    request.setAttribute("MESS_UP_SV", "Mã dịch vụ "+ serviceID + " đã được ẩn khỏi trang chủ");
                }
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at deleteServiceController: " + e.toString());
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
