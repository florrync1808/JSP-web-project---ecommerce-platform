package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginBean;
import model.LoginDao;

@WebServlet(name = "UserLoginServlet", urlPatterns = {"/UserLoginServlet"})
public class UserLoginServlet extends HttpServlet {

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("username"); //name of input box in UserLogin.jsp. retrieving the values entered by the user and keeping in instance variables for further use.
        String password = request.getParameter("password");

        LoginBean loginBean = new LoginBean(); //creating object for LoginBean class

        loginBean.setUserName(userName); //setting the username and password through the loginBean object to get it in future.
        loginBean.setPassword(password);

        LoginDao loginDao = new LoginDao(); //creating object for LoginDao. This class contains main logic of the application.

        String userValidate = loginDao.authenticateUser(loginBean); //Calling authenticateUser function
        HttpSession session = request.getSession(false);
        
        if (userValidate.equals("SUCCESS")) //If function returns success string then user will be rooted to Home page
        {
            session.setAttribute("userName", userName); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
            session.setAttribute("userRole", "userRole");
            response.sendRedirect("/pepegacoJAVAEE6/view/secureUser/UserDashboard.jsp");
//            request.getRequestDispatcher("/pepegacoJAVAEE6/index.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
        } else {
            session.setAttribute("errMessage", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
            response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
//            request.getRequestDispatcher("/pepegacoJAVAEE6/view/UserLogin.jsp").forward(request, response);//forwarding the request
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
