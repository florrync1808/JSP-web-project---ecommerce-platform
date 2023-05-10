/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import model.DBConnection;
import model.Staffs;
import model.StaffsService;

public class UpdateStaffServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    String confirmMsg = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            StaffsService staffsService = new StaffsService(em);
            List<Staffs> staffsList = staffsService.findAll();
            
            String staffId = request.getParameter("staffId");
            //Staff name
            String name = request.getParameter("sName");
            //staff birth date
            String birthDate = request.getParameter("sBirthDate");
            SimpleDateFormat input = new SimpleDateFormat("MM/dd/yyyy");
            Date dateValue = input.parse(birthDate);
            SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd");
            String birthDateStr = (String) output.format(dateValue);
            //contact number
            String contactNo = request.getParameter("sContactNo");
            //email
            String email = request.getParameter("sEmail");
            //password
            String password = request.getParameter("sPassword");

            String insertQuery = "UPDATE STAFFS SET "
                    + "NAME='" + name
                    + "', BIRTHDATE='" + birthDateStr
                    + "', CONTACT_NO='" + contactNo
                    + "', EMAIL='" + email
                    + "', PASSWORD='" + password
                    + "' WHERE STAFF_ID='" + staffId + "'";
            
            DBConnection.insertUpdateFromSqlQuery(insertQuery);

            staffsList = staffsService.findAll();
            HttpSession session = request.getSession();
            session.setAttribute("staffL", staffsList);
            session.setAttribute("EditStaffConfirmationMsg", "Staff information update succesfully!");
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
