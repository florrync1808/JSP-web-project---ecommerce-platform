<%-- 
    Document   : Payment
    Created on : Apr 30, 2023, 12:20:56 AM
    Author     : End User
--%>

<%@page import="model.Products"%>
<%@page import="model.CartLists"%>
<%@page import="java.util.List"%>
<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Customers customer = (Customers) session.getAttribute("customer"); %>
<% List<Customers> customerList = (List) session.getAttribute("customerList");%>
<% List<CartLists> cartList = (List) session.getAttribute("cartList");%>
<% Products freegift = (Products) session.getAttribute("freeGift");%>

<% String subtotal = session.getAttribute("subtotal").toString(); %>
<% String shippingFee = session.getAttribute("shippingFee").toString(); %>
<% String total = session.getAttribute("total").toString(); %>
<% if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "userRole") {
        response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");
    } else {
    }%>



<div class=" h-fit bg-gray-200 w-full rounded-md py-10 p-2">
    <form method="post" action="/pepegacoJAVAEE6/AddPayment">
        <div class="m-8 p-8 bg-white shadow-md rounded-md dark:bg-gray-800">
            <div class="px-3">
                <p class="text-xl font-bold dark:text-white">Payment</p>
                <hr class="my-4 border-gray-900"/>
            </div>  
            <div>
                <div class="w-9/12 flex items-center space-x-5 ml-28 pt-10">
                    <div class="h-14 w-14 bg-yellow-200 rounded-full flex flex-shrink-0 justify-center items-center text-yellow-500 text-2xl font-mono"><svg width="500px" height="500px" viewBox="-0.5 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M8.96991 12.89C10.6599 12.89 12.0299 11.5558 12.0299 9.91C12.0299 8.2642 10.6599 6.93 8.96991 6.93C7.27992 6.93 5.90991 8.2642 5.90991 9.91C5.90991 11.5558 7.27992 12.89 8.96991 12.89Z" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M12.93 13.1C14.37 14.18 15.32 15.84 15.42 17.72C15.43 17.91 15.27 18.07 15.08 18.07H2.84996C2.64996 18.07 2.48996 17.91 2.49996 17.72C2.60996 15.84 3.55997 14.18 5.00997 13.1" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M11.03 12.11H11.02" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M17.1299 14.56C18.2787 14.56 19.2099 13.6556 19.2099 12.54C19.2099 11.4244 18.2787 10.52 17.1299 10.52C15.9812 10.52 15.0499 11.4244 15.0499 12.54C15.0499 13.6556 15.9812 14.56 17.1299 14.56Z" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M20.3 15.13C20.99 15.84 21.44 16.79 21.5 17.83C21.51 17.97 21.4 18.07 21.26 18.07H17.38" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg></div>
                    <div class="block pl-2 font-semibold text-xl self-start text-gray-700">
                        <p class="text-xl font-black  text-gray-800 dark:text-white">Buyer Details</p>
                    </div>
                </div>
                <div class="w-9/12 m-auto ">
                    <div class="flex items-center justify-between pt-10">
                        <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Name</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><%=customer.getName()%></p>
                    </div>
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Contact Number</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><%=customer.getContactNo()%></p>
                    </div>
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Email Address</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><%=customer.getEmail()%></p>
                    </div>
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Shipping Address</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><%=customer.getLine1()%>, <%=customer.getLine2()%>, <%=customer.getCity()%>, <%=customer.getPostcode()%><%=customer.getState()%></p>
                    </div>
                </div>
                <hr class="border-1 border-gray-800 mt-10"> 
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


                <% for (CartLists item : cartList) {%>

                <!--image of product-->
                <div class="col-span-1  w-full">
                    <img src="<%= item.getProductId().getProductPhoto()%>" alt="" class="md:w-4/12 w-full object-center object-cover md:block hidden" />
                </div>

                <div class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center col-span-2">
                    <p class="text-xs leading-3 text-gray-800 dark:text-white md:pt-0 pt-4"><%= item.getProductId().getProductId()%></p>
                    <div class="flex items-center justify-between w-full pt-1">
                        <p class="text-base font-black leading-none text-gray-800 dark:text-white"><%= item.getProductId().getProductName()%></p>
                    </div>

                    <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white">RM <%= item.getProductId().getProductPriceinString()%></p>

                </div>

                <div class="col-span-1">
                    <div class="w-36 flex items-center ">
                        <input readonly class="text-center font-black bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
                               type="number" min="1" name="quantity" value="<%= item.getItemQty()%>">
                    </div>
                </div>


                <!--subtotal price-->

                <div class="col-span-1"> 

                    <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white"><% out.print(String.format("RM %.2f", item.getProductId().getProductPrice() * item.getItemQty())); %> </p>
                </div>          

                <% }%>
                <% if(Double.parseDouble(total)> 180){%>
                <div class="col-span-1  w-full">
                    <img src="/pepegacoJAVAEE6/assets/images/company/promo3.png" alt="" class="md:w-4/12 w-full object-center object-cover md:block hidden"/>
                </div>
                <div class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center col-span-2">
                    <p class="text-xs leading-3 text-gray-800 dark:text-white md:pt-0 pt-4">FREEGIFT</p>
                    <div class="flex items-center justify-between w-full pt-1">
                        <p class="text-base font-black leading-none text-gray-800 dark:text-white">Free gift</p>
                    </div>

                    <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white">RM 0.00</p>

                </div>
                <div class="col-span-1">
                    <div class="w-36 flex items-center ">
                        <input readonly class="text-center font-black bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
                               type="number" min="1" name="quantity" value="1">
                    </div>
                </div>
                <div class="col-span-1"> 

                    <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white">RM 0.00 </p>
                </div> 
                
                <% }%>

                <!--freegift end-->
            </div>
            <hr class="border-1 border-gray-800 mt-10"> 
                <div class="w-9/12 m-auto ">
                    <div class="flex items-center justify-between pt-10">
                        <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Merchandise Subtotal (RM)</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><%=String.format("%.2f", Double.parseDouble(subtotal))%></p>
                    </div>
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Shipping Fee (RM)</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><%=String.format("%.2f", Double.parseDouble(shippingFee))%></p>
                    </div>
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Total Payment (RM)</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><%=String.format("%.2f", Double.parseDouble(total))%></p>
                    </div>
                    <div class="flex flex-col justify-between pt-5 pb-20" x-data="{ payment : 'ca'}">
                        <div class="flex flex-row">
                            <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Payment Method:</p>


                            <input type="radio" name="paymentMethod" value="card" x-model="payment" class="ml-48" required/><span class="ml-3">  Card Payment </span> 
                            <input type="radio" name="paymentMethod" value="cash" x-model="payment" class="ml-10"/><span class="ml-3">  Cash On Delivery</span>

                        </div>
                        <div id="card" x-show="payment == $el.id">
                            <!--<p class="text-base leading-none text-gray-800 dark:text-white font-medium"></p>-->

                            <!--<label class="leading-loose">Select Payment Account</label>-->
                            <div class="flex-row" >
                                <%@ include file = "CardPayment.jsp" %>       
                            </div>
                        </div>
                    </div>
                    <input type="submit" value="Pay Now" class="text-base leading-none w-full py-5 bg-gray-800 border-gray-800 border focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 text-white dark:hover:bg-gray-700"/>

                </div>
        </div>
    </form>
</div>                                       

