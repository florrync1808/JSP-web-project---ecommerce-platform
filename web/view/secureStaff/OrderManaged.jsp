 <% if (request.isUserInRole("adminRole")) {
       
    }else if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") {
             
       response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");}
    else { }%>
    
    <div class=" h-fit bg-gray-200 w-full rounded-md py-10 p-2">
    <div class="m-8 p-8 bg-white shadow-md rounded-md dark:bg-gray-800">
            <div class="px-3">
                <p class="text-xl font-bold dark:text-white">Order Managed History</p>
                <hr class="my-4 border-gray-900"/>
            </div>  
        <div class="flex items-center justify-between pt-10">
            <p class="text-base leading-none text-gray-800 dark:text-white font-medium">Order : OR000001</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white">Date: CreatedAt(Order)</p>
        </div>
            
            <hr class="border-1 border-gray-800 mt-10 px-5"> 
                
            
        </div>
</div> 
    