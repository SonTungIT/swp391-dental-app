/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.feedback.FeedbackDTO;
import sample.user.AdminDAO;
import sample.user.PatientDAO;

/**
 *
 * @author dangk
 */
@WebServlet(name = "CreatefeedbackController", urlPatterns = {"/CreatefeedbackController"})
public class CreatefeedbackController extends HttpServlet {

    private static final String ERROR="error.jsp";
    private static final String SUCCESS="MainController?searchHSBK=&action=SearchHSBK";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
        try {
            
            int count = 1;
            String feedbackID = "FB0" + count;
            PatientDAO dao = new PatientDAO();
            boolean checkDuplicate = dao.checkDuplicate(feedbackID);
            while (checkDuplicate) {
                count = count + 1;
                if(count <10){
                  feedbackID = "FB0" + count;  
                }else{
                  feedbackID = "FB" + count;  
                }
                checkDuplicate = dao.checkDuplicate(feedbackID);
            }
            
          
            
           LocalDateTime current = LocalDateTime.now();
           DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss.SSS");
          
           
           String timeFeedback = current.format(formatter);
            
           long millis=System.currentTimeMillis();   
           Date dateFeedback=new Date(millis);
           
            
            
            String patientID = request.getParameter("patientID");
            
            String bookingID = request.getParameter("bookingID");
            
            String comment = request.getParameter("comment");

            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            
            int rating = Integer.parseInt(request.getParameter("rating"));
            
            FeedbackDTO feedback = new FeedbackDTO(feedbackID, patientID, bookingID, comment, dateFeedback, timeFeedback, status , rating);
            boolean checkUpdate = dao.create_feedback(feedback);
            if (checkUpdate) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at CreateFeedbackController: " + e.toString());
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
