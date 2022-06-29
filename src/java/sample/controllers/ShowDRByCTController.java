package sample.controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.booking.ScheduleDTO;
import sample.user.DoctorDTO;
import sample.user.PatientDAO;

/**
 *
 * @author Xqy
 */
@WebServlet(urlPatterns = {"/ShowDRByCTController"})
public class ShowDRByCTController extends HttpServlet {

    private static final String ERROR = "MainController?action=ShowService&sName&action=ShowDRByCT";
    private static final String SUCCESS = "MainController?action=ShowService&sName&action=ShowDRByCT";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String serviceName = request.getParameter("serviceName");
            PatientDAO dao = new PatientDAO();
            List<DoctorDTO> listDoctor = dao.getListDoctor(serviceName);

            if (listDoctor.size() > 0) {
                request.setAttribute("LIST_DOCTOR_CT", listDoctor);
                for (DoctorDTO dt : listDoctor) {
                    List<ScheduleDTO> listSC = dao.getDayWorkDR(dt.getUserID());
                    request.setAttribute("LIST_DOCTOR_DW", listSC);
                }
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at ShowDRByCTController:" + e.toString());
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
