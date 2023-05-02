 <% if (session.getAttribute("userName") == null && session.getAttribute("userRole") != "userRole") { 
       response.sendRedirect("/pepegacoJAVAEE6/view/ErrorPage.jsp");}
    else { }%>
    <!--this page only viewable by user-->
Order History