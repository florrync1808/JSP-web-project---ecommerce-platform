package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import model.DBConnection;

public class UpdateCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//Getting all the data from the user/cutomer
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String productId = request.getParameter("productId");
        HttpSession session = request.getSession();
        try {
            //Querying to database
            //Update Query for updating product quantity
            int updateQuantity = DBConnection.insertUpdateFromSqlQuery("update CART_LISTS set quantity='" + quantity + "' where customer_id='" + session.getAttribute("customerId") + "' and product_id='" + productId + "' ");
            //If cart of online shopping systemis sucessfully updated
            if (updateQuantity > 0) {
                //Sending response back to the user/customer.
                response.sendRedirect("/pepegacoJAVAEE6/view/secureUser/Cart.jsp");
                //If cart is not updated
            } else {
                //Sending response back to the user/customer.
                response.sendRedirect("/pepegacoJAVAEE6/view/secureUser/Cart.jsp");
            }
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
