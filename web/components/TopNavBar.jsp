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
                    <input type="text" id="email-adress-icon" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-28 md:w-full pl-10 p-2" placeholder="Search...">
                </div>

                <!--profile icon-->
                <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0" x-data="{ open: false }">
                    <button type="button" class="rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800"  @click="open = ! open" >
                        <span class="sr-only">View cart</span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="h-5 w-5"><path d="M2.25 2.25a.75.75 0 000 1.5h1.386c.17 0 .318.114.362.278l2.558 9.592a3.752 3.752 0 00-2.806 3.63c0 .414.336.75.75.75h15.75a.75.75 0 000-1.5H5.378A2.25 2.25 0 017.5 15h11.218a.75.75 0 00.674-.421 60.358 60.358 0 002.96-7.228.75.75 0 00-.525-.965A60.864 60.864 0 005.68 4.509l-.232-.867A1.875 1.875 0 003.636 2.25H2.25zM3.75 20.25a1.5 1.5 0 113 0 1.5 1.5 0 01-3 0zM16.5 20.25a1.5 1.5 0 113 0 1.5 1.5 0 01-3 0z" /> </svg>
                    </button>
                    
                    <!-- Profile dropdown -->
                        <%@ include file = "UserNavBarDropDown.jsp" %>
                </div>
        </div>
    </div>
</nav>