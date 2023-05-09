<% if (request.isUserInRole("adminRole")) { response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp"); } else if
    (session.getAttribute("userName")==null || session.getAttribute("userRole").equals("userRole")) { %>

        <% if (session.getAttribute("errMsg") != null) { %>
    <div x-data="{ show:true }" x-show="show" x-init="setTimeout(() => show = false, 3000)" class="absolute flex w-1/2 items-center rounded-md bg-red-500 text-white text-sm font-bold px-4 py-3 my-4 right-12 z-40" role="alert">
        <svg class="fill-current w-4 h-4 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M12.432 0c1.34 0 2.01.912 2.01 1.957 0 1.305-1.164 2.512-2.679 2.512-1.269 0-2.009-.75-1.974-1.99C9.789 1.436 10.67 0 12.432 0zM8.309 20c-1.058 0-1.833-.652-1.093-3.524l1.214-5.092c.211-.814.246-1.141 0-1.141-.317 0-1.689.562-2.502 1.117l-.528-.88c2.572-2.186 5.531-3.467 6.801-3.467 1.057 0 1.233 1.273.705 3.23l-1.391 5.352c-.246.945-.141 1.271.106 1.271.317 0 1.357-.392 2.379-1.207l.6.814C12.098 19.02 9.365 20 8.309 20z"/></svg>
        <p><%= session.getAttribute("errMsg") %></p>
    </div>
    <% } %>
    
    <div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">

        <div class="bg-white rounded shadow-lg p-4 px-4 md:p-8 mb-6">
            <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 lg:grid-cols-3">
                <div class="text-gray-60 py-4">
                    <p class="font-medium text-lg">Registration Form</p>
                </div>

                <div class="lg:col-span-2">
                    <form id="form" action="/pepegacoJAVAEE6/RegisterCustomerServlet" method="post"
                        x-data="{password: '',password_confirm: ''}" onsubmit="return validateForm();">

                        <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 md:grid-cols-5">
                            <div class="md:col-span-5">
                                <label for="full_name">Full Name</label>
                                <input type="text" name="fullName" id="full_name"
                                    class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" required />
                            </div>

                            <div class="md:col-span-2">
                                <label for="birthdate">Birthdate</label>
                                <div class="absolute flex items-center p-3 pointer-events-none">
                                    <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor"
                                        viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                            d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z"
                                            clip-rule="evenodd"></path>
                                    </svg>
                                </div>
                                <input name="birthDate" datepicker datepicker-autohide type="text"
                                    class="bg-gray-50 border  mt-1 rounded focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5"
                                    placeholder="Select date" required>
                            </div>

                            <div class="md:col-span-3">
                                <label for="email">Contact No</label>
                                <input type="tel" id="ContactNo" name="contactNo"
                                    class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" placeholder="0123456789"
                                    pattern="[0-9]{10,11}" maxlength="11" required />
                            </div>

                            <div class="md:col-span-5">
                                <label for="email">Email Address</label>
                                <input type="text" name="email" id="email"
                                    class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value=""
                                    placeholder="email@domain.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
                                    required />
                            </div>

                            <div class="md:col-span-5">
                                <label for="password">Password</label>
                                <input x-model="password" type="password" name="password" id="password"
                                    class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value=""
                                    placeholder="password" required />
                            </div>
                            <div class="md:col-span-5">
                                <label for="confirmPassword">Confirm Password</label>
                                <input x-model="password_confirm" type="password" name="confirmPassword"
                                    id="confirmPassword" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50"
                                    value="" placeholder="Confirm password" required />
                            </div>

                            <div class="md:col-span-5">
                                <label for="address1">Address Line 1</label>
                                <input type="text" name="address1" id="address1" maxlength="225"
                                    class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder=""
                                    required />
                            </div>

                            <div class="md:col-span-5">
                                <label for="address2">Address Line 2</label>
                                <input type="text" name="address2" id="address2" maxlength="225"
                                    class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder=""
                                    required />
                            </div>

                            <div class="md:col-span-2">
                                <label for="city">City</label>
                                <input type="text" name="city" id="city"
                                    class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder=""
                                    required />
                            </div>


                            <div class="md:col-span-2">
                                <label for="state">State</label>
                                <input type="text" name="state" id="state"
                                    class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder=""
                                    required />
                            </div>

                            <div class="md:col-span-1">
                                <label for="zipcode">Postcode</label>
                                <input type="text" name="zipcode" id="zipcode"
                                    class="transition-all flex items-center h-10 border mt-1 rounded px-4 w-full bg-gray-50"
                                    placeholder="" value="" required />
                            </div>

                            <!--reactive warning-->
                            <div class="md: col-span-5">
                                <ul>
                                    <li class="flex items-center py-1">
                                        <div :class="{'bg-green-200 text-green-700': password == password_confirm && password.length >= 0, 'bg-red-200 text-red-700':password != password_confirm || password.length == 0}"
                                            class=" rounded-full p-1 fill-current ">
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path x-show="password == password_confirm && password.length > 0"
                                                    stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M5 13l4 4L19 7" />
                                                <path x-show="password != password_confirm || password.length == 0"
                                                    stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M6 18L18 6M6 6l12 12" />
                                            </svg>
                                        </div>
                                        <span
                                            :class="{'text-green-700 ': password == password_confirm && password.length >= 0, 'text-red-700':password != password_confirm || password.length == 0}"
                                            class="font-medium text-sm ml-3"
                                            x-text="password == password_confirm && password.length > 0 ? 'Passwords match' : 'Passwords do not match' "></span>
                                    </li>
                                    <li class="flex items-center py-1">
                                        <div :class="{'bg-green-200 text-green-700': password.length > 7, 'bg-red-200 text-red-700':password.length < 7 }"
                                            class=" rounded-full p-1 fill-current ">
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path x-show="password.length > 7" stroke-linecap="round"
                                                    stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                                                <path x-show="password.length < 7" stroke-linecap="round"
                                                    stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />

                                            </svg>
                                        </div>
                                        <span
                                            :class="{'text-green-700': password.length > 7, 'text-red-700':password.length < 7 }"
                                            class="font-medium text-sm ml-3"
                                            x-text="password.length > 7 ? 'The minimum length is reached' : 'At least 8 characters required' "></span>
                                    </li>
                                </ul>
                            </div>

                            <div class="md:col-span-5 text-right mt-12">
                                <div class="inline-flex items-end">
                                    <button id="submit_register"
                                        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                                        type="submit" onclick=""> Register </button>
                                </div>
                            </div>

                            <div class=" col-span-5 text-right">
                                <a href="/pepegacoJAVAEE6/view/UserLogin.jsp"
                                    class="text-black font-normal border-b-2 border-gray-200 hover:border-teal-500">You're
                                    already member?
                                    <span class="text-black font-semibold">
                                        Login
                                    </span>
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <% }%>

        <script>
            function validateForm() {
                const firstPassword = document.getElementById('password');
                const secondPassword = document.getElementById('confirmPassword');   
                if (firstPassword.value === secondPassword.value && firstPassword.value.length >= 8) {
                    return true;
                } else {
                    return false;
                }

                return false;
            }

        </script>
    
    
<% session.invalidate(); %>