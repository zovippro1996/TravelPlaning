<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<% 
                    String sn=request.getParameter("ver");

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con =DriverManager.getConnection("jdbc:mysql://db4free.net:3306/usertp_db","traveladmin","travel123");
                    Statement st=con.createStatement();
                    ResultSet rs = st.executeQuery("select * from Locations where Country='"+sn+"'");
                    if(rs.next())
                    {    
                        out.println("<font color=red>");
                        out.println("Not Available");
                        out.println("</font>");

                    }else {
                        out.println("<font color=green>");
                        out.println("Available");
                        out.println("</font>");

                    }
rs.close();
st.close();
con.close();
%> 

