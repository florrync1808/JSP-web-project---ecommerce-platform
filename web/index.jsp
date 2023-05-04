

<!--outermost wrapper container-->
<div class="p-8">
    <div class="container mx-auto bg-slate-400 h-min rounded-md flex items-center px-12">
        <div class="w-40">
            <img src="/pepegacoJAVAEE6/assets/images/company/Pepega_Co.png">
        </div>
        <div class="sm:ml-20 text-gray-50 py-10 px-4 text-center sm:text-left">
            <h1 class="text-3xl md:text-5xl font-bold mb-4">
                Your passionate <br />
                one-stop plant store
            </h1>
            

            <p class="text-lg text-lime-400 inline-block sm:block">Better greens for you </p>
            <div class="mt-8">
                <a href="/pepegacoJAVAEE6/DisplayProductsServlet" class="mt-12 px-4 py-2 bg-gray-600 rounded">Shop Now</a>
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
                    <img class="" src="/pepegacoJAVAEE6/assets/images/products/Callisia_pink_1.jpeg" alt="Insert Image here" role="img" />
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
                    '/pepegacoJAVAEE6/assets/images/company/promo2.png',
                    '/pepegacoJAVAEE6/assets/images/company/promo1.png',
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


