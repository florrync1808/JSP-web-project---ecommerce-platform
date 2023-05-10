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

            //assign productId 
            String id = String.format("P%07d", productList.size());

            //get parameter and set to the variable
            String name = request.getParameter("pname");
            String desc = request.getParameter("pdesc");
            double price = Double.parseDouble(request.getParameter("pprice"));
            String photo = "/pepegacoJAVAEE6/assets/images/products/" + request.getParameter("ppic");

            // get current datetime and convert it from timestamp to datetime
            Timestamp ts = new Timestamp(System.currentTimeMillis());
            Date dateCreated = ts;
            
            // put all the input data into the constructor
            Products product = new Products(id, name, price, desc, photo, dateCreated);
            
            // execute the function to add the product
            utx.begin();
            boolean success = productService.addProduct(product);
            utx.commit();

            if (success) {
                confirmMsg = "Added Product " + id + "Succesfully!";
            } else {
                confirmMsg = "Add Product Failed!";
            }
            
            // reload the product list
            productList = productService.findAll();
            
            HttpSession session = request.getSession();
            
            // set the updated product list to the attribute
            session.setAttribute("ProductList", productList);
            
            // set the add comfirm msg to the attribute
            session.setAttribute("AddConfirmMsg", confirmMsg);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureStaff/ProductsList.jsp");
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
