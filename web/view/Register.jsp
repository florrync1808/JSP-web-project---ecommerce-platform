<% if (request.isUserInRole("adminRole")) {
        response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");
    } else if (session.getAttribute("userName") == null || session.getAttribute("userRole").equals("userRole")) { %>

<div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">

    <div class="bg-white rounded shadow-lg p-4 px-4 md:p-8 mb-6">
        <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 lg:grid-cols-3">
            <div class="text-gray-60 py-4">
                <p class="font-medium text-lg">Registration Form</p>
            </div>

            <div class="lg:col-span-2">
                <form id="form" action="/pepegacoJAVAEE6/RegisterCustomerServlet" method="post" x-data="{password: '',password_confirm: ''}" onsubmit="return validateForm();" >

                    <div class="grid gap-4 gap-y-2 text-sm grid-cols-1 md:grid-cols-5">
                        <div class="md:col-span-5">
                            <label for="full_name">Full Name</label>
                            <input type="text" name="fullName" id="full_name" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" required/>
                        </div>

                        <div class="md:col-span-2">
                            <label for="birthdate">Birthdate</label>
                            <div class="absolute flex items-center p-3 pointer-events-none">
                                <svg aria-hidden="true" class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input name="birthDate" datepicker datepicker-autohide type="text" 
                                   class="bg-gray-50 border  mt-1 rounded focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" 
                                   placeholder="Select date" required>   
                        </div>

                        <div class="md:col-span-3">
                            <label for="email">Contact No</label>
                            <input type="tel" id="ContactNo" name="contactNo" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50"
                                   placeholder="0123456789" pattern="[0-9]{10,11}" maxlength="11"  required />
                        </div>

                        <div class="md:col-span-5">
                            <label for="email">Email Address</label>
                            <input type="text" name="email" id="email" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder="email@domain.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required/>
                        </div>

                        <div class="md:col-span-5">
                            <label for="password">Password</label>
                            <input x-model="password" type="password" name="password" id="password" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder="password"  required/>
                        </div>
                        <div class="md:col-span-5">
                            <label for="confirmPassword">Confirm Password</label>
                            <input x-model="password_confirm" type="password" name="confirmPassword" id="confirmPassword" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder="Confirm password" required/>
                        </div>

                        <div class="md:col-span-5">
                            <label for="address1">Address Line 1</label>
                            <input type="text" name="address1" id="address1" maxlength="225" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder="" required/>
                        </div>

                        <div class="md:col-span-5">
                            <label for="address2">Address Line 2</label>
                            <input type="text" name="address2" id="address2" maxlength="225" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder="" required/>
                        </div>

                        <div class="md:col-span-2">
                            <label for="city">City</label>
                            <input type="text" name="city" id="city" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder="" required />
                        </div>


                        <div class="md:col-span-2">
                            <label for="state">State</label>
                            <input type="text" name="city" id="city" class="h-10 border mt-1 rounded px-4 w-full bg-gray-50" value="" placeholder="" required />

                        </div>

                        <div class="md:col-span-1">
                            <label for="zipcode">Postcode</label>
                            <input type="text" name="zipcode" id="zipcode" class="transition-all flex items-center h-10 border mt-1 rounded px-4 w-full bg-gray-50" placeholder="" value="" required/>
                        </div>

                        <!--reactive warning--> 
                        <div class="md: col-span-5">
                            <ul>
                                <li class="flex items-center py-1" >
                                    <div :class="{'bg-green-200 text-green-700': password == password_confirm && password.length >= 0, 'bg-red-200 text-red-700':password != password_confirm || password.length == 0}" 
                                         class=" rounded-full p-1 fill-current ">
                                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path x-show="password == password_confirm && password.length > 0" stroke-linecap="round"
                                                  stroke-linejoin="round" stroke-width="2"
                                                  d="M5 13l4 4L19 7"/>
                                            <path x-show="password != password_confirm || password.length == 0" stroke-linecap="round"
                                                  stroke-linejoin="round" stroke-width="2"
                                                  d="M6 18L18 6M6 6l12 12"/>
                                        </svg>
                                    </div>
                                    <span :class="{'text-green-700 ': password == password_confirm && password.length >= 0, 'text-red-700':password != password_confirm || password.length == 0}"  
                                          class="font-medium text-sm ml-3"
                                          x-text="password == password_confirm && password.length > 0 ? 'Passwords match' : 'Passwords do not match' "></span>
                                </li>
                                <li class="flex items-center py-1">
                                    <div :class="{'bg-green-200 text-green-700': password.length > 7, 'bg-red-200 text-red-700':password.length < 7 }"
                                         class=" rounded-full p-1 fill-current ">
                                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path x-show="password.length > 7" stroke-linecap="round"
                                                  stroke-linejoin="round" stroke-width="2"
                                                  d="M5 13l4 4L19 7"/>
                                            <path x-show="password.length < 7" stroke-linecap="round"
                                                  stroke-linejoin="round" stroke-width="2"
                                                  d="M6 18L18 6M6 6l12 12"/>

                                        </svg>
                                    </div>
                                    <span :class="{'text-green-700': password.length > 7, 'text-red-700':password.length < 7 }"
                                          class="font-medium text-sm ml-3"
                                          x-text="password.length > 7 ? 'The minimum length is reached' : 'At least 8 characters required' "></span>
                                </li>
                            </ul>
                        </div>

                        <div class="md:col-span-5 text-right mt-12">
                            <div class="inline-flex items-end" >
                                <button id="submit_register" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" type="submit" onclick="" > Register </button>
                                            </div>
                                            </div>

                                            <div class=" col-span-5 text-right">
                                    <a href="/pepegacoJAVAEE6/view/UserLogin.jsp"
                                       class="text-black font-normal border-b-2 border-gray-200 hover:border-teal-500">You're already member?
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
            console.log(firstPassword.value);
            console.log(secondPassword.value);
            
            let incorrectInput = "";
            if (firstPassword.value == secondPassword.value) {
                incorrectInput += 'The passwords match.';
                console.log(true);
                return true;
            } else {
                console.log(false);
                return false;
            }
            
            return false;
    }

</script>