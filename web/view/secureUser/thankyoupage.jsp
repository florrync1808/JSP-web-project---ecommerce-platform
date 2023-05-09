<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Orders"%>

<% if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "userRole") {
        response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
    } else {
    }%>
<!--this page only viewable by user-->

<%
    ResultSet order = (ResultSet) session.getAttribute("ThankYouOrder");
%>

<div class="flex items-center justify-center h-screen">
    <div>
        <div class="flex flex-col items-center space-y-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="text-green-600 w-28 h-28" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <h1 class="text-4xl font-bold">Thank You !</h1>

            <!-- move cursor to next line -->
            <% if (order.next()) {%>
            <p>Order ID : <%= order.getString("ORDER_ID")%></p>
            <p>Order Date :  <%= order.getString("CREATED_AT")%></p>
            <% }%>
            <a href="/pepegacoJAVAEE6/view/secureUser/OrderHistory.jsp"
               class="inline-flex items-center px-4 py-2 text-white bg-indigo-600 border border-indigo-600 rounded rounded-full hover:bg-indigo-700 focus:outline-none focus:ring">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-3 h-3 mr-2" fill="none" viewBox="0 0 24 24"
                     stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M7 16l-4-4m0 0l4-4m-4 4h18" />
                </svg>
                <span c lass="text-sm font-medium">
                    Order History
                </span>
            </a>
        </div>
    </div>
</div>
