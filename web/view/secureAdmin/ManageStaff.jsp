<%@page import="java.util.List" %>
<%@page import="model.Staffs" %>

<div class="p-8 min-h-screen bg-gray-100">
    <div class="inline-block min-w-full py-2 align-middle">
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
                    <tr>
                        <!-- loop through staff-info database, now show one row only -->
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900 sm:pl-6">1</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">ST000001</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">Jone Smith</td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-sm text-gray-500">1990-12-01</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">0109448932</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm">jonesmith@email.com</td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-sm text-gray-500">active</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm">staffpw1</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm">2017-07-13 20:13:11.000</td>
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
                    <!-- loop through staff-info database -->
                    <% List<Staffs> staffsList = (List)session.getAttribute("staffsList"); %>
                    <% for (Staffs staff : staffsList) { %>
                    <tr>
                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900 sm:pl-6">e</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%= staff.getStaffId() %></td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">Jone Smith</td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-sm text-gray-500">1990-12-01</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">0109448932</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm">jonesmith@email.com</td>
                        <td class="whitespace-nowrap px-3 py-4 text-center text-sm text-gray-500">active</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm">staffpw1</td>
                        <td class="whitespace-nowrap px-3 py-4 text-sm">2017-07-13 20:13:11.000</td>
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
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>