 <% if ( request.isUserInRole("adminRole") ||  session.getAttribute("userRole").equals("staffRole"))  {} else { 
   response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");  
    }%>
<!--this page can be viewed by admin & staff-->
    
    
Manage Order