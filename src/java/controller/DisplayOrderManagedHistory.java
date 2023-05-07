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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author End User
 */
public class DisplayOrderManagedHistory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            String staffId = "ST000002";
            ResultSet orderListHistory = DBConnection.searchForSOrderHistory(staffId);
            ResultSet orderListHistoryA = DBConnection.searchForSOrderHistory(staffId);
            List<ProductOfOrderList> records = new ArrayList<ProductOfOrderList>();
//            ProductOfOrderList poList = new ProductOfOrderList();
                        System.out.println(1);

            
            int rows = 0;
            
            while (orderListHistory.next()) {
                ProductOfOrderList poList = new ProductOfOrderList(
                        orderListHistory.getString("order_id"),
                        orderListHistory.getString("created_at"),
                        orderListHistory.getString("product_photo"), 
                        orderListHistory.getString("product_id"), 
                        orderListHistory.getString("product_name"), 
                        orderListHistory.getString("product_price"), 
                        orderListHistory.getString("order_qty"),
                        orderListHistory.getString("payment_amount")
                );
                System.out.println(1);
                records.add(poList);
//                ProductOfOrderList[] arr = new ProductOfOrderList[rows];
//                for (int i = 0; i < rows; i++) {
//                    records.add(orderListHistory.getString("order_id"),orderListHistory.getString("created_at"),orderListHistory.getString("product_photo"), orderListHistory.getString("product_id"), orderListHistory.getString("product_name"), orderListHistory.getString("product_price"), orderListHistory.getString("order_qty"),orderListHistory.getString("payment_amount"));
//                }
//                records.add(arr);
            }
            
            System.out.println(records);
            int orderListHistoryCount = 0;
//            while (orderListHistoryA.next()) {
//                ProductOfOrderList poList = new ProductOfOrderList();
//            }

            session.setAttribute("orderListHistoryCount", orderListHistoryCount);
            session.setAttribute("orderListHistory", orderListHistory);
            session.setAttribute("orderListHistory", records);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureStaff/OrderManagedHistory.jsp");

        } catch (Exception ex) {
            Logger.getLogger(DisplayOrderManagedHistory.class.getName()).log(Level.SEVERE, null, ex);

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
