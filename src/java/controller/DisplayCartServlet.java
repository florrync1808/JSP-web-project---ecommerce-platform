package controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import model.DBConnection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.CartListService;
import model.CartLists;
import model.DBConnection;

public class DisplayCartServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            HttpSession session = request.getSession();
            String customerId = (String) session.getAttribute("customerId");
            session.getAttribute("ProductList");
            
            if (customerId == null) {
                response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
            }
            
            CartListService cartlistService = new CartListService(em);
            List<CartLists> cartList = cartlistService.findCartListbyCustId(customerId);
//            DBConnection.getRSfromQuery("SELECT * FROM CART_LISTS WHERE CUSTOMER_ID='"+customerId+"'");
            session.setAttribute("cartList", cartList);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureUser/Cart.jsp");
            
        } catch (Exception ex) {
            Logger.getLogger(DisplayProductsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
