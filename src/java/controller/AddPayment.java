package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.*;

public class AddPayment extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //obtain input form user/view
            HttpSession session = request.getSession(true);
            PaymentService paymentService = new PaymentService(em);
            String custId = (String) session.getAttribute("customerId");
            String total = session.getAttribute("total").toString();
            String staffId = request.getParameter("staffId");    // output is null
            String paymentMethod = request.getParameter("paymentMethod");
            List<CartLists> cartList = (List) session.getAttribute("cartList");
            Customers customer = paymentService.findCustomerByCode(custId);
            String address = customer.getLine1() + ", " + customer.getLine2() + ", " + customer.getCity() + ", " + customer.getPostcode() + " " + customer.getState();
            Double doubleAmount = Double.parseDouble(total);
            Products freegift = paymentService.findProductDetails("FREEGIFT");

            //genarate PaymentId, OrderId, OrderListId and OrderStatusID
            int x = paymentService.getDBPaymentCount();
            String payId = paymentService.GeneratePaymentId(x);
            int y = paymentService.getDBOrderCount();
            String orderId = paymentService.GenerateOrderId(y);
            int z = paymentService.getDBOrderListCount();
            String orderListId = paymentService.GenerateOrderListId(z);
            int a = paymentService.getDBOrderStatusCount();
            String orderStatusId = paymentService.GenerateOrderStatusId(a);
            
//            System.out.println(cartList);
//            System.out.println("1");
//            System.out.println("2");
//            int max = paymentService.getDBStaffListCount();
            int max = 3;
            int min = 1;
////            System.out.println("3");
            int staffIndex = (int) Math.floor(Math.random() * (max - min + 1) + min);

//            System.out.println("4");
//            System.out.println("5");
//            System.out.println(z);
//            System.out.println(orderListId);

            // get current datetime and convert it from timestamp to datetime
            Timestamp ts = new Timestamp(System.currentTimeMillis());
            Date paymentCreatedAt = ts;

            // insert data into tables
            DBConnection.insertUpdateFromSqlQuery("INSERT INTO PAYMENTS (PAYMENT_ID, PAYMENT_AMOUNT, PAYMENT_METHOD, CREATED_AT) VALUES ('" + payId + "'," + doubleAmount + ",'" + paymentMethod + "','" + paymentCreatedAt + "')");
            DBConnection.insertUpdateFromSqlQuery("INSERT INTO ORDERS VALUES ('" + orderId + "'," + staffIndex + ",'" + staffId + "','" + custId + "','" + payId + "','" + address + "','" + customer.getName() + "','" + customer.getContactNo() + "','" + paymentCreatedAt + "')");
            DBConnection.insertUpdateFromSqlQuery("INSERT INTO ORDER_STATUSES VALUES ('" + orderStatusId + "','packaging','" + orderId + "','" + paymentCreatedAt + "')");
            

            // get productId in string and insert into order_lists
            for (CartLists item : cartList) {
                Products id = item.getProductId();
                String text = id.toString();

                if (text.length() > 8) {
                    text = text.substring(26, 34);
                    DBConnection.insertUpdateFromSqlQuery("INSERT INTO ORDER_LISTS VALUES ('" + orderListId + "','" + text + "','" + orderId + "'," + item.getItemQty() + ")");
                }
                z++;
                orderListId = paymentService.GenerateOrderListId(z);
            }
            
            if (doubleAmount >= 180) {

                DBConnection.insertUpdateFromSqlQuery("INSERT INTO ORDER_LISTS VALUES ('" + orderListId + "','FREEGIFT','" + orderId + "', 1" + ")");
            }
            
            // clear the cart
            DBConnection.insertUpdateFromSqlQuery("DELETE FROM CART_LISTS WHERE CUSTOMER_ID = '" + custId + "'");
            
            // retrieve the order record
            ResultSet rs = DBConnection.getRSfromQuery("SELECT * FROM ORDERS WHERE ORDER_ID = '" + orderId + "'");
            session.setAttribute("ThankYouOrder", rs);
            
            response.sendRedirect("/pepegacoJAVAEE6/view/secureUser/thankyoupage.jsp");

        } catch (Exception ex) {
//            Logger.getLogger(AddItem.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
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
