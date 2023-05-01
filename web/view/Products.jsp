
<div class="p-8 min-h-screen ">
    <div class="grid grid-cols-4 md:grid-cols-6 gap-4">

        <!--prod section-->
        <div class=" h-fit bg-gray-200 w-full rounded-md py-10 col-span-2 md:col-span-4">
            <!--Plant section-->  
            <!--section title-->
            <div class="px-12">
                <p class="text-xl font-bold">Plants</p>
                <hr class="my-4 border-gray-900"/>
            </div>

            <!--card container-->
            <div class="grid grid-cols-2 gap-4 p-4">

                <!--product card --> 
                <div class="bg-white shadow-md rounded-md w-42 h-fit flex flex-col items-strech py-4 px-2 col-span-1">
                    <div class="md:flex items-strech py-4 lg:py-8">
                        <!--image of product-->
                        <div class="md:w-4/12 w-full">
                            <img src="./assets/images/products/Albuca_Concordiana_1.jpeg" alt="" class="h-full object-center object-cover md:block hidden" />
                        </div>
                        <div class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center">
                            <p class="text-xs leading-3 text-gray-800 dark:text-white md:pt-0 pt-4">Product ID</p>
                            <div class="flex items-center justify-between w-full pt-1">
                                <p class="text-base font-black leading-none text-gray-800 dark:text-white">Product Name</p>
                            </div>
                            <p class="text-xs leading-3 text-gray-600 dark:text-white pt-2">Description</p>
                            <div class="flex items-center justify-between pt-5">
                                <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white">RM9,000</p>
                                <div class="flex itemms-center">
                                    <button class="bg-gray-700 mr-5 text-white px-1 py-0 rounded-sm shadow-md duration-300 hover:-translate-y-1 hover:shadow-lg" >&#10010</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  


            </div>


            <!--Pots section-->  
            <!--section title-->
            <div class="px-12">
                <p class="text-xl font-bold">Others</p>
                <hr class="my-4 border-gray-900"/>
            </div>                    

            <!--card container-->
            <div class="grid grid-cols-2 gap-4 p-4">

                <!--product card --> 
                <div class="bg-white shadow-md rounded-md w-42 h-fit flex flex-col items-strech py-4 px-2 col-span-1">
                    <div class="md:flex items-strech py-4 lg:py-8">
                        <!--image of product-->
                        <div class="md:w-4/12 w-full">
                            <img src="./assets/images/products/Soil.jpeg" alt="" class="h-full object-center object-cover md:block hidden" />
                        </div>
                        <div class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center">
                            <p class="text-xs leading-3 text-gray-800 dark:text-white md:pt-0 pt-4">Product ID</p>
                            <div class="flex items-center justify-between w-full pt-1">
                                <p class="text-base font-black leading-none text-gray-800 dark:text-white">Product Name</p>
                            </div>
                            <p class="text-xs leading-3 text-gray-600 dark:text-white pt-2">Description</p>
                            <div class="flex items-center justify-between pt-5">
                                <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white">RM9,000</p>
                                <div class="flex itemms-center">
                                    <button class="bg-gray-700 mr-5 text-white px-1 py-0 rounded-sm shadow-md duration-300 hover:-translate-y-1 hover:shadow-lg" >&#10010</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  

            </div>

        </div>


        <!--cart section-->
        <%@ include file = "components/Cart.jsp" %>
    </div>
</div>
