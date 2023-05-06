<div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">
    <div class="bg-white rounded shadow-lg p-4 px-4 w-1/2">
        <div class="grid gap-4 gap-y-2 text-sm">
            <!-- Form header -->
            <div>
                <p class="text-xl font-bold">Add New Staff</p>
                <hr class="my-4 border-gray-900"/>
            </div>
            <!-- Add new staff form, send to "/pepegacoJAVAEE6/AddStaffServlet" -->
            <div class="grid grid-cols-1 gap-6">
                <form action="/pepegacoJAVAEE6/AddStaffServlet">
                    <div class="block p-2">
                        <label class="text-gray-700">Staff Name</label>
                        <input name="sName" type="text" required 
                               class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" 
                               placeholder="eg Albuca Concordiana"/>
                    </div>
                    <div class="block p-2">
                        <label class="text-gray-700">Birth Date</label>
                        <input name="sBirthDate" type="date" required 
                               class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"/>
                    </div>
                    <div class="block p-2">
                        <label class="text-gray-700">Contact No</label>
                        <input name="sContactNo" type="tel" pattern="[0-9]{10}|[0-9]{11}" required 
                               class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" 
                               placeholder="Phone number without &#34;-&#34;">
                    </div>
                    <div class="block p-2">
                        <label class="text-gray-700">E-mail Address</label>
                        <input name="sEmail" type="email" required
                               class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" 
                               placeholder="example@email.com"/>
                    </div>
                    <div class="block p-2">
                        <p class="text-gray-700">Default password</p>
                        <input name="sPassword"
                            class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" disabled value="staffpw1">
                    </div>
                    <div class="p-2 pl-0 flex flex-row">
                        <div class="p-2">
                            <button class="bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded" type="button" onclick="" id="addStaff">
                                <input type="submit" value="Add">
                            </button>
                        </div>
                        <div class="p-2">
                            <button class="bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded" type="button" onclick="" id="addStaff">
                                <input type="reset" value="Reset">
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
