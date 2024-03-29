
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;


public class ViewReport extends HttpServlet {

        @PersistenceContext
        EntityManager em;
    
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        PrintWriter writer = response.getWriter();
        try {
            ReportService reportService = new ReportService(em);
            List<OrderLists> orderList = reportService.findOrderListAll();
            List<Products> productList = reportService.findAll();
            TreeMap<String, Integer> prodQty = reportService.calculateQtyofProduct();
            HttpSession session = request.getSession();
            session.setAttribute("productList", productList);
            session.setAttribute("orderList", orderList);
            session.setAttribute("prodQty", prodQty);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureAdmin/Report.jsp");
        } catch (Exception ex) {
            Logger.getLogger(ViewReport.class.getName()).log(Level.SEVERE, null, ex);

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
