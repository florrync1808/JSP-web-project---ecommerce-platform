
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "components/Header.jsp" %>
    <body>
        <%@ include file = "components/TopNavBar.jsp" %>
        <div class="p-8 min-h-screen">
            <!--Plant section-->         
            <div class=" h-fit bg-gray-200 w-full rounded-md py-10">
                
                <!--section title-->
                <div class="px-12">
                    <p class="text-xl font-bold">Plants</p>
                    <hr class="my-4 border-gray-900"/>
                </div>

                <!--card container-->
                <div class="grid grid-cols-4 gap-4">
                    
                    <!--product card --> 
                    <div class="bg-white shadow-md w-42 h-52 m-3 py-3 px-1 rounded-3xl flex flex-col justify-around items-center overflow-hidden">
                        <img class="h-1/2 w-full sm:h-full sm:w-1/2 object-cover" 
                                 src="./assets/images/products/Albuca_Concordiana_1.jpeg" alt="insert product name here"/>
                        <div class="flex-1 w-full flex flex-col items-baseline justify-around  h-1/2  px-6 sm:h-full sm:items-baseline">
                            <div class="flex flex-col justify-start items-baseline break-all">
                                 <p class="text-sm font-bold mb-0 text-gray-600 font-sans pr-3">Albuca Concordiana</p>
                            </div>
                            
                            <div>
                                <p class="text-xs text-gray-500">Green & cute </p>
                            </div>

                            <div class="w-full flex justify-between items-center pt-3">
                                <p class="font-bold text-sm text-gray-500">RM99.00</p>
                                <button class="bg-gray-700 mr-5 text-white px-1 py-0 rounded-sm shadow-md duration-300 hover:-translate-y-1 hover:shadow-lg" >&#10010</button>
                            </div>
                        </div>
                    </div>   

                </div> 
            </div>

        </div>
    </body>
    <%@ include file = "components/Footer.jsp" %>
</html>
