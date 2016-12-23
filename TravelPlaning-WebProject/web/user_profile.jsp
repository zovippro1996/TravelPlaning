<%-- 
    Document   : user_profile
    Created on : Dec 3, 2016, 10:39:38 PM
    Author     : zovippro1996
--%>
<%@page import="Control.ImageControl"%>
<%@page import="Data.*"%>
<%@page import="Connect.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="Control.UserControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="generator" content="Mobirise v3.7.3, mobirise.com">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="assets/images/hexa1-128x128-80.png" type="image/x-icon">
        <meta name="description" content="Help users to manage their travel plans with a click of a button.">
        
        <title>Profile</title>
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
        <link rel="stylesheet" href="assets/et-line-font-plugin/style.css">
        <link rel="stylesheet" href="assets/bootstrap-material-design-font/css/material.css">
        <link rel="stylesheet" href="assets/tether/tether.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/socicon/css/socicon.min.css">
        <link rel="stylesheet" href="assets/animate.css/animate.min.css">
        <link rel="stylesheet" href="assets/dropdown/css/style.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
        
        <style type="text/css">
            
            img.bg {
            /* Set rules to fill background */
                min-height: 100%;
                min-width: 1024px;
	
            /* Set up proportionate scaling */
                width: 100%;
                height: auto;
	
            /* Set up positioning */
                position: fixed;
                top: 0;
                left: 0;
            }

            @media screen and (max-width: 1024px) { /* Specific to this particular image */
                img.bg {
                    left: 50%;
                    margin-left: -512px;   /* 50% */
                }
            }
            
            .personalinfo{
                margin-bottom: 3%;
                font-size: 135%;
            }
            
            .divider{
                position:absolute;
                left:50%;
                top:35%;
                bottom:5%;
                border-left:3px solid white;
            } 
            
            .outmost{
                align-content:center; 
                margin-left: 15%; 
                margin-right: 15%; 
                margin-top: 6%;  
                position:relative ; 
                padding-top: 1%; 
                padding-bottom:1%;
            }
            
            .personalwrap{
                background-color:#6fb89c; 
                border-radius: 12px;  
                margin-left: 5%; 
                margin-right: 5%;
                margin-top: 4.5%; 
                margin-bottom: 3%; 
                padding-top:1%; 
                position:relative; 
                padding-bottom: 2%
            }
            
            .personalrightwrap{
                border-radius: 12px;
                background-color: #92ffc2;
                padding-left: 3%;
                padding-right: 3%;
                padding-bottom:2%;
                width:30%; 
                float: right;
                position: relative;
                margin-right: 10%;
            }
            
            .personalrighttitle{
                 
                background-color: violet; 
                text-align: center; 
                font-size:185%;
            }
            
            
            
            .avatarcss{
                position: relative;
                width:145px; 
                height:130px ; 
                padding-right: 2%; 
                
                float:left;
            }
            
            .achievenumber{
                margin-left: 3.5%;
                font-size: 150%;
                font-weight: 500;
            }
            
            .journey_index{
                font-size:140%;
                
                
                
            }
            
            .journey_type{
                font-size: 80%;
                color:green;
               font-weight: 600;
            }
            
        </style>
          <!-- Initialize Connection and Object-->
         <%
            Connection c = DBConnect.getConnection();
            String ID = request.getParameter("UserID");
            int UserID = 0;
            UserID = Integer.parseInt(ID);
            User u = new User();

            Statement st = c.createStatement();
            ResultSet rs;
            String query = "SELECT * FROM Users WHERE UserID='" +UserID + "'";
            rs = st.executeQuery(query);
            if (rs.next()) {
                u.setUsername(rs.getString("Username"));
                u.setFullname(rs.getString("Fullname"));
                u.setDOB(rs.getDate("DOB"));
                u.setGender(rs.getString("Gender"));
                u.setPhone(rs.getString("Phone"));
                u.setEmail(rs.getString("Email"));
                u.setCountry(rs.getString("Country"));
                u.setCity(rs.getString("City"));
                
               
            }
        %>
    </head>
    
       
    <body>
        
        
        <!-- Banner -->
        <jsp:include page="_header.jsp" flush="true" />
         
        <img class="bg" src="img/background_user_profile.jpg" alt="img/avatartest.jsp">
        
        <!-- Outmost DIV -->     
        <div class="outmost">
            
            
            
            <!-- Personal Info. -->
            <div class="personalwrap">
                
                <!-- Avatar + Name -->
                <div style="background-color: #40a0b2; padding-left: 3%; ">
                    <div>
                         <div id="picture">
                <!--Getting User Avatar from Dropbox repository-->
                <img src="<%=ImageControl.importUserAvatar(UserID)%>" 
                     alt="img/avatartest.jpg" class="avatarcss " />
                
                </div>
                    </div>    
                    
                    
                    <!-- Name + username -->
                    <div style="padding-top:6.3%;">
                        <div style="font-size: 190%; font-weight: 600; color: white">
                            <%=u.getFullname()%>
                            
                        </div>    
                        
                        <div style="color:#d3ffee; margin-bottom: 3%;" >                        
                            @<%=u.getUsername()%>
                        </div>
                    </div>    
                </div>
                
                
                <div>    
                    <!-- Right -->
                    <div class="personalrightwrap">
                        <div class="personalrighttitle">
                            Achievements.                      
                        </div>
                        
                        <br>
                        <ul>
                            <li><b>DAYS</b> of travel: <span class="achievenumber">11</span> </li>                          
                            <li>Total <b>COUNTRIES</b> visited: <span class="achievenumber">3</span></li>
                            <li>Total <b>LOCATIONS</b> visited: <span class="achievenumber">9</span></li>  
                        </ul>
                        
                    </div>
                    
                    <!-- Divider -->
                    <div class ="divider">               
                    </div>
                    
                    
                    <!-- Left -->
                    <div style="margin-left:3%; width:45%; ">
                                            
                        <!-- Personal Information Form -->
                        
                        
                        <div  style =" margin-top:7%; ">
                            <div class="personalinfo">    
                                Birthday : 
                                <% Calendar cal = Calendar.getInstance();
                                cal.setTime(u.getDOB());
                                int month = cal.get(Calendar.MONTH) + 1;
                                String monString = new String();
                                
                                if(month==1) monString="January";
                                else if(month==2) monString="February";
                                    else if(month==3) monString="March";
                                        else if(month==4) monString="April";
                                            else if(month==5) monString="May";
                                                else if(month==6) monString="June";
                                                    else if(month==7) monString="July";
                                                       else if(month==2) monString="August";
                                                            else if(month==2) monString="September";
                                                                else if(month==2) monString="October";
                                                                    else if(month==2) monString="November";
                                                                         else if(month==2) monString="December";
                                
                                int day = cal.get(Calendar.DAY_OF_MONTH);
                                int year = cal.get(Calendar.YEAR); 
                                out.print(monString +" "+ day+", "+ year); %>
                
                            </div>
                            
                            <div class="personalinfo">
                                Gender : 
                                    <%
                                    if (u.getGender().equals("M")) out.print("Male");
                                    else if (u.getGender().equals("F")) out.print("Female");
                                    else if (u.getGender().equals("O")) out.print("Other");
                                    %>
                            </div>
                            
                            <div class="personalinfo">
                                Mobile Phone : <%=u.getPhone()%>
                            </div>
                            
                            <div class="personalinfo">
                                Email: <%=u.getEmail()%>
                            </div>
                            
                            <div class="personalinfo">
                                Country: <%=u.getCountry()%>
                                <% if (!u.getCity().isEmpty()) out.print(" ("+u.getCity()+")"); %>
                            </div>
                            
                            
                            
                        </div>    
                    </div>
                    
                </div>             
            </div>
            <!-- END of Personal Information -->
            
            <br>
            
            <!-- - - - - - - - Journey HERE - - - - - - - - - - -->         
            
            <div style="background-color: #74b38b; margin-bottom: 5%; padding:2%;  border: 4.5px solid #378a80; border-radius: 8px; ">
                
                <div style="color:white; font-family: Comic Sans MS; font-weight: 600; text-align: center; font-size: 350%">The Journey</div>
                
                <br>
                <br>
                
                  <div class="panel panel-default">
                    <div class="panel-heading journey_index">
                        <a href="display_journey.jsp?action=view&amp;id=1">No. #1</a>
                          
                    </div>
                    
                    <div class="panel-body">
                        Educational
                        
                        <br>
                        
                        Deploy Date: December 12, 2016
                        
                        <br>
                        
                        Duration: 4 days
                        
                        <br>
                        
                                
                        
                    </div>
                </div>
                      
                
            </div>
            
            
            <!-- END of Journey -->
            
        </div>        
        
        <!--Banner -->
        <jsp:include page="_footer.jsp" flush="true"/>
    </body>
</html>
