<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Staffs"%>

<% List<Staffs> sList = (List) session.getAttribute("staffL");
    SimpleDateFormat datetime = new SimpleDateFormat("MM/dd/yyyy");
    Staffs staff = null;

    for (Staffs st : sList) {
        if (st.getStaffId().equals(request.getParameter("staffId"))) {
            staff = st;
        }
    }
%>

<div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">
    <div class="bg-white rounded shadow-lg p-4 px-4 md:p-8 mb-6">
        <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 lg:grid-cols-3">
            <div class="text-gray-600">
                <p class="font-medium text-lg capitalize">Edit <%= staff.getStaffId()%></p>
            </div>
            <div class="lg:col-span-2">
                <form action="/pepegacoJAVAEE6/UpdateStaffServlet">
                    <input name="staffId" type="hidden" value="<%= staff.getStaffId() %>">
                    <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 md:grid-cols-5">
                        <div class="md:col-span-5">
                            <label>Full Name</label>
                            <input type="text" name="sName" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" 
                                   value="<%= staff.getName() %>" required/>
                        </div>
                        <div class="md:col-span-2">
                            <label>Birth Date</label>
                            <div class="absolute flex items-center p-3 pointer-events-none">
                                <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input name="sBirthDate" datepicker datepicker-autohide type="text"
                                   class="bg-gray-50 border  mt-1 rounded focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5"
                                   value="<%= datetime.format(staff.getBirthdate()) %>" placeholder="Select date" required/>
                        </div>
                        <div class="md:col-span-3">
                            <label>Contact No</label>
                            <input type="tel" name="sContactNo" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50"
                                   placeholder="Phone number without &#34;-&#34;" pattern="[0-9]{10}|[0-9]{11}" 
                                   value="<%= staff.getContactNo() %>" required/>
                        </div>
                        <div class="md:col-span-5">
                            <label>Email Address</label>
                            <input type="email" name="sEmail" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" 
                                   value="<%= staff.getEmail() %>" placeholder="example@email.com" required/>
                        </div>
                        <div class="md:col-span-5">
                            <label>Password</label>
                            <input type="text" name="sPassword" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" 
                                   value="<%= staff.getPassword() %>" required/>
                        </div>

                        <div class="md:col-span-5 text-right">
                            <div class="inline-flex items-end">
                                <button class="bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded" type="button" onclick="" id="editStaff">
                                    <input type="submit" value="Save Edit">
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<% session.removeAttribute("staffL"); %>