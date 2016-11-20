<%-- 
    Document   : result
    Created on : Nov 14, 2016, 7:52:50 AM
    Author     : CREAT10N
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get Result Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("fullname");
            session.setAttribute("fullname", name);
        %>
        <%            
            String ID = request.getParameter("ID");
            session.setAttribute("ID", ID);
        %>
        <%
            String email = request.getParameter("email");
            session.setAttribute("email", email);
        %>
        <%
            String gender = request.getParameter("gender");
            session.setAttribute("gender", gender);
        %>
        <%
            String field = request.getParameter("field-of-study");
            session.setAttribute("field", field);
        %>
        <% String[] subjects; %>
        <%
            subjects = request.getParameterValues("subject");
            session.setAttribute("subject", subjects);
        %>
        <a href="show.jsp">Continue</a>
    </body>
</html>
