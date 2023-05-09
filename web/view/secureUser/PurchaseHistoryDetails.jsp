<%-- 
    Document   : PurchaseHistory
    Created on : May 8, 2023, 12:05:59 AM
    Author     : Vallerie
--%>

<%@page import="model.ProductOfOrderList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<% List<ProductOfOrderList> orderHistory = (ArrayList) session.getAttribute("purchaseHistory"); %>
<% List<ProductOfOrderList> purchaseHistoryDetails = (List) session.getAttribute("purchaseHistoryDetails");%>
<%String customerOrderId = session.getAttribute("customerOrderId").toString(); %>
<% String DateTime = session.getAttribute("DateTime").toString();%>
<% String amount = session.getAttribute("amount").toString();%>
<% if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "userRole") {
        response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");
    } else {
    }%>

<div class=" h-fit bg-gray-200 w-full rounded-md py-10 p-2">
    <div class="m-8 p-8 bg-white shadow-md rounded-md dark:bg-gray-800">
        <div class="px-3">
            <p class="text-xl font-bold dark:text-white">Order List History</p>
            <hr class="my-4 border-gray-900"/>
        </div>  
        <!-- here -->

        <div class="flex items-center justify-between pt-10">
            <p class="pl-10 text-base leading-none text-gray-800 dark:text-white font-medium">Order : <%= customerOrderId%></p>

            <p class=" pr-10 text-base leading-none text-gray-800 dark:text-white font-medium">Date: <%= DateTime%> </p>
        </div>

        <div class="grid grid-cols-5 gap-y-12 p-8 pt-16">
            <div class="col-span-3"> 
                <p class="text-base font-black leading-none text-gray-800 dark:text-white text-center underline">Products </p>
            </div> 
            <div class="col-span-1"> 
                <p class="text-base font-black leading-none text-gray-800 dark:text-white  underline">Quantity </p>
            </div> 
            <div class="col-span-1"> 
                <p class="text-base font-black leading-none text-gray-800 dark:text-white  underline">Subtotal Price </p>
            </div> 
            <% double subtotal=0.00, shipping = 25.00,free=0.00; %>
            
            <%for (ProductOfOrderList po : purchaseHistoryDetails) {%>
            <div class="col-span-1  w-full">
                <img src="<%=po.getProductPhoto()%>" alt="" class="md:w-4/12 w-full ml-10 object-center object-cover md:block hidden" />
            </div>

            <div class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center col-span-2">
                <p class="text-xs leading-3 text-gray-800 dark:text-white md:pt-0 pt-4"><%=po.getProductId()%></p>
                <div class="flex items-center justify-between w-full pt-1">
                    <p class="text-base font-medium leading-none text-gray-800 dark:text-white"><%=po.getProductName()%></p>
                </div>

                <p class="mr-2 text-base font-medium leading-none text-gray-800 dark:text-white"><%=po.getProductPrice()%></p>

            </div>

            <div class="col-span-1">
                <div class="w-36 flex items-center ">
                    <p class="mr-2 text-base font-medium leading-none text-gray-800 dark:text-white"><%=po.getOrderQty()%></p>


                </div>
            </div>
            <div class="col-span-1"> 

                <p class="mr-2 text-base font-medium leading-none text-gray-800 dark:text-white"><%=Double.parseDouble(po.getOrderQty()) * Double.parseDouble(po.getProductPrice())%> </p>
            </div>

                <% subtotal += Double.parseDouble(po.getProductPrice()) * Double.parseDouble(po.getOrderQty()); }
            %>    
            <div class="w-9/12 m-auto col-span-3 ">
                <div class="flex items-center justify-between pt-5">
                    <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Subtotal</p>
                    <p class="text-base leading-none text-gray-800 dark:text-white font-medium"><%=String.format("RM %.2f",subtotal)%></p>
                </div>
                <div class="flex items-center justify-between pt-5">
                    <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Shipping Fee (RM)</p>
                    <p class="text-base leading-none text-gray-800 dark:text-white font-medium"><% if (subtotal >= 200.00) {
                            out.print(String.format("RM %.2f", free));
                        } else if (subtotal == 0) {
                            out.print(String.format("RM %.2f", free));
                        } else {
                            out.print(String.format("RM %.2f", shipping));
                        } %></p>
                </div>
                <div class="flex items-center justify-between pt-5">
                    <p class="text-base leading-none text-gray-800 dark:text-white font-medium">GST 6%</p>
                    <p class="text-base leading-none text-gray-800 dark:text-white font-medium"><% out.print(String.format("RM %.2f", subtotal*0.06));%> </p>
                </div>
                <div class="flex items-center justify-between pt-5">
                    <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Total Payment </p>
                    <p class="text-base leading-none text-gray-800 dark:text-white font-medium"><%="RM"+ amount%></p>
                </div>
            </div>

        </div>






    </div>


    <hr class="border-1 border-gray-800 mt-10 px-5"> 


</div>