package controller;

import model.Products;
import model.ProductService;
import java.io.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
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
            ProductService productService = new ProductService(em);
            List<Products> productList = productService.findAll();

            //count row
            int countp = 0;
            int counta = 0;
            for (Products product : productList) {
                if (product.getProductId().charAt(0) == 'P') {
                    countp++;
                } else if (product.getProductId().charAt(0) == 'A') {
                    counta++;
                }
            }

            //assign productId based on categories
            String id = null;
            if ("plant".equals(request.getParameter("ptype"))) {
                id = String.format("P%07d", countp + 1);
            }
            if ("other".equals(request.getParameter("ptype"))) {
                id = String.format("A%07d", counta + 1);
            }

            //get parameter and set to the variable
            String name = request.getParameter("pname");
            String desc = request.getParameter("pdesc");
            double price = Double.parseDouble(request.getParameter("pprice"));
            String photo = "/pepegacoJAVAEE6/assets/images/products/" + request.getParameter("ppic");
            
            // convert the timestamp to datetime
            Timestamp ts=new Timestamp(System.currentTimeMillis());   
            Date createdAt = ts;

            Products product = new Products(id, name, price, desc, photo);
            
            utx.begin();
            boolean success = productService.addProduct(product);
            utx.commit();

            if (success == true) {
                confirmMsg = "Added Succesfully!";
            } else {
                confirmMsg = "Add Product Failed!";
            }

            productList = productService.findAll();
            HttpSession session = request.getSession();
            session.setAttribute("ProductList", productList);
            session.setAttribute("AddItemconfirmationMsg", confirmMsg);
            response.sendRedirect("/pepegacoJAVAEE6/ProductListServlet");
        } catch (Exception ex) {
            Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
