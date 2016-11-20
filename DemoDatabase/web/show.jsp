<%-- 
    Document   : show
    Created on : Nov 14, 2016, 7:59:52 AM
    Author     : CREAT10N
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Result Page</title>
    </head>
    <body>
        <h5>Full name:</h5> <%= session.getAttribute("fullname") %>
        <br>
        <h5>ID:</h5> <%= session.getAttribute("ID") %>
        <br>
        <h5>Email:</h5> <%= session.getAttribute("email") %>
        <br>
        <h5>Gender:</h5> <%= session.getAttribute("gender") %>
        <br>
        <h5>Field of Study:</h5> <%= session.getAttribute("field") %>
        <br>
        <h5>Courses: </h5>
        <% String[] subjects = (String[])session.getAttribute("subject"); %>
        <% if (subjects != null) {
                for (int i = 0; i < subjects.length; i++) {
                    out.print((i+1) + " " + subjects[i] + "\n");
                }
            } else {
                out.print("none");
            }
        %>
    </body>
</html>
