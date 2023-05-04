<%-- retrieve input field parameter --%>
<%
   String input = request.getParameter("input");
%>

<%-- redirect to SearchProduct servlet --%>
<%
  session.setAttribute("input", input);
  response.sendRedirect("/pepegacoJAVAEE6/SearchProductServlet");
%>
