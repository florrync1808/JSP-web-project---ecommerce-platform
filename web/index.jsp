
<div class="flex flex-row-reverse">


    <!--profile icon-->
<!--    <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0" x-data="{ open: false }">                    
         Profile dropdown 
        <div class="relative ml-3"  x-data="{ open: false }">
            <button type="button"  @click="open = ! open" class="flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" >
                <svg class="h-8 w-8 rounded-full" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path style="fill:#E5E5E5;" d="M256,0C114.616,0,0,114.616,0,256s114.616,256,256,256s256-114.616,256-256S397.384,0,256,0z"></path> <path style="fill:#FFFFFF;" d="M256,466.432c-116.032,0-210.432-94.4-210.432-210.432S139.968,45.568,256,45.568 S466.432,139.968,466.432,256S372.032,466.432,256,466.432z M256,61.568C148.792,61.568,61.568,148.792,61.568,256 S148.792,450.432,256,450.432S450.432,363.208,450.432,256S363.208,61.568,256,61.568z"></path> <path d="M256,118.76c22.216,0,40.296,18.08,40.296,40.296s-18.08,40.296-40.296,40.296s-40.296-18.08-40.296-40.296 C215.704,136.84,233.776,118.76,256,118.76 M256,102.76c-31.088,0-56.296,25.208-56.296,56.296s25.208,56.296,56.296,56.296 s56.296-25.208,56.296-56.296S287.088,102.76,256,102.76L256,102.76z"></path> <path d="M189.24,245.448l39.096,84.76h-70.448v-48.664C157.888,256.088,176.632,248.008,189.24,245.448 M198.944,228.288 c0,0-57.056,0.76-57.056,53.256s0,64.664,0,64.664s111.072,0,111.456,0L198.944,228.288L198.944,228.288z M253.336,346.208 L253.336,346.208L253.336,346.208L253.336,346.208z"></path> <path d="M322.768,245.44c12.336,2.52,31.344,10.552,31.344,36.104v48.664h-70.448L322.768,245.44 M313.056,228.288l-54.392,117.92 l0,0H370.12c0,0,0-12.176,0-64.664C370.112,229.048,313.056,228.288,313.056,228.288L313.056,228.288z"></path> <polygon style="fill:#F00000;" points="256,228.288 216.824,228.288 256,315.016 295.176,228.288 "></polygon> </g></svg>
            </button>-->

            <!--Dropdown menu, show/hide based on menu state.-->
            <!--<div class="absolute right-0 z-10 mt-2 w-48 rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none" x-show="open" @click.outside="open = false">-->      
                <a href="/pepegacoJAVAEE6/secureUser/UserDashboard.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200">User Login</a>        
                <a href="./secureStaff/StaffDashboard.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200">Staff Login</a>        
                <a href="./secureAdmin/AdminDashboard.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-200">Admin Login</a>        
            <!--</div>-->
<!--        </div>-->
    <!--</div>-->
</div>

<!--outermost wrapper container-->
<div class="p-8">
    <div class="container mx-auto bg-slate-400 h-min rounded-md flex items-center px-12">
        <div class="w-40">
            <img src="./assets/images/company/Pepega_Co.png">
        </div>
        <div class="sm:ml-20 text-gray-50 py-10 px-4 text-center sm:text-left">
            <h1 class="text-3xl md:text-5xl font-bold mb-4">
                Your passionate <br />
                one-stop plant store
            </h1>
            <p class="text-lg text-lime-400 inline-block sm:block">Better greens for you </p>
            <div class="mt-8">
                <a href="Products.jsp" class="mt-12 px-4 py-2 bg-gray-600 rounded">Shop Now</a>
            </div>
        </div>
    </div>

    <div class="py-4">
        <article x-data="slider" class="relative container mx-auto rounded-md flex flex-shrink-0 overflow-hidden ">
            <div class="rounded-full bg-gray-600 text-white absolute top-5 right-5 text-sm px-2 text-center z-10">
                <span x-text="currentIndex"></span> / 
                <span x-text="images.length"></span>
            </div>

            <template x-for="(image, index) in images">
                <figure class="h-72" x-show="currentIndex == index + 1" x-transition:enter="transition transform duration-300"
                        x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
                        x-transition:leave="transition transform duration-300" x-transition:leave-start="opacity-100"
                        x-transition:leave-end="opacity-0">
                    <img :src="image" alt="Image" class="absolute inset-0 z-10 h-full w-full object-cover opacity-70" />
                </figure>
            </template>

            <button @click="next()"
                     class="absolute right-14 top-1/2 translate-y-1/2 w-11 h-11 flex justify-center items-center rounded-full shadow-md z-10 bg-gray-100 hover:bg-gray-200">
                <svg class=" w-8 h-8 font-bold transition duration-500 ease-in-out transform motion-reduce:transform-none text-gray-500 hover:text-gray-600 hover:translate-x-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                     xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M9 5l7 7-7 7"></path>
                </svg>
            </button>
        </article>
    </div>
</div>

<!-- top selling  -->
<div class="2xl:container 2xl:mx-auto">

    <div class="lg:px-20 md:px-6 px-4 md:py-12 py-8">
        <div>
            <h1 class="text-xl font-semibold text-gray-800 dark:text-white text-center dark:text-gray-50">Top Selling</h1>
        </div>

        <!--card for product-->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 mt-8 md:mt-10">

            <!--for loop here max loop 3-->
            <div class="bg-gray-50 dark:bg-gray-800 p-8">
                <div class="">
                    <h2 class="text-lg text-gray-600 dark:text-white">Product Name</h2>
                    <p class="text-sm font-semibold text-gray-800 dark:text-white mt-2">Price hre</p>
                </div>
                <div class="flex justify-center items-center mt-8 md:mt-24">
                    <img class="" src="./assets/products/Callisia_pink_1.jpeg" alt="Insert Image here" role="img" />
                </div>
            </div>
            <!--for loop end here-->
        </div>

    </div>
</div>  

<script>
    document.addEventListener('alpine:init', () => {
        Alpine.data('slider', () => ({
                currentIndex: 1,
                images: [
                    './assets/images/company/promo2.png',
                    './assets/images/company/promo1.png',
                ],
                back() {
                    if (this.currentIndex > 1) {
                        this.currentIndex = this.currentIndex - 1;
                    }
                },
                next() {
                    if (this.currentIndex < this.images.length) {
                        this.currentIndex = this.currentIndex + 1;
                    } else if (this.currentIndex <= this.images.length) {
                        this.currentIndex = this.images.length - this.currentIndex + 1
                    }
                },
            }))
    })
</script>


