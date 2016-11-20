<%-- 
    Document   : register
    Created on : Nov 13, 2016, 8:02:29 PM
    Author     : CREAT10N
--%>
<%@page import="java.util.*;"%>
<%@page import="java.util.ArrayList;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Registration Page</title>
        
    </head>
    <body>
        <form action="result.jsp" method="GET">
            <h1>School of Computer Science & Engineering</h1>
            <hr>
            <h2>Course Registration Form</h2>

            <div class="row">
                <div class="tag">
                    Full Name
                </div>
                <div><input type="text" name="fullname" value="<%=session.getAttribute("username")%>"></div>
            </div>

            <div class="row">
                <div class="tag">
                    ID
                </div>
                <div><input type="text" name="ID"></div>
            </div>

            <div class="row">
                <div class="tag">
                    Email
                </div>
                <div><input type="email" name="email"></div>
            </div>

            <div class="row">
                <div class="tag">
                    Gender
                </div>
                <div>
                    <div id="male"><input type="radio" name="gender" value="male" checked>Male</div>
                    <div id="female"><input type="radio" name="gender" value="female">Female</div>
                </div>
            </div>

            <div class="row">
                <div class="tag">
                    Field of Study
                </div>
                <div>
                    <select name="field-of-study">
                        <option value="CS">CS</option>
                        <option value="CN">CN</option>
                        <option value="IT">IT</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="tag" id="subject">
                    <b>List of Subjects</b>
                </div>
                <div>
                     <% List<String> tmp = (ArrayList<String>)session.getAttribute("subject");
                                                            if(tmp.size() > 0){
                                                                System.out.println(tmp.get(0));
                                                                for(String c:tmp){
                                                                    System.out.println(c);
                                                        %>
                                                                     <input type="checkbox" name="subject" value="<%=c%>"><%=c%><br>
                                                        <%
                                                                }
                                                            }
                                                        %> 
<!--                    <input type="checkbox" name="subject" value="Digital Logical Design">Digital Logical Design<br>
                    <input type="checkbox" name="subject" value="Computer Network">Computer Network<br>
                    <input type="checkbox" name="subject" value="Web Application Development">Web Application Development<br>
                    <input type="checkbox" name="subject" value="Object Oriented Programming">Object Oriented Programming<br>
                    <input type="checkbox" name="subject" value="Discrete Mathematics">Discrete Mathematics<br>
                    <input type="checkbox" name="subject" value="Software Engineering">Software Engineering<br>
                    <input type="checkbox" name="subject" value="Computer Graphics">Computer Graphics<br>
                    <input type="checkbox" name="subject" value="Operating System">Operating System<br>-->
                </div>
            </div><br>

            <div class="row">
                <div id="submit">
                    <input type="submit" value="Submit">
                </div>
                <div>
                    <input type="reset" value="Cancel">
                </div>
            </div>
        </form>
    </body>
</html>
