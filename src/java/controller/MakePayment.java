
package controller;

import java.io.IOException;
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

public class MakePayment extends HttpServlet {

    @PersistenceContext
        EntityManager em;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try  {
            HttpSession session = request.getSession();
            String custId = (String)session.getAttribute("customerId");
            PaymentService paymentService = new PaymentService(em);
            Customers customer = paymentService.findCustomerDetails(custId);
            String subtotalfromCart = request.getParameter("subtotalfromCart");
            String total = request.getParameter("totalfromCart");
            String shippingFeeFromCart = request.getParameter("shippingFeeFromCart");
            double shippingFee = paymentService.getShippingFee(Double.parseDouble(shippingFeeFromCart));
            List<CartLists> cartList = (List<CartLists>) session.getAttribute("CartLists");
            Products freegift = paymentService.findProductDetails("FREEGIFT");
            

            session.setAttribute("freegift", freegift);
            session.setAttribute("cartList", cartList);
            session.setAttribute("subtotal", subtotalfromCart);
            session.setAttribute("customer", customer);
            session.setAttribute("shippingFee", shippingFee);
            session.setAttribute("total", total);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureUser/Payment.jsp");

           
        }catch (Exception ex) {
            Logger.getLogger(MakePayment.class.getName()).log(Level.SEVERE, null, ex);
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
