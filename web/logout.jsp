<%-- 
    Document   : logout
    Created on : Dec 17, 2020, 10:04:56 PM
    Author     : kapil
--%>


<%
    session.invalidate(); //destroy session
    response.sendRedirect("login.jsp");
%>