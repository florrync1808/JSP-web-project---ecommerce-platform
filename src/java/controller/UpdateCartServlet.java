package controller;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import model.CartListService;
import model.CartLists;
import model.DBConnection;

public class UpdateCartServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Getting all the data from the user/cutomer
        String quantity = (String) request.getParameter("quantity");
        String productId = request.getParameter("productId");
        HttpSession session = request.getSession();
        String customerId = (String) session.getAttribute("customerId");
        try {
            //if no login, redirect
            if (customerId == null) {
                response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
            }

            DBConnection.insertUpdateFromSqlQuery("UPDATE CART_LISTS SET ITEM_QTY=" + quantity + " WHERE PRODUCT_ID='" + productId
                    + "' AND CUSTOMER_ID='" + customerId + "'");

            //If cart of online shopping systemis sucessfully updated redirect back to cart
            CartListService productService = new CartListService(em);
            List<CartLists> cartList = productService.findAll();
            session.removeAttribute("CartLists");
            session.setAttribute("CartLists", cartList);
            
            response.sendRedirect("/pepegacoJAVAEE6/DisplayCartServlet");
        } catch (Exception e) {
            e.printStackTrace();
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
