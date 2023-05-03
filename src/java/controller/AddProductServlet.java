package controller;

import model.Products;
import model.ProductService;
import java.io.*;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;

public class AddProductServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    String confirmMsg = ""; 

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String desc = request.getParameter("desc");
            double price = Double.parseDouble(request.getParameter("price"));
            String photo = request.getParameter("photo");
            

            
            Products product = new Products(id, name, price, desc, photo);
            ProductService productService = new ProductService(em);
            utx.begin();
            boolean success = productService.addItem(product);
            utx.commit();
            
            HttpSession session = request.getSession();
            if (success == true){
            confirmMsg = "Added Succesfully!";
            }
            else{
            confirmMsg = "Add Item Failed!";
            }
  
            session.setAttribute("success", success);
            session.setAttribute("AddItemconfirmationMsg", confirmMsg);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureStaff/ProductList.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
