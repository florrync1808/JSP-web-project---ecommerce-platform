<% if (request.isUserInRole("adminRole")) {

    } else if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") {

        response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
    } else {
    }%>
<!--this page can be viewed by admin & staff-->

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>

<%
    List<Products> ProductList = (List) session.getAttribute("productList");
    SimpleDateFormat datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    int countp = 0;
    int counta = 0;
    for (Products product : ProductList) {
        if (product.getProductId().charAt(0) == 'P') {
            countp++;
        } else if (product.getProductId().charAt(0) == 'A') {
            counta++;
        }
    }
%>

<div class="p-8 min-h-screen">
    <div class="px-12">
        <div class="flex flex-row col-span-2">
            <div class="grow">
                <p class="text-xl font-bold">Products List</p>
            </div>
            <div class="grow-0">
                <a href="AddProduct.jsp">
                    <button class="bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded" type="button" onclick="" id="addProduct">Add Product</button>
                </a>
            </div>
        </div>
        <hr class="my-4 border-gray-900"/>
    </div>
    <div class="inline-block min-w-full py-2 align-middle px-12">
        <div class="overflow-x-auto shadow ring-1 ring-black ring-opacity-5 md:rounded-lg shadow-md">
            <table class="divide-y divide-gray-300 min-w-full table-fixed overflow-x-scroll">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">Product ID</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Product Picture</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Product Name</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Product Description</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Price (RM)</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Created At</th>
                        <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                            <span class="sr-only">Actions</span>
                        </th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 bg-white">
                    <!-- Display by ascending order -->
                    <!-- Other -->
                    <% for (Products product : ProductList) {
                            if (product.getProductId().charAt(0) == 'A') {
                    %>
                    <tr>
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900 sm:pl-6"><%= product.getProductId()%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><img src="<%= product.getProductPhoto()%>" alt="" class="w-16 md:w-32 lg:w-48 object-center object-cover md:block hidden" /></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm text-gray-500"><%= product.getProductName()%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= product.getProductDesc()%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= String.format("%.2f", product.getProductPrice())%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= datetime.format(product.getCreatedAt())%></td>
                        <td class="py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                            <div class="inline-block text-left" x-data="{ menu: false }">
                                <button x-on:click="menu = ! menu" type="button" class="flex items-center text-gray-400 hover:text-gray-600 focus:outline-none" id="menu-button" aria-expanded="true" aria-haspopup="true">
                                    <span class="sr-only"></span>
                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                    <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z" />
                                    </svg>
                                </button>
                                <div x-show="menu" x-on:click.away="menu = false" class="origin-top-right absolute right-32 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 divide-y divide-gray-100 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="menu-button" tabindex="-1">
                                    <div class="" role="none">
                                        <a href="#" class="text-gray-500 font-medium hover:text-gray-900 hover:bg-gray-50 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">
                                            Details
                                        </a>
                                    </div>
                                    <div class="" role="none">
                                        <a href="#" class="text-gray-500 font-medium hover:text-gray-900 hover:bg-gray-50 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">
                                            Edit
                                        </a>
                                    </div>
                                    <div class="" role="none">
                                        <a href="#" class="text-gray-500 font-medium hover:text-gray-900 hover:bg-gray-50 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">
                                            Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <% }
                        }%>

                    <!-- Plant -->
                    <% for (Products product : ProductList) {
                            if (product.getProductId().charAt(0) == 'P') {
                    %>
                    <tr>
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900 sm:pl-6"><%= product.getProductId()%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><img src="<%= product.getProductPhoto()%>" alt="" class="w-16 md:w-32 lg:w-48 object-center object-cover md:block hidden" /></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm text-gray-500"><%= product.getProductName()%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= product.getProductDesc()%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= String.format("%.2f", product.getProductPrice())%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= datetime.format(product.getCreatedAt())%></td>
                        <td class="py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                            <div class="inline-block text-left" x-data="{ menu: false }">
                                <button x-on:click="menu = ! menu" type="button" class="flex items-center text-gray-400 hover:text-gray-600 focus:outline-none" id="menu-button" aria-expanded="true" aria-haspopup="true">
                                    <span class="sr-only"></span>
                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                    <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z" />
                                    </svg>
                                </button>
                                <div x-show="menu" x-on:click.away="menu = false" class="origin-top-right absolute right-32 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 divide-y divide-gray-100 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="menu-button" tabindex="-1">
                                    <div class="" role="none">
                                        <a href="#" class="text-gray-500 font-medium hover:text-gray-900 hover:bg-gray-50 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">
                                            Details
                                        </a>
                                    </div>
                                    <div class="" role="none">
                                        <a href="#" class="text-gray-500 font-medium hover:text-gray-900 hover:bg-gray-50 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">
                                            Edit
                                        </a>
                                    </div>
                                    <div class="" role="none">
                                        <a href="#" class="text-gray-500 font-medium hover:text-gray-900 hover:bg-gray-50 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">
                                            Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <% }
                        }%>
                </tbody>
            </table>
        </div>
    </div>
</div>
