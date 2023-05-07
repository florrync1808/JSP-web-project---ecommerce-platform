/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.*;

/**
 *
 * @author End User
 */
public class AddPayment extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            //obtain input form user/view
            HttpSession session = request.getSession(true);
            PaymentService paymentService = new PaymentService(em);
            Payments payment = new Payments();
            String custId = (String) session.getAttribute("customerId");
            String total = session.getAttribute("total").toString();
            String staffId = request.getParameter("staffId");
            String paymentMethod = request.getParameter("paymentMethod");
            List<CartLists> cartList = (List)session.getAttribute("cartList");
            Customers customer = paymentService.findCustomerByCode(custId);
            String payId = "";
            String address = customer.getLine1() + ", " + customer.getLine2() + ", " + customer.getCity() + ", " + customer.getPostcode() + " " + customer.getState();
            SimpleDateFormat datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Double doubleAmount = Double.parseDouble(total);
            
            int x = paymentService.getDBPaymentCount();
            payId = paymentService.GeneratePaymentId(x);
            int y = paymentService.getDBOrderCount();
            System.out.println("eheh");
            String orderId = paymentService.GenerateOrderId(y);
            int z = paymentService.getDBOrderListCount();
            String orderListId = paymentService.GenerateOrderListId(z);
//            int max = paymentService.getDBStaffListCount();
            int max = 3;
            System.out.println(max);
            int min = 1; 
            int staffIndex = (int)Math.floor(Math.random() * (max - min + 1) + min);
            int a = paymentService.getDBOrderStatusCount();
            String orderStatusId = paymentService.GenerateOrderStatusId(a);
            
            DBConnection.insertUpdateFromSqlQuery("INSERT INTO PAYMENTS (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_METHOD, CREATED_AT) VALUES ('" + payId + "'," + doubleAmount + ",'" + paymentMethod + "','" + datetime.format(payment.getCreatedAt()) + "')");
            DBConnection.insertUpdateFromSqlQuery("INSERT INTO ORDERS VALUES ('"+ orderId + "'," + staffIndex +  ",'" + staffId + "','" + custId + "','" + payId + "','" + address + "','" + customer.getName() + "','" + customer.getContactNo() + "','" + datetime.format(payment.getCreatedAt()) + "')");
            DBConnection.insertUpdateFromSqlQuery("INSERT INTO ORDER_STATUSES VALUES ('"+ orderStatusId + "','packaging','" + orderId + "','" + datetime.format(payment.getCreatedAt()) + "')");
            for(CartLists item:cartList){
                DBConnection.insertUpdateFromSqlQuery("INSERT INTO ORDER_LISTS VALUES ('"+ orderListId + "','" + item.getProductId() +  "','" + orderId + "'," + item.getItemQty() + ")");
            }
//            
            
            response.sendRedirect("/pepegacoJAVAEE6/");
        } catch (Exception ex) {
//            Logger.getLogger(AddItem.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
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
