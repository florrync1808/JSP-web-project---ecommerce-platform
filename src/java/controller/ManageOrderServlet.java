package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DBConnection;
import model.OrderStatuses;
import model.OrderStatusesService;

public class ManageOrderServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    String confirmMsg = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        try {
            String statusId = request.getParameter("statusId");
            String descStatus = request.getParameter("OStatus_" + statusId);

            if (descStatus == null) {
               
            } else {
            String insertQuery = "UPDATE ORDER_STATUSES SET DESCRIPTION='" + descStatus + "' WHERE STATUS_ID='" + statusId + "'";
            DBConnection.insertUpdateFromSqlQuery(insertQuery);
            }
            
            OrderStatusesService oSService = new OrderStatusesService(em);
            List<OrderStatuses> osList = oSService.findAll();
            HttpSession session = request.getSession();
            session.removeAttribute("OrderStatList");
            session.setAttribute("OrderStatList", osList);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureStaff/ManageOrder.jsp");
        } catch (Exception ex) {
            Logger.getLogger(ManageOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
