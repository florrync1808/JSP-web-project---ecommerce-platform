<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>

<!<!-- get product details -->
<%
    List<Products> ProductList = (List) session.getAttribute("ProductList");
    SimpleDateFormat datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String productId = request.getParameter("productId");
%>


<!-- form container -->
<div class="min-h-screen p-8 bg-gray-100 flex items-center justify-center">
    <div class="bg-white rounded shadow-lg p-4 px-4 w-1/2">
        <div class="grid gap-4 gap-y-2 text-sm">

            <!-- form title -->
            <div>
                <p class="text-xl font-bold">Edit Product</p>
                <hr class="my-4 border-gray-900"/>
            </div>

            <!-- Display that specify product to be edit -->
            <% for (Products product : ProductList) {
                    if (product.getProductId().equals(request.getParameter("productId"))) {
            %>
            <div class="grid grid-cols-1 gap-6">
                <form action="/pepegacoJAVAEE6/UpdateProductServlet">
                    <label class="block p-2">
                        <span class="text-gray-700 font-semibold">Product ID</span>
                        <input name="id" type="text" required disabled value="<%= product.getProductId()%>" class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"/>
                        <!-- hidden input, for passing parameter purpose only -->
                        <input name="pid" type="hidden" value="<%= product.getProductId()%>">
                    </label>
                    <label class="block p-2">
                        <span class="text-gray-700 font-semibold">Name</span>
                        <input name="pname" type="text" required value="<%= product.getProductName()%>" class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"/>
                    </label>
                    <label class="block p-2">
                        <span class="text-gray-700 font-semibold">Description</span>
                        <textarea name="pdesc" required class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" rows="3"><%= product.getProductDesc()%></textarea>
                    </label>
                    <label class="block p-2">
                        <span class="text-gray-700 font-semibold">Price (RM)</span>
                        <input name="pprice" type="text" required value="<%= product.getProductPrice()%>" class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm
                               focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" />
                    </label>
                    <label class="block p-2">
                        <span class="text-gray-700 font-semibold">Product Image</span>
                        <img id="imagePreview" src="<%= product.getProductPhoto()%>" alt="Selected image" class="w-40 p-2">
                        <input name="ppic" type="file" accept="image/*" id="imageInput" class="file:cursor-pointer pl-0 block text-xs text-slate-500
                               file:mr-4 file:py-1 file:px-2
                               file:rounded-full
                               file:text-xs file:font-semibold
                               file:bg-white file:border file:border-blue-950 file:text-blue-950
                               hover:file:bg-blue-950 hover:file:text-white
                               "/>
                    </label>

                    <!-- hidden input, for passing parameter purpose only -->
                    <input name="pcreate" type="hidden" value="<%= datetime.format(product.getCreatedAt())%>" class="p-2 mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"/>

                    <!-- submit and reset button -->
                    <div class="p-2 pl-0 flex flex-row">
                        <div class="p-2">
                            <input type="submit" value="Save" class="cursor-pointer bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded">
                        </div>
                        <div class="p-2">
                            <a href="/pepegacoJAVAEE6/view/secureStaff/ProductsList.jsp">
                                <input type="button" value="Back" class="cursor-pointer bg-blue-950 hover:bg-white hover:text-blue-950 border hover:border-blue-950 text-white font-bold py-2 px-4 rounded">
                            </a>
                        </div>
                    </div>
                </form>
            </div>
            <%}
                }%>
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



