package controller;

import model.*;
import java.io.*;
import java.util.List;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;

public class DeleteStaffServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    String confirmMsg = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            StaffsService staffService = new StaffsService(em);
            HttpSession session = request.getSession();
            String id = request.getParameter("staffId") ;
               
            utx.begin();
            boolean success = staffService.deleteStaff(id);
            utx.commit();
            
            if (success) {
                confirmMsg = "Deleted Customer " + id + " Successfully!";

            } else {
                confirmMsg = "Delete Customer Failed!";
            }
            
            // reload the customer list
            List<Staffs> staffList = staffService.findAll();
            
            session.setAttribute("staffL", staffList);
            
            // set the delete comfirm msg to the attribute
            session.setAttribute("DeleteConfirmMsg", confirmMsg);
            
            response.sendRedirect("/pepegacoJAVAEE6/view/secureAdmin/ManageStaff.jsp");
        } catch (Exception ex) {
            Logger.getLogger(DeleteCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
