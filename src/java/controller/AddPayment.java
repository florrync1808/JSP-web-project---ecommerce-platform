/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
            String id = "";
            String total = session.getAttribute("total").toString();
            String paymentMethod = request.getParameter("paymentMethod");
            Customers customer = paymentService.findCustomerByCode(custId);
            SimpleDateFormat datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Double doubleAmount = Double.parseDouble(total);
            
            int x = paymentService.getDBPaymentCount();
            id = paymentService.GeneratePaymentId(x);
            
            
            DBConnection.insertUpdateFromSqlQuery("INSERT INTO PAYMENTS (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_METHOD, CREATED_AT) VALUES ('" + id + "'," + doubleAmount + ",'" + paymentMethod + "','" + datetime.format(payment.getCreatedAt()) + "')");
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
