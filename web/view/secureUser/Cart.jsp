<%  if (request.isUserInRole("adminRole") || session.getAttribute("staffId") != null) {
        response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");
    } else if (session.getAttribute("customerId") == null) {
        response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
    } else {
    };%>

<%@page import="java.util.List"%>
<%@page import="model.CartLists"%>
<%@page import="model.Products"%>

<%
    List<CartLists> cartList = (List) session.getAttribute("CartLists");
    List<Products> ProductList = (List) session.getAttribute("ProductList");
%>

<div class=" h-fit bg-gray-200 w-full rounded-md py-10 p-2">
<form method="POST" action="/pepegacoJAVAEE6/MakePayment">
    <div class="m-8 p-8 bg-white shadow-md rounded-md dark:bg-gray-800">
        <!--section title-->
        <div class="px-3">
            <p class="text-xl font-bold dark:text-white">Cart</p>
            <hr class="my-4 border-gray-900"/>
        </div>    

        <!--each cart item-->
        <div class="grid grid-cols-5 gap-y-12 p-8">
            <div class="col-span-3"> 
                <p class="text-base font-black leading-none text-gray-800 dark:text-white text-center underline">Products </p>
            </div> 
            <div class="col-span-1"> 
                <p class="text-base font-black leading-none text-gray-800 dark:text-white  underline">Quantity </p>
            </div> 
            <div class="col-span-1"> 
                <p class="text-base font-black leading-none text-gray-800 dark:text-white  underline">Subtotal Price </p>
            </div> 

            <% double sum = 0.00, shipping = 25.00, free=0.00; %>
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

                <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white">RM <%= item.getProductId().getProductPrice() %></p>
                <div class="flex items-center justify-between pt-5">
                   
                        <div class="flex itemms-center">
                            <a href="/pepegacoJAVAEE6/RemoveCartListServlet?productId=<%= item.getId()%>"  class="text-xs leading-3 underline text-red-500 pl-2 cursor-pointer">Remove</a>
                        </div>
             
                </div>
            </div>

            <div class="col-span-1">
                <form method="POST" action="/pepegacoJAVAEE6/UpdateCartServlet">
                    <div class="w-36 flex items-center border-b border-gray-600 py-2">
                        <input class="bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
                               type="number" min="1" name="quantity" value="<%= item.getItemQty()%>">
                        <input type="hidden" name="productId" value="<%= item.getProductId().getProductId()%>"/>
                        <button type="submit" class="flex-shrink-0 bg-gray-600 hover:bg-teal-500 hover:border-teal-500 text-sm text-white py-1 px-2 rounded">
                            Change
                        </button>
                    </div>
                </form>
            </div>
                        

            <!--subtotal price-->
            
            <div class="col-span-1"> 

                <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white"><% out.print(String.format("RM %.2f",item.getProductId().getProductPrice() * item.getItemQty())); %> </p>
            </div>          
            <%  sum += item.getProductId().getProductPrice() * item.getItemQty(); %>
            <% }%>
        </div>
        <!--order summary-->
        <div class=" w-full bg-gray-100 dark:bg-gray-900 h-full">
            <div class="flex flex-col lg:h-screen h-auto lg:px-8 md:px-7 px-4 lg:py-20 md:py-10 py-6 justify-between overflow-y-auto">
                <div>
                    <p class="text-xl font-black  text-gray-800 dark:text-white">Summary</p>
                    <div class="flex items-center justify-between pt-16">
                        <p class="text-base leading-none text-gray-800 dark:text-white">Subtotal</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><% out.print(String.format("RM %.2f",sum)); %></p>
                    </div>
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white">Shipping</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><% if(sum >= 200.00){ out.print( String.format("RM %.2f",free));
                            }else{  out.print( String.format("RM %.2f",shipping)); } %></p>
                    </div>
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white">GST 6%</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white"><% out.print(String.format("RM %.2f",sum* 0.06)); %></p>
                    </div>
                </div>
                <div>
                    <div class="flex items-center pb-6 justify-between lg:pt-5 pt-20">
                        <p class="text-2xl leading-normal text-gray-800 dark:text-white">Total</p>
                        <p class="text-2xl font-bold leading-normal text-right text-gray-800 dark:text-white"><% if(sum >= 200.00){ out.print( String.format("RM %.2f",sum*1.06));
                            }else{  out.print( String.format("RM %.2f",sum*1.06+shipping)); } %></p>
                    </div>
                    <div>
                            
                            <input type="hidden" name="subtotalfromCart" value="<%= sum %>"/>
                            <input type="hidden" name="totalfromCart" value="<%= sum*1.06+shipping %>"/>
                        </div>
                    <button onclick="checkoutHandler1(true)" class="text-base leading-none w-full py-5 bg-gray-800 border-gray-800 border focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 text-white dark:hover:bg-gray-700">Checkout</button>
                </div>
            </div>
        </div>
    </div>
</form>
</div>

