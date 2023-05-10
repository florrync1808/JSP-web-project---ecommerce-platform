package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DBConnection;
import model.ProductService;
import model.Products;

public class TopSellProductServlet extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//         response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<h1>1231312312312</h1>");
//            
//
//        }
        
        
        
        try {

            ProductService productService = new ProductService(em);
            List<Products> productList = productService.findAll();
            System.out.println(productList.getClass());
            List<String> nameofTop3 = (ArrayList) DBConnection.selectTop3Record();
            List<Products> top3productList = new ArrayList<Products>();
            String prodName = "";
            for (int i = 0; i < 3; i++) {
                for (Products prod : productList) {
                    prodName = prod.getProductName();
                    if (nameofTop3.get(i).equals(prodName)) {
                        top3productList.add(prod);
                    }
                }
            System.out.println(top3productList.get(i).getProductDesc());
            }
            HttpSession session = request.getSession();
            session.setAttribute("top3Prod", top3productList);
//            request.setAttribute("zxzx", top3productList);
//            response.sendRedirect("/pepegacoJAVAEE6/view/index.jsp");
//            RequestDispatcher view=request.getRequestDispatcher("index.jsp");
//            view.forward(request,response);

        } catch (Exception ex) {
            Logger.getLogger(TopSellProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
