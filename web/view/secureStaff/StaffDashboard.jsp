 <% if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") { 
       response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");}
    else { }%>
    <!--this page only viewable by staff-->
<div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">
    <div class="bg-white rounded shadow-lg p-4 px-4 w-full">
        <div class="grid gap-4 gap-y-2 text-sm">
            <div class="text-gray-600">
                <p class="font-medium text-lg text-center">Welcome, <%=request.getAttribute("userName") %></p>
            </div>

            <div>
                <a href="/pepegacoJAVAEE6/view/secureStaff/StaffAccount.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200" tabindex="-1">Account</a>
                <a href="/pepegacoJAVAEE6/view/secureStaff/ManageOrder.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200" tabindex="-1">Manage Order</a>
                <a href="/pepegacoJAVAEE6/view/secureStaff/ProductsList.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200" tabindex="-1">View All Products</a>
                <a href="/pepegacoJAVAEE6/LogoutServlet" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200" tabindex="-1">Log out</a>
            </div>

        </div>
    </div>
</div>
