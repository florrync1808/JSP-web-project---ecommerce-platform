
package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import model.ProductService;
import model.Products;


public class SearchProductServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    
    String msg = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductService productService = new ProductService(em);
            HttpSession session = request.getSession();

            //get productID or productName from the attribute
            String input = request.getParameter("input");
            
            if (input.length() == 1) {
                msg = "Input must be at least 2 characters.";
                session.setAttribute("inputErrorMsg", msg);
            } else if (input.charAt(1) == '0') {
                Products product = productService.findProductByID(input);
                session.setAttribute("product", product);
            } else if (input.length() >= 2) {
                Products product = productService.findProductByName(input);
                session.setAttribute("product", product);
            } else {
                Products product = null;
                session.setAttribute("product", product);
            }

            response.sendRedirect("/pepegacoJAVAEE6/view/SearchResult.jsp");
        } catch (Exception ex) {
            Logger.getLogger(SearchProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
