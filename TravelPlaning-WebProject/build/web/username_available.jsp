<%-- 
    Document   : username_available
    Created on : Dec 2, 2016, 12:26:44 AM
    Author     : zovippro1996
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://db4free.net:3306/usertp_db","traveladmin","travel123");
        
            PreparedStatement ps = con.prepareStatement("SELECT  * FROM VUsers WHERE username = ?");
            
            ps.setString(1,request.getParameter("username"));
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.first()){
                out.print("User exists");
            }else{
                out.print("User name is valid");
            }
            
        }catch (Exception e){
            System.out.println(e);  
        }
%>