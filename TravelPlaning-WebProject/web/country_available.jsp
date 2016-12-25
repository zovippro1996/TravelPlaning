<%@ page import="java.io.*,java.sql.*, Connect.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<% 
                    String sn=request.getParameter("ver");
                    
                    Connection con = DBConnect.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT LocationID FROM Locations WHERE Country = '" + sn + "';");
                    if(rs.next())
                    {    
                        out.println("<font color=green>");
                        out.println("Available");
                        out.println("</font>");
                    } else {
                        out.println("<font color=red>");
                        out.println("Not Available");
                        out.println("</font>");
                    }
rs.close();
st.close();
con.close();
%> 

