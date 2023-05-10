<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Staffs"%>
<%@page import="controller.UserLoginServlet"%>

<% if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") {
        response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
    } else {
    }%>
<!--this page only viewable by staff-->

<!-- UPDATE SUCCESS MSG -->
<% if (session.getAttribute("EditStaffConfirmationMsg") != null) {%>
<div x-data="{ show:true }" x-show="show" x-init="setTimeout(() => show = false, 1500)" 
     class="absolute flex w-1/2 items-center rounded-md bg-blue-500 text-white text-sm font-bold px-4 py-3 my-4 right-12 z-40" role="alert">
    <svg class="fill-current w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M12.432 0c1.34 0 2.01.912 2.01 1.957 0 1.305-1.164 2.512-2.679 2.512-1.269 0-2.009-.75-1.974-1.99C9.789 1.436 10.67 0 12.432 0zM8.309 20c-1.058 0-1.833-.652-1.093-3.524l1.214-5.092c.211-.814.246-1.141 0-1.141-.317 0-1.689.562-2.502 1.117l-.528-.88c2.572-2.186 5.531-3.467 6.801-3.467 1.057 0 1.233 1.273.705 3.23l-1.391 5.352c-.246.945-.141 1.271.106 1.271.317 0 1.357-.392 2.379-1.207l.6.814C12.098 19.02 9.365 20 8.309 20z"/></svg>
    <p><%= session.getAttribute("EditStaffConfirmationMsg")%></p>
</div>
<!-- remove the display edit staff successfully msg's attribute -->
<% session.removeAttribute("EditStaffConfirmationMsg");
    } %>

<%
    List<Staffs> sList = (List) session.getAttribute("staffL");
    SimpleDateFormat dateformat1 = new SimpleDateFormat("MM/dd/yyyy");
%>

<% session.setAttribute("StaffEditStaff", "StaffEditStaff");%>

<div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">
    <div class="bg-white rounded shadow-lg p-4 px-4 md:p-8 mb-6">
        <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 lg:grid-cols-3">
            <div class="text-gray-600">
                <p class="font-medium text-lg capitalize">Hello, <%= session.getAttribute("UserDBName")%>!</p>
            </div>
            <div class="lg:col-span-2">
                <form action="/pepegacoJAVAEE6/UpdateStaffAccount">
                    <%  for (Staffs st : sList) {
                            if (st.getStaffId().equals(session.getAttribute("staffId"))) { %>

                    <!-- for passing value purpose -->
                    <input type="hidden" name="staffId" value="<%= st.getStaffId()%>" />

                    <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 md:grid-cols-5">
                        <div class="md:col-span-5">
                            <label for="full_name">Full Name</label>
                            <input type="text" name="sName" id="full_name" value="<%= st.getName()%>" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" required/>
                        </div>

                        <div class="md:col-span-2">
                            <label for="birthdate">Birthdate</label>
                            <div class="absolute flex items-center p-3 pointer-events-none">
                                <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input datepicker datepicker-autohide type="text" name="sBirthDate" value="<%= dateformat1.format(st.getBirthdate())%>"
                                   class="bg-gray-50 border  mt-1 rounded focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" 
                                   placeholder="Select date" required>   
                        </div>

                        <div class="md:col-span-3">
                            <label>Contact No</label>
                            <input type="tel" name="sContactNo" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50"
                                   placeholder="Phone number without &#34;-&#34;" pattern="[0-9]{10}|[0-9]{11}" 
                                   value="<%= st.getContactNo()%>" required/>
                        </div>
                        <div class="md:col-span-5">
                            <label>Email Address</label>
                            <input type="email" name="sEmail" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" 
                                   value="<%= st.getEmail()%>" placeholder="example@email.com" required/>
                        </div>

                        <div class="md:col-span-5">
                            <label>Password</label>
                            <input type="text" name="sPassword" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" 
                                   value="<%= st.getPassword()%>" required/>
                        </div>


                        <div class="md:col-span-5 text-right">
                            <div class="inline-flex items-end">
                                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Save Edit</button>
                            </div>
                        </div>

                    </div>
                    <% }
                        }%>
                </form>
            </div>
        </div>
    </div>
</div>