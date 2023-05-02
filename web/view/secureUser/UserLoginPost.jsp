<%@page import="domain.LoginPost"%>
<jsp:useBean id="loginPost" class="domain.LoginPost" scope="session"/>
<jsp:setProperty name="loginPost" property="*"/>

<%
    String result = controller.userLoginServlet.login(loginPost);
            session.setAttribute("logging", loginPost.getEmail());
            session.setAttribute("logging2", loginPost.getPassword());


    if (result.equals("true")) {
        session.setAttribute("username", loginPost.getEmail());
        session.setAttribute("userRole", "user");

        response.sendRedirect("pepegacoJAVAEE6/web/view/secureUser/UserDashboard.jsp");
    }

    if (result.equals("false")) {
        response.sendRedirect("pepegacoJAVAEE6/index.jsp?status=false");
                session.setAttribute("email", loginPost.getEmail());

    }

    if (result.equals("error")) {
        response.sendRedirect("pepegacoJAVAEE6/index.jsp?status=error");
    }

%>

 <%=loginPost.getEmail()%>
 <%=loginPost.getPassword()%>
 
