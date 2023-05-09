package controller;

import model.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;

public class UpdateProductServlet extends HttpServlet {

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

            // get all the input from the edit page
            String id = request.getParameter("pid");
            String name = request.getParameter("pname");
            String desc = request.getParameter("pdesc");
            double price = Double.parseDouble(request.getParameter("pprice"));
            
            //check whether the admin have upload new picture
            String pic = null;
            if ("".equals(request.getParameter("ppic"))) {
                for (Products product : productList) {
                    if (id.equals(product.getProductId())) {
                        pic = product.getProductPhoto();
                    }
                }
            } else {
                pic = "/pepegacoJAVAEE6/assets/images/products/" + request.getParameter("ppic");
            }
            
            //parse string to date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date datetime = dateFormat.parse(request.getParameter("pcreate"));

            // put all the input data into the constructor
            Products product = new Products(id, name, price, desc, pic, datetime);

            // execute the function to update the product
            utx.begin();
            boolean success = productService.updateProduct(product);
            utx.commit();

            if (success) {
                confirmMsg = "Updated Product " + id + " Successfully!";

            } else {
                confirmMsg = "Update Product Failed!";
            }

            // reload the product list
            productList = productService.findAll();

            HttpSession session = request.getSession();

            // set the updated product list to the attribute
            session.setAttribute("ProductList", productList);

            // set the edit comfirm msg to the attribute
            session.setAttribute("EditConfirmMsg", confirmMsg);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureStaff/ProductsList.jsp");

        } catch (Exception ex) {
            Logger.getLogger(UpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
