<nav class="bg-blue-950">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
        <div class="relative flex h-16 items-center justify-between">
            <!--LOGO-->
                <div class="flex flex-1 items-center justify-center sm:items-stretch md:justify-start">
                    <a href="index.jsp">
                        <div class="flex flex-shrink-0 items-center">
                                <img class="block h-8 w-auto lg:hidden" src="https://thumbs.gfycat.com/AgitatedLiveAgouti-max-1mb.gif" alt="PEPEGA Co.">
                                <img class="hidden h-8 w-auto lg:block" src="https://thumbs.gfycat.com/AgitatedLiveAgouti-max-1mb.gif" alt="PEPEGA Co.">
                                <span class="font-medium text-neutral-50">PEPEGA Co.</span>
                        </div>   
                    </a>
                </div>

                <!--searchbar-->
                <div class="absolute md:relative mr-3 md:mr-0">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
                    </div>
                    <input type="text" id="email-adress-icon" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-28 md:w-full pl-10 p-2" placeholder="Search name/Product ID">
                </div>

                <!--profile icon-->
                <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0" x-data="{ open: false }">                    
                    <!-- Profile dropdown -->
                        <%@ include file = "PublicNavBarDropDown.jsp" %>
                </div>
        </div>
    </div>
</nav>