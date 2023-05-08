package controller;

import model.Staffs;
import model.StaffsService;
import model.DBConnection;
import java.io.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.logging.*;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AddStaffServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    String confirmMsg = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            StaffsService staffsService = new StaffsService(em);
            List<Staffs> staffsList = staffsService.findAll();

            //StaffID auto generated
            int numStaffs = staffsList.size();
            String staffId = String.format("ST%06d", numStaffs + 1);
            //Staff name
            String name = request.getParameter("sName");
            //staff birth date
            String birthDateStr = request.getParameter("sBirthDate");
            //contact number
            String contactNo = request.getParameter("sContactNo");
            //email
            String email = request.getParameter("sEmail");
            //activate emploment status
            String employmentStatus = "active";
            //default password staffpw1
            String password = "staffpw1";

            //created at, time NOW; convert the timestamp to datetime
            Timestamp ts = new Timestamp(System.currentTimeMillis());
            Date createdAt = ts;

            String insertQuery = "INSERT INTO STAFFS (STAFF_ID, NAME, BIRTHDATE, CONTACT_NO, EMAIL, EMPLOYMENT_STATUS, PASSWORD, CREATED_AT) VALUES ('"
                    + staffId + "','"
                    + name + "','"
                    + birthDateStr + "','"
                    + contactNo + "','"
                    + email + "','"
                    + employmentStatus + "','"
                    + password + "','"
                    + createdAt + "')";
            DBConnection.insertUpdateFromSqlQuery(insertQuery);

            staffsList = staffsService.findAll();
            HttpSession session = request.getSession();
            session.setAttribute("staffL", staffsList);
            session.setAttribute("AddStaffConfirmationMsg", "Staff added succesfully!");
            response.sendRedirect("/pepegacoJAVAEE6/view/secureAdmin/ManageStaff.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
