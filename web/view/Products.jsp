<%@page import="java.util.List"%>
<%@page import="model.Products"%>

<%
    List<Products> ProductList = (List) session.getAttribute("ProductList");
%>

<div class="p-8 min-h-screen ">

    <% if (session.getAttribute("addCartMessage") != null) { %>
    <div x-data="{ show:true }" x-show="show" x-init="setTimeout(() => show = false, 1500)" class="absolute flex w-1/2 items-center rounded-md bg-blue-500 text-white text-sm font-bold px-4 py-3 my-4 right-12 z-40" role="alert">
        <svg class="fill-current w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M12.432 0c1.34 0 2.01.912 2.01 1.957 0 1.305-1.164 2.512-2.679 2.512-1.269 0-2.009-.75-1.974-1.99C9.789 1.436 10.67 0 12.432 0zM8.309 20c-1.058 0-1.833-.652-1.093-3.524l1.214-5.092c.211-.814.246-1.141 0-1.141-.317 0-1.689.562-2.502 1.117l-.528-.88c2.572-2.186 5.531-3.467 6.801-3.467 1.057 0 1.233 1.273.705 3.23l-1.391 5.352c-.246.945-.141 1.271.106 1.271.317 0 1.357-.392 2.379-1.207l.6.814C12.098 19.02 9.365 20 8.309 20z"/></svg>
        <p><%= session.getAttribute("addCartMessage") %></p>
    </div>
    <% } %>

    <!--prod section-->
    <div class=" h-fit bg-gray-200 w-full rounded-md py-10">

        <!-- Plants Categories -->
        <div class="px-12">
            <p class="text-xl font-bold">Products</p>
            <hr class="my-4 border-gray-900"/>
        </div>
        <!--card container-->
        <div class="px-12 grid grid-cols-3 gap-4 p-4">
            <!--product card --> 
            <% for (Products item : ProductList) {
                    if (!item.getProductId().equalsIgnoreCase("FREEGIFT")) {
            %>
            <div class="bg-white shadow-md rounded-md w-42 h-fit flex flex-col items-strech py-4 px-2 col-span-1 dark:bg-gray-900">
                <div class="md:flex items-strech py-4 lg:py-8">
                    <!--image of product-->
                    <div class="md:w-4/12 w-full">
                        <img src="<%= item.getProductPhoto()%>" alt="" class="h-full object-center object-cover md:block hidden" />
                    </div>
                    <div class="md:pl-3 md:w-8/12 2xl:w-3/4 flex flex-col justify-center">
                        <p class="text-xs leading-3 text-gray-800 dark:text-white md:pt-0 pt-4"><%= item.getProductId()%></p>
                        <div class="flex items-center justify-between w-full pt-1">
                            <p class="text-base font-black leading-none text-gray-800 dark:text-white"><%= item.getProductName()%></p>
                        </div>
                        <p class="text-xs leading-3 text-gray-600 dark:text-white pt-2"><%= item.getProductDesc()%></p>
                        <div class="flex items-center justify-between pt-5">
                            <p class="mr-2 text-base font-black leading-none text-gray-800 dark:text-white"> RM <%= String.format("%.2f", item.getProductPrice()) %> </p>
                            <div class="flex itemms-center">
                                <% if (request.isUserInRole("adminRole")) {
                                    } else if (session.getAttribute("userName") == null || session.getAttribute("userRole").equals("userRole")) {%>
                                <a href="/pepegacoJAVAEE6/AddToCartServlet?productId=<%=item.getProductId()%>">
                                    <button class="bg-gray-700 mr-5 text-white px-1 py-0 rounded-sm shadow-md duration-300 hover:-translate-y-1 hover:shadow-lg" >&#10010</button>
                                </a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            <% }
                }
            %>
        </div>
    </div>
</div>
<% session.setAttribute("addCartMessage", null); %>
