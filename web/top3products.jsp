<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>
<% ArrayList<Products> topProd = (ArrayList)session.getAttribute("top3productList");%>

<% for (Products prod : topProd) { %>  
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 mt-8 md:mt-10">

    <!--for loop here max loop 3-->
    <div class="bg-gray-50 dark:bg-gray-800 p-8">
        <div class="">
            <h2 class="text-lg text-gray-600 dark:text-white"><% prod.getProductName(); %></h2>
            <p class="text-sm font-semibold text-gray-800 dark:text-white mt-2">Price hre</p>
        </div>
        <div class="flex justify-center items-center mt-8 md:mt-24">
            <img class="" src="/pepegacoJAVAEE6/assets/images/products/Callisia_pink_1.jpeg" alt="Insert Image here" role="img" />
        </div>
    </div>
            
    <!--for loop end here-->
</div>
<% }%>