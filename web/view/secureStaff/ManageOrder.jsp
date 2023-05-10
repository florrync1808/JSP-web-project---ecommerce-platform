<% if (request.isUserInRole("adminRole")) {
    } else if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") {
        response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
    } else {
    }%>

<%@page import="java.util.List"%>
<%@page import="model.OrderStatuses"%>

<% List<OrderStatuses> osList = (List) session.getAttribute("OrderStatList");%>

<!--this page can be viewed by admin & staff-->
<div class="p-8 min-h-screen bg-gray-100">
    <div class="inline-block min-w-full py-2 align-middle">
        <div class="px-12">
            <div class="flex flex-row col-span-2">
                <div class="grow">
                    <p class="text-xl font-bold">Manage Orders</p>
                </div>
            </div>
            <hr class="my-4 border-gray-900"/>
        </div>

        <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg shadow-md">
            <table class="min-w-full divide-y divide-gray-300">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">#</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Status ID</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Order ID</th>
                        <th colspan="3" scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Description</th>
                        <th scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Created At</th>
                        <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                            <span class="sr-only">Actions</span>
                        </th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 bg-white">
                    <% int rowCount = 0; %>
                    <% for (OrderStatuses oStatus : osList) {
                            if (!oStatus.getDescription().equals("delivered")) {
                                rowCount++;%>
                    <tr>
                        <!-- loop through staff-info database, now show one row only -->
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900 sm:pl-6"><%= rowCount%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= oStatus.getStatusId()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= oStatus.getOrderId()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-sm text-gray-500"><%= oStatus.getDescription()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">here</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm">here</td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-sm text-gray-500">here</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm"><%= oStatus.getCreatedAt()%></td>
                    </tr>
                    <%      }
                        }%>
                </tbody>
            </table>
        </div>
    </div>
</div>