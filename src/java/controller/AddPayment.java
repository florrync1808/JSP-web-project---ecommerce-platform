/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.text.DecimalFormat;
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
            String custId = (String) session.getAttribute("customerId");

            System.out.println(custId);
            String total = request.getParameter("total");
            String paymentMethod = request.getParameter("paymentMethod");
            Payments payment = new Payments(total, paymentMethod);
            System.out.println(payment);
            System.out.println(paymentMethod);
            Customers customerC = paymentService.findCustomerByCode(custId);
//            CardProfile.find

//            StockDetails sd1 = entityManager.find(StockDetails.class, <id_of_existing_stockdetails>);
//            c1.setStockDetails(sd1);
//            entityManager.persist(c1);

            if (paymentMethod.equals("card")) {
                String paymentCard = request.getParameter("paymentCard");
                System.out.println(paymentCard);

                if (paymentCard.equals("add")) {
                    String cardHolder = request.getParameter("cardHolder");
                    String cardNumber = request.getParameter("cardNumber");
                    String expiryDate = request.getParameter("expiryDate");
                    String expiryYear = request.getParameter("expiryYear");
                    String CCV = request.getParameter("CCV");
                    CardProfiles cardProfiles = new CardProfiles(cardNumber, CCV, expiryDate, expiryYear);
                    payment.setCardNo(cardProfiles);
                    cardProfiles.setCustomerId(customerC);
                }
            }

            utx.begin();
            boolean success = paymentService.addItem(payment);
            utx.commit();
            response.sendRedirect("/pepegacoJAVAEE6/");
        } catch (Exception ex) {
//            Logger.getLogger(AddItem.class.getName()).log(Level.SEVERE, null, ex);
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
