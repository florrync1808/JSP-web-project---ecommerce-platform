
package controller;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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

public class DeleteProductServlet extends HttpServlet {
    
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    String confirmMsg = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductService productService = new ProductService(em);
            HttpSession session = request.getSession();
            
            String id = request.getParameter("pid");
               
            utx.begin();
            boolean success = productService.deleteProduct(id);
            utx.commit();
            
            if (success == true) {
                confirmMsg = "Deleted Product " + id + " Successfully!";

            } else {
                confirmMsg = "Delete Product Failed!";
            }
            
            // reload the product list
            List<Products>productList = productService.findAll();

            // set the updated product list to the attribute
            session.setAttribute("ProductList", productList);

            // set the delete comfirm msg to the attribute
            session.setAttribute("DeleteConfirmMsg", confirmMsg);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureStaff/ProductsList.jsp");

            session.setAttribute("success", success);
            response.sendRedirect("secureAdmin/DeleteConfirm.jsp");
        } catch (Exception ex) {
            Logger.getLogger(DeleteProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
