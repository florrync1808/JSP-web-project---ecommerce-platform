<%@page import="java.util.ArrayList"%>
<%@page import="model.ProductOfOrderList"%>
<%@page import="java.util.List"%>
<% List<ProductOfOrderList> orderHistory = (ArrayList)session.getAttribute("purchaseHistory"); %>

<% if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "userRole") { 
       response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");}
    else { }%>
    <!--this page only viewable by user-->
<div class=" h-fit bg-gray-200 w-full rounded-md py-10 p-2">
    <div class="m-8 p-8 bg-white shadow-md rounded-md dark:bg-gray-800">
        <div class="px-3">
            <p class="text-xl font-bold dark:text-white">My Purchase History</p>
            <hr class="my-4 border-gray-900"/>
        </div>  
        <!-- here -->
<div class="flex flex-col place-items-center">
        <% String initOrderId = "";
            for(int i=0; i < orderHistory.size() ; i++) {
    if(!initOrderId.equals(orderHistory.get(i).getOrderId())){ 
    initOrderId = orderHistory.get(i).getOrderId();
    %>
    <div class="flex flex-row ">
        
        
        <a class="px-28" href="/pepegacoJAVAEE6/DisplayPurchaseHistoryDetails?orderId=<%=orderHistory.get(i).getOrderId()%>"><%= orderHistory.get(i).getOrderId() %> </a>
                <p class="px-28"><%=orderHistory.get(i).getDescription()%></p>

          <br>
    </div>
            <% } }%>
            
</div>        
          <br>
            
        
        <hr class="border-1 border-gray-800 mt-10 px-5"> 


    </div>
</div> 