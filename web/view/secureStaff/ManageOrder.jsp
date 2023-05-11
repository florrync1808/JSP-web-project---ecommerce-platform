<%
    if (session.getAttribute("userName") == null || session.getAttribute("userRole") == "userRole") {
        response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");
    }
%>

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
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-center text-sm font-semibold text-gray-900">Status ID</th>
                        <th scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Order ID</th>
                        <th scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Created At</th>
                        <th scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Description</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 bg-white">
                    <% int rowCount = 0;%>
                    <% for (OrderStatuses oStatus : osList) {%>
                    <% rowCount++;%>
                    <tr>
                        <!-- loop through staff-info database -->
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900 sm:pl-6"><%= rowCount%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-gray-500"><%= oStatus.getStatusId()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-gray-500"><%= oStatus.getOrderId().getOrderId()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-gray-500"><%= oStatus.getCreatedAt()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-gray-500"><%= oStatus.getDescription()%></td>

                        <td class="whitespace-nowrap px-3 py-4 text-sm text-blue-950">
                            <form action="/pepegacoJAVAEE6/ManageOrderServlet">
                                <input type="hidden" name="statusId" value="<%= oStatus.getStatusId()%>">
                                <input type="hidden" name="orderId" value="<%= oStatus.getOrderId()%>">
                                <label for="packaging<%= oStatus.getStatusId()%>" class="orderStatLabel">
                                    <input type="radio" name="OStatus_<%= oStatus.getStatusId()%>" id="packaging<%= rowCount%>" value="packaging" onchange="changeTextColor('packaging<%= oStatus.getStatusId()%>')">
                                    Packaging
                                </label>
                                <label for="shipping<%= oStatus.getStatusId()%>" class="orderStatLabel">
                                    <input type="radio" name="OStatus_<%= oStatus.getStatusId()%>" id="shipping<%= rowCount%>" value="shipping" onchange="changeTextColor('shipping<%= oStatus.getStatusId()%>')">
                                    Shipping
                                </label>
                                <label for="delivered<%= oStatus.getStatusId()%>" class="orderStatLabel">
                                    <input type="radio" name="OStatus_<%= oStatus.getStatusId()%>" id="delivered<%= rowCount%>" value="delivered" onchange="changeTextColor('delivered<%= oStatus.getStatusId()%>')">
                                    Delivered
                                </label>
                                <div class="inline-flex items-end">
                                    <button class="bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded" type="button" id="editStaff">
                                        <input type="submit" value="Update Status">
                                    </button>
                                </div>
                            </form>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!--<script>
    function changeTextColor(elementId) {
        const selectedRadio = document.getElementById(elementId);
        const labels = document.getElementsByTagName('label');

        // Reset font color and weight for all labels
        for (let i = 0; i < labels.length; i++) {
            labels[i].style.color = 'black';
            labels[i].style.fontWeight = 'normal';
        }

        // Change font color and weight for the selected radio button's label
        if (selectedRadio.checked) {
            const selectedLabel = document.querySelector(`label[for=${elementId}]`);
            selectedLabel.style.color = '#172554';
            selectedLabel.style.fontWeight = 'bold';
        }
    }
</script>-->
