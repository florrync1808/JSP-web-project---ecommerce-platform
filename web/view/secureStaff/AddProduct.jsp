<% if (request.isUserInRole("adminRole")) {

    } else if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") {

        response.sendRedirect("/pepegacoJAVAEE6/view/UserLogin.jsp");
    } else {
    }%>
<!--this page can be viewed by admin & staff-->

<!-- form container -->
<div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">
    <div class="bg-white rounded shadow-lg p-4 px-4 w-1/2">
        <div class="grid gap-4 gap-y-2 text-sm">

            <!-- form title -->
            <div>
                <p class="text-xl font-bold">Add New Product</p>
                <hr class="my-4 border-gray-900"/>
            </div>

            <!-- input fields -->
            <div class="grid grid-cols-1 gap-6">
                <form action="/pepegacoJAVAEE6/AddProductServlet">
                    <label class="block p-2">
                        <span class="text-gray-700 font-semibold">Name</span>
                        <input name="pname" type="text" required class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="eg. Albuca Concordiana"/>
                    </label>
                    <label class="block p-2">
                        <span class="text-gray-700 font-semibold">Description</span>
                        <textarea name="pdesc" required class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" rows="3" placeholder="Briefly describe the product..."></textarea>
                    </label>
                    <label class="block p-2">
                        <span class="text-gray-700 font-semibold">Price (RM)</span>
                        <input name="pprice" type="number" required step="0.01" class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm
                               focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50
                               [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none" placeholder="eg. 12.90"/>
                    </label>
                    <label class="block p-2">
                        <span class="text-gray-700 font-semibold">Product Image</span>
                        <img id="imagePreview" src="" alt="Selected image" class="w-40 p-2">
                        <input name="ppic" type="file" accept="image/*" id="imageInput" class="file:cursor-pointer p-2 pl-0 block text-sm text-slate-500
                               file:mr-4 file:py-1 file:px-2
                               file:rounded-full
                               file:text-sm file:font-semibold
                               file:bg-white file:border file:border-blue-950 file:text-blue-950
                               hover:file:bg-blue-950 hover:file:text-white
                               "/>
                    </label>

                    <!-- submit and reset button -->
                    <div class="p-2 pl-0 flex flex-row">
                        <div class="p-2">
                            <input type="submit" value="Add" class="cursor-pointer bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded">
                        </div>
                        <div class="p-2">
                            <input type="reset" value="Reset" class="cursor-pointer bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- for preview the selected image -->
<script>
    const imageInput = document.getElementById('imageInput');
    const imagePreview = document.getElementById('imagePreview');
    imageInput.addEventListener('change', (event) => {
        const selectedFile = event.target.files[0];
        const imageUrl = URL.createObjectURL(selectedFile);
        imagePreview.src = imageUrl;
    });
</script>


