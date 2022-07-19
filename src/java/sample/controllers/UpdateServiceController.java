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
@WebServlet(name = "UpdateServiceController", urlPatterns = {"/UpdateServiceController"})
public class UpdateServiceController extends HttpServlet {
    
    private static final String ERROR = "SearchServiceController";
    private static final String SUCCESS = "MainController?search=&action=Search_Service";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String serviceID = request.getParameter("serviceID");
            String serviceName = request.getParameter("serviceName");
            String image = request.getParameter("image");
            String categoryID = request.getParameter("categoryID");
            int price = Integer.parseInt(request.getParameter("price"));
            String aboutSV = request.getParameter("aboutSV");
            ServiceDTO service = new ServiceDTO(serviceID, serviceName, image, categoryID, price, aboutSV);    
            AdminDAO dao = new AdminDAO();
            
            ServiceDTO oldNameCate = dao.getOldNameCate_SV(serviceID);
            if (oldNameCate != null) {
                String oldName = oldNameCate.getServiceName();
                String oldCate = oldNameCate.getCategoryID();
                if (oldName != serviceName || oldCate != categoryID) {
                    
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
                }

            }
            
            boolean checkUpdate = dao.updateService(service);
            if (checkUpdate) {

                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at UpdateServiceController: " + e.toString());
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
