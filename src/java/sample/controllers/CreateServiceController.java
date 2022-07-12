/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.services.ServiceDTO;
import sample.user.AdminDAO;


/**
 *
 * @author dangk
 */
@WebServlet(name = "CreateServiceController", urlPatterns = {"/CreateServiceController"})
public class CreateServiceController extends HttpServlet {

    private static final String ERROR="createservice.jsp";
    private static final String SUCCESS="MainController?search=&action=Search_Service";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR ;
        try {                     
             
            int count = 1;
            String serviceID = "SV0" + count;
            AdminDAO dao = new AdminDAO();
            boolean checkDuplicate = dao.checkDuplicateService(serviceID);
            while (checkDuplicate) {
                count = count + 1;
                if(count < 10){
                serviceID = "SV0" + count;  
                }else{
                serviceID = "SV" + count;
                }
                checkDuplicate = dao.checkDuplicateService(serviceID);
            }

            String serviceName = request.getParameter("serviceName");
            String image = request.getParameter("image");
            String categoryID = request.getParameter("categoryID");
            int price = Integer.parseInt(request.getParameter("price"));
            String aboutSV = request.getParameter("aboutSV");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            ServiceDTO service = new ServiceDTO(serviceID, serviceName, image, categoryID, price, aboutSV, status);
            boolean checkCreate = dao.createService(service);
            if (checkCreate) {
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("ERROR at CreateServiceController:"+ e.toString());
        }finally{
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
