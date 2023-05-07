<%-- 
    Document   : OrderListHistory
    Created on : Apr 30, 2023, 12:20:56 AM
    Author     : Vallerie
--%>


<%@page import="java.sql.ResultSet"%>
<% ResultSet orderListHistory = (ResultSet) session.getAttribute("orderListHistory");%>
<% int orderListHistoryCount = Integer.parseInt(session.getAttribute("orderListHistoryCount").toString());%>

<% if (request.isUserInRole("adminRole")) {
       
    }else if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") {
             
       response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");}
    else { }%>
    
    <div class=" h-fit bg-gray-200 w-full rounded-md py-10 p-2">
    <div class="m-8 p-8 bg-white shadow-md rounded-md dark:bg-gray-800">
            <div class="px-3">
                <p class="text-xl font-bold dark:text-white">Order List History</p>
                <hr class="my-4 border-gray-900"/>
            </div>  
        <!-- here -->
        <% String orderIdInit = "";
            for(int i= 0; i <orderListHistoryCount; i++){
            if(orderListHistory.next()){ 
            if(!orderListHistory.getString("order_id").equals(orderIdInit)){
            orderIdInit = orderListHistory.getString("order_id");
    %>
        <div class="flex items-center justify-between pt-10">
            <p class="pl-10 text-base leading-none text-gray-800 dark:text-white font-medium">Order : <%=orderListHistory.getString("order_id")%></p>
                        <p class=" pr-10 text-base leading-none text-gray-800 dark:text-white font-medium">Date: <%=orderListHistory.getString("created_at")%></p>
        </div>
        <%}%>
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
            <div class="col-span-1  w-full">
                    <img src="<%=orderListHistory.getString("product_photo")%>" alt="" class="md:w-4/12 w-full ml-10 object-center object-cover md:block hidden" />
                </div>

                <div class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center col-span-2">
                    <p class="text-xs leading-3 text-gray-800 dark:text-white md:pt-0 pt-4"><%=orderListHistory.getString("product_id")%></p>
                    <div class="flex items-center justify-between w-full pt-1">
                        <p class="text-base font-medium leading-none text-gray-800 dark:text-white"><%=orderListHistory.getString("product_name")%></p>
                    </div>

                    <p class="mr-2 text-base font-medium leading-none text-gray-800 dark:text-white"><%=orderListHistory.getString("product_price")%></p>

                </div>

                <div class="col-span-1">
                    <div class="w-36 flex items-center ">
                        <p class="mr-2 text-base font-medium leading-none text-gray-800 dark:text-white"><%=orderListHistory.getString("order_qty")%></p>

                        
                    </div>
                </div>
            <div class="col-span-1"> 

                    <p class="mr-2 text-base font-medium leading-none text-gray-800 dark:text-white"><%=Double.parseDouble(orderListHistory.getString("product_price")) * Double.parseDouble(orderListHistory.getString("order_qty"))%> </p>
                </div>
                    
            <div class="w-9/12 m-auto ">
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Total Payment (RM)</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white font-medium"><%=orderListHistory.getString("payment_amount")%></p>
                    </div>
                </div>
                  
        </div>
        <% } }%>
                
                <div class="flex items-center justify-between pt-10">
            <p class="pl-10 text-base leading-none text-gray-800 dark:text-white font-medium">Order : OR000002</p>
                        <p class=" pr-10 text-base leading-none text-gray-800 dark:text-white font-medium">Date: CreatedAt(Order)</p>
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
            <div class="col-span-1  w-full">
                    <img src="" alt="" class="md:w-4/12 w-full object-center object-cover md:block hidden" />
                </div>

                <div class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center col-span-2">
                    <p class="text-xs leading-3 text-gray-800 dark:text-white md:pt-0 pt-4">P00001</p>
                    <div class="flex items-center justify-between w-full pt-1">
                        <p class="text-base font-black leading-none text-gray-800 dark:text-white">Almond Butter</p>
                    </div>

                    <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white">RM 199.90</p>

                </div>

                <div class="col-span-1">
                    <div class="w-36 flex items-center ">
                        <input readonly class="text-center font-black bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
                               type="number" min="1" name="quantity" value="4">
                    </div>
                </div>
            <div class="col-span-1"> 

                    <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white">20 </p>
                </div>
        </div>

                
            <hr class="border-1 border-gray-800 mt-10 px-5"> 
                
            
        </div>
</div> 
    