/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;

import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sample.user.PatientDAO;
import sample.user.UserDTO;

/**
 *
 * @author Xqy
 */
@MultipartConfig
@WebServlet(name = "UpdateProfilePatientController", urlPatterns = {"/UpdateProfilePatientController"})
public class UpdateProfilePatientController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            String patientID = request.getParameter("patientID");
            String fullName = request.getParameter("fullName");
            String image = request.getParameter("image");

            PatientDAO dao = new PatientDAO();

            if (action.equals("UpImage")) {
                Part imagePart = request.getPart("imagePart");
                String realPath = request.getServletContext().getRealPath("/images/customers");
                image = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectory(Paths.get(realPath));
                }
                imagePart.write(realPath + "/" + image);
                UserDTO us = new UserDTO(patientID, fullName, image);
                boolean check = dao.updateProfile_Avatar(us);

                if (check) {
                    request.setAttribute("MESS_UP_PFPT", "Cập nhật ảnh đại diện thành công!");
                } else {
                    request.setAttribute("MESS_UP_PFPT", "Cập nhật ảnh đại diện không thành công!");
                }
            } else {
                String password = request.getParameter("password");
                String roleID = request.getParameter("roleID");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                Date birthday = Date.valueOf(request.getParameter("birthday"));
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                Boolean status = Boolean.getBoolean(request.getParameter("status"));
                UserDTO us = new UserDTO(patientID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
                boolean check = dao.updateProfile(us);
                if (check) {
                    request.setAttribute("MESS_UP_PFPT", "Cập nhật thành công!");
                } else {
                    request.setAttribute("MESS_UP_PFPT", "Cập nhật không thành công!");
                }
            }
            request.getRequestDispatcher("ShowProfilePatientController?patienID=" + patientID).forward(request, response);
        } catch (Exception ex) {
            log("Error at UpdateProfilePatientController: " + ex.toString());
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
