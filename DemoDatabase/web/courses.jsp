<%-- 
    Document   : courses
    Created on : Nov 13, 2016, 9:47:43 AM
    Author     : Steven
--%>
<%@page import="java.util.*;"%>
<%@page import="java.util.ArrayList;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Choose the course u want to register!</h1>
        <form action="Dkcourse" method="post">
                        <strong>Select a subject:</strong>
                        <select name="subject_id">
                             <%                             
                                                            List<String> tmp = (ArrayList<String>)session.getAttribute("subject");
                                                            if(tmp.size() > 0){
                                                                System.out.println(tmp.get(0));
                                                                for(String c:tmp){
                                                                    System.out.println(c);
                                                        %>
                                                                    <option name="checkedcourse"value="<%=c%>"></option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                   
                        </select>
                        <input type="submit" value="submit" name="submit" />
                    </form>
    </body>
</html>


 
                                                      