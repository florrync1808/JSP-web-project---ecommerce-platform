package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import model.CustomerService;
import model.Customers;

public class UpdateCustomerServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    String confirmMsg = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        try {
            CustomerService custService = new CustomerService(em);
            List<Customers> custList = custService.findAll();

            // get all the input from the edit page
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String contact = request.getParameter("contactno");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String line1 = request.getParameter("line1");
            String line2 = request.getParameter("line2");
            String state = request.getParameter("state");
            String city = request.getParameter("city");
            String postcode = request.getParameter("postcode");
            
            
            //parse string to date
            SimpleDateFormat dateFormat1 = new SimpleDateFormat("MM/dd/yyyy");
            SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date birthdate = dateFormat1.parse(request.getParameter("birthdate"));
            Date createdAt = dateFormat2.parse(request.getParameter("createdAt"));
            
            // put all the input data into the constructor
            Customers customer = new Customers(id, name, birthdate, contact, email, password, line1, line2, state, city, postcode, createdAt);

            // execute the function to update the product
            utx.begin();
            boolean success = custService.updateCustomer(customer);
            utx.commit();

            if (success) {
                confirmMsg = "Updated Successfully!";

            } else {
                confirmMsg = "Update Failed!";
            }

            // reload the product list
            custList = custService.findAll();

            HttpSession session = request.getSession();

            // set the updated product list to the attribute
            session.setAttribute("CustomerList", custList);

            // set the edit comfirm msg to the attribute
            session.setAttribute("EditConfirmMsg", confirmMsg);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureUser/UserAccount.jsp");

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
