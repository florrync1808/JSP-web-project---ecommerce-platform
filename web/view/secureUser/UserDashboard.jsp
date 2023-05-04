 <% if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "userRole") { 
       response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");}
    else { }%>
    <!--this page only viewable by user-->

<div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">
    <div class="bg-white rounded shadow-lg p-4 px-4 w-full">
        <div class="grid gap-4 gap-y-2 text-sm">
            <div class="text-gray-600">
                <p class="font-medium text-lg text-center">Welcome, <%=session.getAttribute("userName") %></p>
            </div>

            <div>
                <a href="/pepegacoJAVAEE6/view/Products.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200 ">Shop Online</a>
                <a href="/pepegacoJAVAEE6/view/secureUser/UserAccount.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200 ">Account</a>
                <a href="/pepegacoJAVAEE6/view/secureUser/OrderHistory.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200 ">Order History</a>
                <a href="/pepegacoJAVAEE6/LogoutServlet" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200 " tabindex="-1">Log out</a>
                <a href="/pepegacoJAVAEE6/MakePayment" class="mt-12 px-4 py-2 bg-gray-600 rounded">Check Out</a>

            </div>

        </div>
    </div>
</div>
