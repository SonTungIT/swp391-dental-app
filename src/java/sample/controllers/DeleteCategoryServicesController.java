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
import sample.services.CategoryServiceDTO;
import sample.user.AdminDAO;
import sample.user.DoctorDTO;


/**
 *
 * @author dangk
 */
@WebServlet(name = "DeleteCategoryServicesController", urlPatterns = {"/DeleteCategoryServicesController"})
public class DeleteCategoryServicesController extends HttpServlet {

    private static final String ERROR = "SearchCategoryServicesController";
    private static final String SUCCESS = "SearchCategoryServicesController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String CategoryID = request.getParameter("categoryID");
            String CategoryName = request.getParameter("categoryName");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));            
            CategoryServiceDTO category = new CategoryServiceDTO(CategoryID, CategoryName, status);       
            AdminDAO dao = new AdminDAO();
            
            boolean checkUpdate = dao.deleteCategory(category);
            
            List<DoctorDTO> list1 = dao.getListDROFCT(CategoryID);
             if (!list1.isEmpty()) {
                    for (DoctorDTO dr : list1) {
                        String USID = dr.getUserID();
                        boolean checkUP = dao.updateCT_DR(USID);
                        if (checkUP) {
                            request.setAttribute("MESS_CF2", "Có một số trạng thái của bác sĩ bị xóa!");
                        }
                        long millis = System.currentTimeMillis();
                        Date curDate = new java.sql.Date(millis);
                        List<BookingDTO> list = dao.getListBKOFCT(USID, curDate);
                        if (!list.isEmpty()) {
                        for (BookingDTO bk : list) {
                        boolean checkUP2 = dao.updateBKConflict_CT(bk.getBookingID());
                        if (checkUP2) {
                            request.setAttribute("MESS_CF", "Có một số cuộc hẹn của khách hàng bị xung đột!");
                        }
                    }
                }
                    }
                }

            
            if (checkUpdate) {
                 request.setAttribute("MESS_UP_CATE", "Mã Loại Dịch Vụ: "+ CategoryID + "; Tên: "+ CategoryName+ " đã được ẩn ");
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at DeleteCategoryController: " + e.toString());
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
