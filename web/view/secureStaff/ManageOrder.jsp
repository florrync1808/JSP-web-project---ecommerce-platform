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
            <form ></form>
            <table class="min-w-full divide-y divide-gray-300">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">#</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Status ID</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Order ID</th>
                        <th scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Description</th>
                        <th scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Created At</th>
                        <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                            <span class="sr-only">Actions</span>
                        </th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 bg-white">
                    <% int rowCount = 0;
                        for (OrderStatuses oStatus : osList) {
                            rowCount++;%>
                    <tr>
                <input type="hidden" id="staId" value="<%= oStatus.getStatusId()%>">
                <!-- loop through staff-info database -->
                <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900 sm:pl-6"><%= rowCount%></td>
                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= oStatus.getStatusId()%></td>
                <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= oStatus.getOrderId()%></td>
                <td class="whitespace-nowrap px-3 py-4 text-center text-sm text-gray-500"><%= oStatus.getDescription()%></td>

                <td class="whitespace-nowrap px-3 py-4 text-sm text-blue-950">
                    <label for="packaging" class="orderStatLabel">
                        <input type="radio" name="OStatus" id="packaging" class="orderStat" value="packaging">
                        Packaging
                    </label>
                    <label for="shipping" class="orderStatLabel">
                        <input type="radio" name="OStatus" id="shipping" class="orderStat" value="shipping">
                        Shipping
                    </label>
                    <label for="delivered" class="orderStatLabel">
                        <input type="radio" name="OStatus" id="delivered" class="orderStat" value="delivered">
                        Delivered
                    </label>
                </td>
                <td class="whitespace-nowrap px-3 py-4 text-sm">
                    <a href="/pepegacoJAVAEE6/ManageOrderServlet?statusId=<%= oStatus.getStatusId()%>&OStatus=" class="text-gray-500 font-medium hover:text-gray-900 hover:bg-gray-50 block px-4 py-2 text-sm" id="showChange">
                        Update<br>Status
                    </a>
                </td>
                <td class="whitespace-nowrap px-3 py-4 text-sm"><%= oStatus.getCreatedAt()%></td>
                </tr>
                <%  }%>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    window.onload = function () {
        [].forEach.call(document.querySelectorAll(".orderStat"), function (el) {
            el.addEventListener("click", function () {
                [].forEach.call(document.querySelectorAll(".orderStatLabel"), function (label) {
                    label.style.color = "gray";
                });

                document.querySelector("label[for='" + this.id + "']").style.color = "blue";
            });
        });
    }

    document.getElementById("showChange").onclick = function () {
        document.getElementById("showChange").href
                = "/pepegacoJAVAEE6/ManageOrderServlet?statusId=" + document.getElementById("staId").value
                + "&OStatus=" + document.
    }
</script>