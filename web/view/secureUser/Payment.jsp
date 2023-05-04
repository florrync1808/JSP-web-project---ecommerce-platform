<%-- 
    Document   : Payment
    Created on : Apr 30, 2023, 12:20:56 AM
    Author     : End User
--%>

<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Customers customer = (Customers) session.getAttribute("customer");%>

<% if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "userRole") {
        response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");
    } else {
    }%>
<form method="post" action="AddPayment">

    <div class="min-h-screen bg-gray-100 py-6 flex flex-col justify-center sm:py-12">
        <div class="relative py-3 max-w-3xl sm:w-3/5 sm:mx-auto">
            <div class="relative  px-4 py-10 bg-white mx-8 md:mx-0 shadow rounded-3xl sm:m-10">
                <div class="max-w-md mx-auto">
                    <div class="flex items-center space-x-5">
                        <div class="h-14 w-14 bg-yellow-200 rounded-full flex flex-shrink-0 justify-center items-center text-yellow-500 text-2xl font-mono"><svg width="500px" height="500px" viewBox="-0.5 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M8.96991 12.89C10.6599 12.89 12.0299 11.5558 12.0299 9.91C12.0299 8.2642 10.6599 6.93 8.96991 6.93C7.27992 6.93 5.90991 8.2642 5.90991 9.91C5.90991 11.5558 7.27992 12.89 8.96991 12.89Z" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M12.93 13.1C14.37 14.18 15.32 15.84 15.42 17.72C15.43 17.91 15.27 18.07 15.08 18.07H2.84996C2.64996 18.07 2.48996 17.91 2.49996 17.72C2.60996 15.84 3.55997 14.18 5.00997 13.1" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M11.03 12.11H11.02" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M17.1299 14.56C18.2787 14.56 19.2099 13.6556 19.2099 12.54C19.2099 11.4244 18.2787 10.52 17.1299 10.52C15.9812 10.52 15.0499 11.4244 15.0499 12.54C15.0499 13.6556 15.9812 14.56 17.1299 14.56Z" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M20.3 15.13C20.99 15.84 21.44 16.79 21.5 17.83C21.51 17.97 21.4 18.07 21.26 18.07H17.38" stroke="#FFFFFF" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg></div>
                        <div class="block pl-2 font-semibold text-xl self-start text-gray-700">
                            <h2 class="leading-relaxed">Buyer Details</h2>
                        </div>
                    </div>
                    <div class="divide-y divide-gray-200">
                        <div class="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7">

                            <div class="flex flex-col">
                                <label class="leading-loose">Name</label>
                                <input type="text" readonly class="px-4 py-2 border focus:ring-gray-500 focus:border-gray-900 w-full sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%=customer.getName()%>">
                            </div>
                            <div class="flex flex-col">
                                <label class="leading-loose">Contact Number</label>
                                <input type="text" readonly class="px-4 py-2 border focus:ring-gray-500 focus:border-gray-900 w-full sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%=customer.getContactNo()%>">
                            </div>
                            <div class="flex flex-col">
                                <label class="leading-loose">Email Address</label>
                                <input type="text" readonly class="px-4 py-2 border focus:ring-gray-500 focus:border-gray-900 w-full sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%=customer.getEmail()%>">
                            </div>
                            <div class="flex flex-col">
                                <label class="leading-loose">Shipping Address</label>
                                <input type="text" readonly class="px-4 py-2 border focus:ring-gray-500 focus:border-gray-900 w-full sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600">
                                    <div class="grid place-items-end">
                                        <a class="leading-loose text-blue-600 underline text-base pr-2" href="">Change Address</a>
                                    </div>
                            </div>


                        </div>
                        <div class="pt-4 flex items-center space-x-4">

                        </div>
                    </div>
                </div>
                <div class="max-w-md mx-auto">

                    <div class="divide-y divide-gray-200">
                        <div class="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7">

                            <div class="flex flex-col">
                                <label class="leading-loose">Merchandise Subtotal</label>
                                <input type="text" readonly class="px-4 py-2 border focus:ring-gray-500 focus:border-gray-900 w-full sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600">
                            </div>
                            <div class="flex flex-col">
                                <label class="leading-loose">Shipping Fee</label>
                                <input type="text" readonly class="px-4 py-2 border focus:ring-gray-500 focus:border-gray-900 w-full sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600">
                            </div>
                            <div class="flex flex-col">
                                <label class="leading-loose">Total Payment</label>
                                <input type="text" readonly class="px-4 py-2 border focus:ring-gray-500 focus:border-gray-900 w-full sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="flex justify-center">


                    <div class="max-w-md mx-auto"  x-data="{ payment: 'cash'}">
                        <label class="leading-loose pr-5">Payment Method: </label>


                        <input type="radio" name="paymentMethod" value="card" x-model="payment"/>  Card Payment  
                        <input type="radio" name="paymentMethod" value="cash" x-model="payment"/>  Cash On Delivery

                        <div class="flex-row" id="card" x-show="payment == $el.id">

                            <label class="leading-loose">Select Payment Account</label>
                            <div class="mt-8 mb-10">
                                <!--CardProfile=%> -->
                                <span class="mt-16 px-4 py-2 rounded mt-5 border-2 border-gray-600">card 1</span>
                                <span class="mt-16 px-4 py-2 rounded mt-5 border-2 border-gray-600">card 1</span>
                                <span class="mt-16 px-4 py-2 rounded mt-5 border-2 border-gray-600">card 1</span>
                                
                            </div>
                            <div class="" x-data="{ open: false }">
                                <div>
                                <span class="mt-12 px-4 py-2 rounded mt-5 border-2 border-gray-600" @click="open = ! open">+ Add Payment</span>
                                </div>
                                <div x-show="open" >

                                    <%@ include file = "CardPayment.jsp" %>       
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="flex justify-center">
                    <input type="submit" value="Pay Now"
                           class="mt-5 px-4 py-3 rounded-full bg-blue-300 text-blue-900 focus:ring focus:outline-none w-5/6 text-xl font-semibold transition-colors"/>

                </div>

            </div>
        </div>
    </div>
</form>

