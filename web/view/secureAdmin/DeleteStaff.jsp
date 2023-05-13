<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Staffs"%>

<!<!-- get customer details -->
<%
    List<Staffs> staffList = (List) session.getAttribute("staffL");
    SimpleDateFormat dateformat1 = new SimpleDateFormat("MM/dd/yyyy");
%>


<!-- form container -->
<div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">
    <div class="bg-white rounded shadow-lg p-4 px-4 md:p-8 mb-6">
        <div class="text-gray-600 pb-10">
            <p class="font-medium text-lg capitalize">Confirm Delete Staff?</p>
        </div>
        <div class="grid gap-y-2 text-sm grid-cols-1 lg:grid-cols-2">

            <div class="lg:col-span-2">
                <form action="/pepegacoJAVAEE6/DeleteStaffServlet">
                    <!-- show the customer details by matching the id -->
                    <% for (Staffs st : staffList) {
                            if (st.getStaffId().equals(request.getParameter("staffId"))) {%>

                    <!-- for passing value purpose -->
                    <input type="hidden" name="customerId" value="<%= st.getStaffId()%>" />

                    <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 md:grid-cols-5">
                        <div class="md:col-span-5">
                            <label for="full_name" class="text-gray-500 font-semibold">Full Name</label>
                            <input type="text" name="name" id="full_name" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="<%= st.getName()%>" disabled/>
                        </div>

                        <div class="md:col-span-2">
                            <label for="birthdate" class="text-gray-500 font-semibold">Birthdate</label>
                            <div class="absolute flex items-center p-3 pointer-events-none">
                                <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input datepicker datepicker-autohide type="text" name="birthdate" value="<%= dateformat1.format(st.getBirthdate())%>"
                                   class="bg-gray-50 border  mt-1 rounded focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" 
                                   placeholder="Select date" disabled>   
                        </div>

                        <div class="md:col-span-3">
                            <label for="contactNo" class="text-gray-500 font-semibold">Contact No</label>
                            <input type="tel" id="ContactNo" name="contactno" value="<%= st.getContactNo()%>" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50"
                                   placeholder="0123456789" pattern="[0-9]{3}[0-9]{7}" disabled/>
                        </div>

                        <div class="md:col-span-2">
                            <label for="email" class="text-gray-500 font-semibold">Email Address</label>
                            <input type="text" name="email" id="email" value="<%= st.getEmail()%>" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" 
                                   placeholder="email@domain.com" disabled/>
                        </div>

                        <div class="md:col-span-3">
                            <label for="password" class="text-gray-500 font-semibold">Password</label>
                            <input type="text" name="password" id="password" value="<%= st.getPassword()%>" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" 
                                   placeholder="" disabled/>
                        </div>
                        <div class="md:col-span-5">
                            <label for="password" class="text-gray-500 font-semibold">Employment Status</label>
                            <input type="text" name="password" id="password" value="<%= st.getEmploymentStatus() %>" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" 
                                   placeholder="" disabled/>
                        </div>

                        <div class="md:col-span-5 text-right pt-5">
                            <div class="inline-flex items-end">
                                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Confirm</button>
                            </div>
                            <div class="inline-flex items-end">
                                <a href="/pepegacoJAVAEE6/view/secureAdmin/ManageCustomer.jsp">
                                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Back</button>
                                </a>
                            </div>
                        </div>

                    </div>
                    <% }
                        }
                    %>
                </form>
            </div>
        </div>
    </div>
</div>


