<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "components/Header.jsp" %>
    <body>
        <%@ include file = "components/TopNavBar.jsp" %>
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
                        <a href="Register.jsp" class="mt-12 px-4 py-2 bg-gray-600 rounded">Shop Now</a>
                    </div>
                </div>
            </div>
            
            <div class="py-4">
                <article x-data="slider" class="relative container mx-auto rounded-md flex flex-shrink-0 overflow-hidden ">
                    <div class="rounded-full bg-gray-600 text-white absolute top-5 right-5 text-sm px-2 text-center z-10">
                        <span x-text="currentIndex"></span>/
                        <span x-text="images.length"></span>
                    </div>

                    <template x-for="(image, index) in images">
                        <figure class="h-72" x-show="currentIndex == index + 1" x-transition:enter="transition transform duration-300"
                                x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
                                x-transition:leave="transition transform duration-300" x-transition:leave-start="opacity-100"
                                x-transition:leave-end="opacity-0">
                            <img :src="image" alt="Image" class="absolute inset-0 z-10 h-full w-full object-cover opacity-70" />
                            <figcaption class="absolute inset-x-0 bottom-1 z-20 w-96 mx-auto p-4 font-light text-sm text-center tracking-widest leading-snug bg-gray-300 bg-opacity-80">
                                LATEST PROMOTIONS!!
                            </figcaption>
                        </figure>
                    </template>

                    <button @click="back()"
                             class="absolute left-14 top-1/2 -translate-y-1/2 w-11 h-11 flex justify-center items-center rounded-full shadow-md z-10 bg-gray-100 hover:bg-gray-200">
                        <svg class=" w-8 h-8 font-bold transition duration-500 ease-in-out transform motion-reduce:transform-none text-gray-500 hover:text-gray-600 hover:-translate-x-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                             xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M15 19l-7-7 7-7">
                        </path>
                        </svg>
                    </button>

                    <button @click="next()"
                             class="absolute right-14 top-1/2 translate-y-1/2 w-11 h-11 flex justify-center items-center rounded-full shadow-md z-10 bg-gray-100 hover:bg-gray-200">
                        <svg class=" w-8 h-8 font-bold transition duration-500 ease-in-out transform motion-reduce:transform-none text-gray-500 hover:text-gray-600 hover:translate-x-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                             xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M9 5l7 7-7 7"></path>
                        </svg>
                    </button>
                </article>
            </div>
            
            <div class="container mx-auto pt-8 text-white">
                <a href="Register.jsp" class="mt-12 px-4 py-2 bg-gray-600 rounded">Register</a>
                <a href="Login.jsp" class="mt-12 px-4 py-2 bg-gray-600 rounded">Login</a>
                <a href="Products.jsp" class="mt-12 px-4 py-2 bg-gray-600 rounded">Products</a>
                <a href="tabletemplate.jsp" class="mt-12 px-4 py-2 bg-gray-600 rounded">Table template - to display rows of item manage, history etc</a>
                <a href="dashboardtemplate.jsp" class="mt-12 px-4 py-2 bg-gray-600 rounded">dashboard templatec</a>
            </div>
        </div>

        <script>
            document.addEventListener('alpine:init', () => {
                Alpine.data('slider', () => ({
                        currentIndex: 1,
                        images: [
                            'https://source.unsplash.com/1600x900/?beach',
                            'https://source.unsplash.com/1600x900/?cat',
                            'https://source.unsplash.com/1600x900/?dog',
                            'https://source.unsplash.com/1600x900/?lego',
                            'https://source.unsplash.com/1600x900/?textures&patterns'
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


    </body>
    <%@ include file = "components/Footer.jsp" %>
</html>
