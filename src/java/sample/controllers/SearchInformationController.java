/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import sample.informattion.InformationDAO;
import sample.informattion.NewsDTO;

/**
 *
 * @author QUANG VAN
 */
@WebServlet(name = "SearchInformationController", urlPatterns = {"/SearchInformationController"})
public class SearchInformationController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "SearchInformationResult.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String txtSearch = request.getParameter("txtSearch");
            String indexSt = request.getParameter("index");
            int index = Integer.parseInt(indexSt);

            InformationDAO dao = new InformationDAO();
            int count = dao.count(txtSearch);
            int pageSize = 3;
            int endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
            if (count != 0) {
                request.setAttribute("ERROR", "Số lượng kết quả tìm kiếm từ khóa"+" " +"'" + txtSearch.toUpperCase() +"'"+ " " + "là:"+ " " + count );
            }else{
                request.setAttribute("ERROR", "Không tìm thấy từ khóa"+" "+"'"+ txtSearch.toUpperCase()+"'." + " "+ "\n" + " Vui lòng thử lại với một số từ khóa khác nhau. ");
            }
            List<NewsDTO> listSearch = dao.search(txtSearch, index, pageSize);

            request.setAttribute("endPage", endPage);
            request.setAttribute("list", listSearch);
            request.setAttribute("saveinfo", txtSearch);

            url = SUCCESS;
        } catch (Exception ex) {
            log("Error at SearchInformationController:" + ex.toString());
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
