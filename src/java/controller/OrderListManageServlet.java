
package controller;

import java.io.IOException;
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

public class OrderListManageServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try  {
            HttpSession session = request.getSession(true);
            String orderId = request.getParameter("orderId");
            String staffId = session.getAttribute("staffId").toString();
            String createdAt = "";
            String amt ="";
            String query = "SELECT ORDERS.ORDER_ID, ORDERS.CREATED_AT, PRODUCTS.PRODUCT_PHOTO, PRODUCTS.PRODUCT_ID, PRODUCTS.PRODUCT_NAME, PRODUCTS.PRODUCT_PRICE, ORDER_LISTS.ORDER_QTY, PAYMENTS.PAYMENT_AMOUNT, ORDER_STATUSES.DESCRIPTION FROM PRODUCTS JOIN ORDER_LISTS ON PRODUCTS.PRODUCT_ID = ORDER_LISTS.PRODUCT_ID JOIN ORDERS ON ORDERS.ORDER_ID = ORDER_LISTS.ORDER_ID JOIN PAYMENTS ON PAYMENTS.PAYMENT_ID = ORDERS.PAYMENT_ID JOIN ORDER_STATUSES ON ORDER_STATUSES.ORDER_ID = ORDERS.ORDER_ID WHERE ORDERS.STAFF_ID = '" + staffId + "' AND ORDERS.ORDER_ID = '" + orderId + "'";
            System.out.println(staffId);
            ResultSet list = DBConnection.getRSfromQuery(query);
            List <ProductOfOrderList> poList = new ArrayList<ProductOfOrderList>();
            while(list.next()){
                createdAt = list.getString("created_at");
                amt = list.getString("payment_amount");
                ProductOfOrderList po = new ProductOfOrderList(
                        list.getString("order_id"),
                        list.getString("created_at"),
                        list.getString("product_photo"), 
                        list.getString("product_id"), 
                        list.getString("product_name"), 
                        list.getString("product_price"), 
                        list.getString("order_qty"),
                        list.getString("payment_amount"),
                        list.getString("description")
                );
                poList.add(po); 
            }
            
           
            //select order id, paymentamount, createdAt from
            session.setAttribute("orderId123", orderId);
            session.setAttribute("poList", poList);
            session.setAttribute("createdAt", createdAt);
            session.setAttribute("amt", amt);
            
            response.sendRedirect("/pepegacoJAVAEE6/view/secureStaff/OrderListHistory.jsp");
            

            
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
