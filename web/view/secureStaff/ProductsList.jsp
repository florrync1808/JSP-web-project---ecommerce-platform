 <% if (request.isUserInRole("adminRole")) {
       
    }else if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "staffRole") {
             
       response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");}
    else { }%>
<!--this page can be viewed by admin & staff-->
    
    Product List