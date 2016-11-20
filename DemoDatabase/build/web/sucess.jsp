<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("username")%>

<form action="Courses" method="get">
<a href='register.jsp'><input type="Submit" value="Register courses"></a> 
</form>
<a href='logout.jsp'>Log out</a>
<%
    }
%>