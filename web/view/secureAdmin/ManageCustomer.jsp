
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Customers"%>

<% if (request.isUserInRole("adminRole")) {

    } else if (session.getAttribute("userName") == null || session.getAttribute("userRole") == "staffRole") {

        response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
    } else {
    }%>
<!--this page can be viewed by admin & staff-->

<!-- EDIT CONFIRM MSG -->
<!-- display updated customer details successfully msg -->
<% if (session.getAttribute("EditConfirmMsg") != null) {%>
<div x-data="{ show:true }" x-show="show" x-init="setTimeout(() => show = false, 1500)" class="absolute flex w-1/2 items-center rounded-md bg-blue-500 text-white text-sm font-bold px-4 py-3 my-4 right-12 z-40" role="alert">
    <svg class="fill-current w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M12.432 0c1.34 0 2.01.912 2.01 1.957 0 1.305-1.164 2.512-2.679 2.512-1.269 0-2.009-.75-1.974-1.99C9.789 1.436 10.67 0 12.432 0zM8.309 20c-1.058 0-1.833-.652-1.093-3.524l1.214-5.092c.211-.814.246-1.141 0-1.141-.317 0-1.689.562-2.502 1.117l-.528-.88c2.572-2.186 5.531-3.467 6.801-3.467 1.057 0 1.233 1.273.705 3.23l-1.391 5.352c-.246.945-.141 1.271.106 1.271.317 0 1.357-.392 2.379-1.207l.6.814C12.098 19.02 9.365 20 8.309 20z"/></svg>
    <p><%= session.getAttribute("EditConfirmMsg")%></p>
</div>
<!-- set the attribute to null -->
<% session.setAttribute("EditConfirmMsg", null);
    } %>
    
<!-- DELETE CONFIRM MSG -->
<!-- display delete customer successfully msg -->
<% if (session.getAttribute("DeleteConfirmMsg") != null) {%>
<div x-data="{ show:true }" x-show="show" x-init="setTimeout(() => show = false, 1500)" class="absolute flex w-1/2 items-center rounded-md bg-blue-500 text-white text-sm font-bold px-4 py-3 my-4 right-12 z-40" role="alert">
    <svg class="fill-current w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M12.432 0c1.34 0 2.01.912 2.01 1.957 0 1.305-1.164 2.512-2.679 2.512-1.269 0-2.009-.75-1.974-1.99C9.789 1.436 10.67 0 12.432 0zM8.309 20c-1.058 0-1.833-.652-1.093-3.524l1.214-5.092c.211-.814.246-1.141 0-1.141-.317 0-1.689.562-2.502 1.117l-.528-.88c2.572-2.186 5.531-3.467 6.801-3.467 1.057 0 1.233 1.273.705 3.23l-1.391 5.352c-.246.945-.141 1.271.106 1.271.317 0 1.357-.392 2.379-1.207l.6.814C12.098 19.02 9.365 20 8.309 20z"/></svg>
    <p><%= session.getAttribute("DeleteConfirmMsg")%></p>
</div>
<!-- set the attribute to null -->
<% session.setAttribute("DeleteConfirmMsg", null);
    } %>

<%
    List<Customers> custList = (List) session.getAttribute("CustomerList");
    SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat dateformat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>


<!-- Display customer list -->
<div class="p-8 min-h-screen">
    <div class="px-12">
        <div class="flex flex-row col-span-2">
            <div class="grow">
                <p class="text-xl font-bold">Customers List</p>
            </div>
        </div>
        <hr class="my-4 border-gray-900"/>
    </div>
    <div class="inline-block min-w-full py-2 align-middle px-12">
        <div class="overflow-x-auto shadow ring-1 ring-black ring-opacity-5 md:rounded-lg shadow-md">
            <table class="divide-y divide-gray-300 min-w-full table-auto overflow-y-scroll">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">Customer ID</th>
                        <th scope="col" width="10px" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Name</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Birthdate</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Email</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Contact No.</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Customer Register At</th>
                        <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                            <span class="sr-only">Actions</span>
                        </th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 bg-white">
                    <!-- Display All customers Details -->
                    <% for (Customers cust : custList) {
                    %>
                    <tr>
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900 sm:pl-6"><%= cust.getCustomerId() %></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm text-gray-500"><%= cust.getName()%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= dateformat1.format(cust.getBirthdate())%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= cust.getEmail()%></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= cust.getContactNo() %></td>
                        <td class="whitespace-nowrap px-3 py-4 pl-4 text-sm"><%= dateformat2.format(cust.getCreatedAt())%></td>
                        
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
                                        <a href="/pepegacoJAVAEE6/view/secureAdmin/EditCustomer.jsp?customerId=<%=cust.getCustomerId()%>" class="text-gray-500 font-medium hover:text-gray-900 hover:bg-gray-50 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">
                                            Edit
                                        </a>
                                    </div>
                                    <div class="" role="none">
                                        <a href="/pepegacoJAVAEE6/view/secureAdmin/DeleteCustomer.jsp?customerId=<%=cust.getCustomerId()%>" class="text-gray-500 font-medium hover:text-gray-900 hover:bg-gray-50 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">
                                            Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <% }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
