/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import model.*;

/**
 *
 * @author Vallerie
 */
public class DisplayPurchaseHistory extends HttpServlet {
@PersistenceContext
        EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            ReportService reportService = new ReportService(em);
            String customerId = session.getAttribute("customerId").toString();
            String query = "SELECT ORDERS.ORDER_ID, ORDERS.CREATED_AT, PRODUCTS.PRODUCT_PHOTO, PRODUCTS.PRODUCT_ID, PRODUCTS.PRODUCT_NAME, PRODUCTS.PRODUCT_PRICE, ORDER_LISTS.ORDER_QTY, PAYMENTS.PAYMENT_AMOUNT, ORDER_STATUSES.DESCRIPTION FROM PRODUCTS JOIN ORDER_LISTS ON PRODUCTS.PRODUCT_ID = ORDER_LISTS.PRODUCT_ID JOIN ORDERS ON ORDERS.ORDER_ID = ORDER_LISTS.ORDER_ID JOIN PAYMENTS ON PAYMENTS.PAYMENT_ID = ORDERS.PAYMENT_ID JOIN ORDER_STATUSES ON ORDER_STATUSES.ORDER_ID = ORDERS.ORDER_ID WHERE ORDERS.CUSTOMER_ID = '" + customerId + "' ORDER BY ORDERS.ORDER_ID";
            ResultSet purchaseHistory = DBConnection.getRSfromQuery(query);
            List<ProductOfOrderList> records = new ArrayList<ProductOfOrderList>();
            
            while (purchaseHistory.next()) {
                ProductOfOrderList poList = new ProductOfOrderList(
                        purchaseHistory.getString("order_id"),
                        purchaseHistory.getString("created_at"),
                        purchaseHistory.getString("product_photo"), 
                        purchaseHistory.getString("product_id"), 
                        purchaseHistory.getString("product_name"), 
                        purchaseHistory.getString("product_price"), 
                        purchaseHistory.getString("order_qty"),
                        purchaseHistory.getString("payment_amount"),
                        purchaseHistory.getString("description")
                );
                records.add(poList);
            }
            System.out.println(records);
            session.setAttribute("purchaseHistory", records);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureUser/OrderHistory.jsp");

            
            
            
        }catch (Exception ex) {
            Logger.getLogger(OrderListManageServlet.class.getName()).log(Level.SEVERE, null, ex);

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
