<%-- 
    Document   : Report
    Created on : 16 Apr 2023, 12:31:04 am
    Author     : Vallerie
--%>

<%@page import="java.util.TreeMap"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="model.ReportService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Products"%>
<%@page import="model.OrderLists"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <% List<Products> productList = (List) session.getAttribute("productList");%>
        <% List<OrderLists> orderList = (List) session.getAttribute("orderList");%>
        <% TreeMap<String, Integer> prodQty = (TreeMap) session.getAttribute("prodQty");%>
        
        <div class="min-h-screen bg-gray-100 py-6 flex flex-col justify-center sm:py-12">
            <div class="relative py-3 max-w-3xl sm:w-3/5 sm:mx-auto">
                <div class="relative  px-4 py-10 bg-white mx-8 md:mx-0 shadow rounded-3xl sm:m-10">

                    <div class="flex flex-col">
                        <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 sm:px-6 lg:px-8">
                                <div class="block mb-20">
                                    <div class="px-3">
            <p class="text-xl font-bold dark:text-white">Product Sales</p>
            <hr class="my-4 border-gray-900"/>
        </div> 
<!--                                <div class="absolute left-5">
                                    <input class="bg-blue-950 my-1 mr-1 text-white px-4 py-3 rounded-md focus:outline-none" type="date" id="reportDay" name="reportDay">
                                </div>
                                    <div class="absolute right-5">
                                    <button class="bg-blue-950 my-1 ml-1 text-white px-4 py-3 rounded-md focus:outline-none">Sort Ascending / Descending</button>
                                </div>-->
                                </div>
                                <div class="overflow-hidden">
                                    <table
                                        class="min-w-full border text-center text-sm font-light dark:border-neutral-500">
                                        <thead class="border-b font-medium dark:border-neutral-500">
                                            <tr>
                                               
                                                <th
                                                    scope="col"
                                                    class="border-r px-6 py-4 dark:border-neutral-500">
                                                    Product ID
                                                </th>
                                                <th
                                                    scope="col"
                                                    class="border-r px-6 py-4 dark:border-neutral-500">
                                                    Product Name
                                                </th>
                                                <th
                                                    scope="col"
                                                    class="border-r px-6 py-4 dark:border-neutral-500">
                                                    Quantity Sold
                                                </th>
                                                <th scope="col" class="px-6 py-4">Total Sales (RM)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (Products prod : productList) {%>
                                            
                                            <tr class="border-b dark:border-neutral-500">
                                               
                                                <td class="whitespace-nowrap border-r px-6 py-4 dark:border-neutral-500" ><%=prod.getProductId()%></td>
                                                <td
                                                    class="whitespace-nowrap border-r px-6 py-4 dark:border-neutral-500">
                                                    <%=prod.getProductName()%>
                                                </td>
                                                <td
                                                    class="whitespace-nowrap border-r px-6 py-4 dark:border-neutral-500">
                                                      <%=prodQty.get(prod.getProductId())%>  
                                                </td>
                                                <td
                                                    class="whitespace-nowrap border-r px-6 py-4 font-medium dark:border-neutral-500">
                                                    <%= prodQty.get(prod.getProductId())* prod.getProductPrice() %>0 
                                                </td>
                                                
                                            </tr>
                                            
                                                        <% }%>

                                  </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>-->

