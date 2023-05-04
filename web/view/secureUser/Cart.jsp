<% if (request.isUserInRole("adminRole")) { 
        response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");
    } 
else if (session.getAttribute("userName") == null) {
response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");}
 }%>

<div class=" h-fit bg-gray-200 w-full rounded-md py-10 col-span-2 p-2">
    <div class="m-8 p-8 bg-white shadow-md rounded-md dark:bg-gray-800">
        <!--section title-->
        <div class="px-3">
            <p class="text-xl font-bold">Cart</p>
            <hr class="my-4 border-gray-900"/>
        </div>    
        <div class="md:flex items-strech py-6 px-2">

            <!--image of product-->
            <div class="md:w-4/12 2xl:w-1/4 w-full">
                <img src="./assets/images/products/Albuca_Concordiana_1.jpeg" alt="" class="h-full object-center object-cover md:block hidden" />
            </div>

            <div class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center">
                <p class="text-xs leading-3 text-gray-800 dark:text-white md:pt-0 pt-4">Product ID</p>
                <div class="flex items-center justify-between w-full pt-1">
                    <p class="text-base font-black leading-none text-gray-800 dark:text-white">Product Name</p>
                    <select aria-label="Select quantity" class=" mx-2 py-1 px-1 border rounded-md border-gray-200 focus:outline-none dark:bg-gray-800 dark:hover:bg-gray-700 dark:text-white">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </div>
                <p class="text-xs leading-3 text-gray-600 dark:text-white pt-2">Description</p>
                <div class="flex items-center justify-between pt-5">
                    <div class="flex itemms-center">
                        <p class="text-xs leading-3 underline text-red-500 pl-2 cursor-pointer">Remove</p>
                    </div>
                    <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white">RM9,000</p>
                </div>
            </div>
        </div>

        <!--order summary-->
        <div class=" w-full bg-gray-100 dark:bg-gray-900 h-full">
            <div class="flex flex-col lg:h-screen h-auto lg:px-8 md:px-7 px-4 lg:py-20 md:py-10 py-6 justify-between overflow-y-auto">
                <div>
                    <p class="text-xl font-black  text-gray-800 dark:text-white">Summary</p>
                    <div class="flex items-center justify-between pt-16">
                        <p class="text-base leading-none text-gray-800 dark:text-white">Subtotal</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white">RM 99</p>
                    </div>
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white">Shipping</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white">RM25</p>
                    </div>
                    <div class="flex items-center justify-between pt-5">
                        <p class="text-base leading-none text-gray-800 dark:text-white">GST 6%</p>
                        <p class="text-base leading-none text-gray-800 dark:text-white">RM35</p>
                    </div>
                </div>
                <div>
                    <div class="flex items-center pb-6 justify-between lg:pt-5 pt-20">
                        <p class="text-2xl leading-normal text-gray-800 dark:text-white">Total</p>
                        <p class="text-2xl font-bold leading-normal text-right text-gray-800 dark:text-white">RM10,240</p>
                    </div>
                    <button onclick="checkoutHandler1(true)" class="text-base leading-none w-full py-5 bg-gray-800 border-gray-800 border focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 text-white dark:hover:bg-gray-700">Checkout</button>
                </div>
            </div>
        </div>
    </div>
</div>

