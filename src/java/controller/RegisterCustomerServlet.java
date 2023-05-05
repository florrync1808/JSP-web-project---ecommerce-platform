package controller;

import java.io.IOException;
import java.util.Date;
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

public class RegisterCustomerServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            
            String customerId ="";
            String name ="";
            String contactNo ="";
            String email ="";
            String password ="";
            String line1 ="";
            String line2 ="";
            String state ="";
            String city ="";
            String postcode ="";
            Date birthdate =null;
            Date createdAt =null;
            
            
            Customers newCustomer = new Customers ( customerId, name, birthdate, contactNo, email, password,  line1,  line2,  state,  city,  postcode, createdAt);
            CustomerService itemService = new CustomerService(em);
            utx.begin();
            boolean success = itemService.addItem(newCustomer);
            utx.commit();
            session.setAttribute("success", success);
            response.sendRedirect("/pepegacoJAVAEE6/view/secureUser/UserDashboard.jsp");
        } catch (Exception ex) {
            Logger.getLogger(RegisterCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
