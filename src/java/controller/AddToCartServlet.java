package controller;

import java.io.IOException;
import java.util.logging.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import model.DBConnection;

public class AddToCartServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            session.getAttribute("ProductList");
            String customerId = (String) session.getAttribute("customerId");
            String productId = (String) request.getParameter("productId");

            if (customerId == null) {
                response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
            }
            // Check if the cart has existing product selected
            boolean check = DBConnection.searchForExistingProduct(productId, customerId);

            if (check) {
                DBConnection.insertUpdateFromSqlQuery("UPDATE CART_LISTS SET ITEM_QTY=ITEM_QTY+1 WHERE PRODUCT_ID='" + productId + 
                        "' AND CUSTOMER_ID='" + customerId + "'");
            } else {  // if no insert a new one 
                DBConnection.insertUpdateFromSqlQuery("INSERT INTO CART_LISTS (CUSTOMER_ID, PRODUCT_ID, ITEM_QTY) VALUES ('" + customerId + "','" + productId + "',1)");
            }
                session.setAttribute("addCartMessage", "Item Added To Cart!");
            
            response.sendRedirect("/pepegacoJAVAEE6/view/Products.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
