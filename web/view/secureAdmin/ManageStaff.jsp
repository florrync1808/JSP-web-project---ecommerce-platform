<%@page import="java.util.List"%>
<%@page import="model.Staffs"%>

<% List<Staffs> sList = (List) session.getAttribute("staffL"); %>

<div class="p-8 min-h-screen bg-gray-100">
    <div class="inline-block min-w-full py-2 align-middle">
        <div class="px-12">
            <div class="flex flex-row col-span-2">
                <div class="grow">
                    <p class="text-xl font-bold">Staffs List</p>
                </div>
                <div class="grow-0">
                    <!-- TODO add staff page -->
                    <a href="AddStaff.jsp">
                        <button class="bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded" type="button" onclick="" id="addStaff">Add New Staff</button>
                    </a>
                </div>
            </div>
            <hr class="my-4 border-gray-900"/>
        </div>

        <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg shadow-md">
            <table class="min-w-full divide-y divide-gray-300">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">#</th>
                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900">Staff ID</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Name</th>
                        <th scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Birth Date</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Contact Number</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Email</th>
                        <th scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Employment Status</th>
                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Password</th>
                        <th scope="col" class="px-3 py-3.5 text-center text-sm font-semibold text-gray-900">Create At</th>
                        <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                            <span class="sr-only">Actions</span>
                        </th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 bg-white">
                    <% int rowCount = 0; %>
                    <% for (Staffs staff : sList) {%>
                    <% rowCount++;%>
                    <tr>
                        <!-- loop through staff-info database, now show one row only -->
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900 sm:pl-6"><%= rowCount%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= staff.getStaffId()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= staff.getName()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-sm text-gray-500"><%= staff.getBirthdate()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= staff.getContactNo()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm"><%= staff.getEmail()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-sm text-gray-500">active/inactive</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm"><%= staff.getPassword()%></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm"><%= staff.getCreatedAt()%></td>
                        <!-- Edit Delete buttons -->
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
                    <% }%>
                </tbody>
            </table>
        </div>
    </div>
</div>