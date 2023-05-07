<%-- 
    Document   : OrderManagedHistory
    Created on : Apr 30, 2023, 12:20:56 AM
    Author     : Vallerie
--%>


<%@page import="java.sql.ResultSet"%>
<% ResultSet orderListHistory = (ResultSet) session.getAttribute("orderListHistory");%>
<% int orderListHistoryCount = Integer.parseInt(session.getAttribute("orderListHistoryCount").toString());%>

<% if (request.isUserInRole("adminRole")) {

    } else if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") {

        response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
    } else {
    }%>

<div class=" h-fit bg-gray-200 w-full rounded-md py-10 p-2">
    <div class="m-8 p-8 bg-white shadow-md rounded-md dark:bg-gray-800">
        <div class="px-3">
            <p class="text-xl font-bold dark:text-white">Order Managed History</p>
            <hr class="my-4 border-gray-900"/>
        </div>  
        <!-- here -->

        <% String orderIdInit = "";
            for (int i = 0; i < orderListHistoryCount; i++) {
                if (orderListHistory.next()) {
                    if (!orderListHistory.getString("order_id").equals(orderIdInit)) {
                        orderIdInit = orderListHistory.getString("order_id");%>
                        
                        <a href><input readonly type="text" class="text-center font-black bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
                                       value="<%=orderListHistory.getString("order_id")%>"></a>

        <% }}
                }%>    
        <hr class="border-1 border-gray-800 mt-10 px-5"> 


    </div>
</div> 
