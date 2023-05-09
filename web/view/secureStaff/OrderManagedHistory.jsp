<%-- 
    Document   : OrderManagedHistory
    Created on : Apr 30, 2023, 12:20:56 AM
    Author     : Vallerie
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="model.ProductOfOrderList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<% List<ProductOfOrderList> orderListHistory = (ArrayList) session.getAttribute("orderListHistory");%>
<% String staffName = session.getAttribute("UserDBName").toString();%>
<% if (request.isUserInRole("adminRole")) {

    } else if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") {

        response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
    } else {
    }%>

<div class=" h-fit bg-gray-200 w-full rounded-md py-10 p-2 m-auto">
    <div class="m-8 p-8 bg-white shadow-md rounded-md dark:bg-gray-800">
        <div class="px-3">
            <p class="text-xl font-bold dark:text-white">Order Managed By <%=staffName%></p>
            <hr class="my-4 border-gray-900"/>
        </div>  
        <!-- here -->
        <div class="flex flex-col place-items-center">
        <% String initOrderId = "";
            for(int i=0; i < orderListHistory.size() ; i++) {
    if(!initOrderId.equals(orderListHistory.get(i).getOrderId())){ 
    initOrderId = orderListHistory.get(i).getOrderId();
    %>
            
            <div class="flex flex-row ">

        <a class="px-28" href="/pepegacoJAVAEE6/OrderListManageServlet?orderId=<%=orderListHistory.get(i).getOrderId()%>"><%= orderListHistory.get(i).getOrderId() %> </a>
        <p class="px-28"><%=orderListHistory.get(i).getDescription()%></p>
          <br>
            <% } }%>
            </div>
        </div>
        <hr class="border-1 border-gray-800 mt-10 px-5"> 


    </div>
</div> 
