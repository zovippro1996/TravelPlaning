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
<%@page import="java.util.ArrayList;"%>
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
                font-size: 135%;
            }

            .divider{
                position:absolute;
                left:50%;
                top:40%;
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

            }

            .personalwrap{
                position:relative; 
                background-color:#6fb89c; 
                border-radius: 12px;  
                margin-left: 5%; 
                margin-right: 5%;
                margin-top: 4.5%; 
                margin-bottom: 5.5%;
                padding-top:1%; 
                padding-bottom:3%;

            }

            .personalrightwrap{
                border-radius: 12px;
                background-color: #92ffc2;
                padding-left: 3%;
                padding-right: 3%;
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
                height:125px; 
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
            
            .journey_outmost{
                background-color: #74b38b; 
                margin-bottom: 5%;  
                border: 4.5px solid #378a80; 
                border-radius: 8px;
            }
            
            .journey_title {
                color:white; 
                font-family: Comic Sans MS; 
                font-weight: 600; 
                text-align: center; 
                font-size: 350%
                
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
            String query = "SELECT * FROM Users WHERE UserID='" + UserID + "'";
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
        
         <%
            ArrayList<Journey> listJourney = new ArrayList();
            query = "SELECT * FROM Journeys WHERE UserID='" + UserID+"'";
            rs = st.executeQuery(query);
            while (rs.next()) {
                Journey journey = new Journey(rs.getInt("JourneyID"), rs.getInt("UserID"), rs.getString("DeployDate"), rs.getInt("DurationDate"), JourneyType.valueOf(rs.getString("TypeJourney")));
                listJourney.add(journey);
            }
        %>
        
        <%
            List<Comment> listComment = new ArrayList();
            query = "SELECT * FROM Comments WHERE UserID='" + UserID + "'";
            rs = st.executeQuery(query);
            while (rs.next()) {
                Comment comment = new Comment(rs.getInt("CommentID"), rs.getInt("UserID"),
                        rs.getInt("LocationID"), rs.getString("Description"), rs.getDouble("Rate"));
                listComment.add(comment);
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
                
                
                <% 
                    User user_session = (User) session.getAttribute("user");
                    
                    if((user_session != null)&&(UserID == user_session.getID())) { %>
                <div style="float:right">
                    <a href="update_profile.jsp" class="btn btn-info btn-xlg">
                        <span class="glyphicon glyphicon-cog">Update Profile</span>
                    </a>
                </div>
                <% } %>
                
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



                        <div style="font-size: 190%; font-weight: 600; color: white" id="fullname_display">

                            <%=u.getFullname()%>

                        </div>    

                        <!-- Username -->


                        <div style="color:#d3ffee; margin-bottom: 3%;" id="username_display" >                        
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
                            <li>Total <b>JOURNEYS</b>: <span class="achievenumber"><%=listJourney.size() %></span> </li>                          
                            <li>Total <b>RATES</b> : <span class="achievenumber"><%=listComment.size() %></span></li>

                        </ul>

                    </div>

                    <!-- Divider -->
                    <div class ="divider">               
                    </div>


                    <!-- Left -->
                    <div style="margin-left:3%; width:45%; ">

                        <!-- Personal Information Form -->


                        <!-- Birthday -->
                        <div  style =" margin-top:7%; ">

                            <div class="personalinfo" id="birthday_display">    
                                Birthday : 
                                <% Calendar cal = Calendar.getInstance();
                                    cal.setTime(u.getDOB());
                                    int month = cal.get(Calendar.MONTH) + 1;
                                    String monString = new String();

                                    if (month == 1) {
                                        monString = "January";
                                    } else if (month == 2) {
                                        monString = "February";
                                    } else if (month == 3) {
                                        monString = "March";
                                    } else if (month == 4) {
                                        monString = "April";
                                    } else if (month == 5) {
                                        monString = "May";
                                    } else if (month == 6) {
                                        monString = "June";
                                    } else if (month == 7) {
                                        monString = "July";
                                    } else if (month == 2) {
                                        monString = "August";
                                    } else if (month == 2) {
                                        monString = "September";
                                    } else if (month == 2) {
                                        monString = "October";
                                    } else if (month == 2) {
                                        monString = "November";
                                    } else if (month == 2) {
                                        monString = "December";
                                    }

                                    int day = cal.get(Calendar.DAY_OF_MONTH);
                                    int year = cal.get(Calendar.YEAR);
                                    out.print(monString + " " + day + ", " + year); %>

                            </div>


                            <!-- Gender -->
                            <div class="personalinfo">
                                Gender : 
                                <%
                                    if (u.getGender().equals("M")) {
                                        out.print("Male");
                                    } else if (u.getGender().equals("F")) {
                                        out.print("Female");
                                    } else if (u.getGender().equals("O")) {
                                        out.print("Other");
                                    }
                                %>
                            </div>


                            <!-- Phone -->
                            <div class="personalinfo">
                                Mobile Phone : <%=u.getPhone()%>
                            </div>


                            <!-- Email -->
                            <div class="personalinfo">
                                Email: <%=u.getEmail()%>
                            </div>


                            <!-- Country + City -->
                            <div class="personalinfo">
                                Country: <%=u.getCountry()%>
                                <% if (!u.getCity().isEmpty()) {
                                        out.print(" (" + u.getCity() + ")");
                                    }%>
                            </div>



                        </div> 
                    </div>

                </div>             
            </div>
            <!-- END of Personal Information -->

            <br>


            <!-- - - - - - - - Journey HERE - - - - - - - - - - -->         

            <div class="journey_outmost">

                
                <div class="journey_title">The Journey</div>

                <br>
                <br>
                
                <%
                for (Journey journey : listJourney) {
                %> 
                <div class="panel panel-default" style=" margin-left: 4%; margin-right: 4%">
                    
                    
                     <% if((user_session != null)&&(UserID == user_session.getID())) { %>
                     
                     <form action="JourneyProcessing" method="post">
                    <div style="text-align:right; ">
                        <input type="hidden" name="id" value="<%=journey.getID()%>">
                        <button type="submit" name="action" class="btn btn-info btn-xlg" style="background: red; ">
                            <span class="glyphicon glyphicon-remove">Remove</span>
                        </button>
                    </div>
                     </form>
                     <% } %>
                    
                     
                    <div class="panel-heading journey_index">
                        <a href="display_journey.jsp?action=view&amp;id=<%=journey.getID()%>">No. <%=journey.getDeployDate()%> </a>

                    </div>

                    <div class="panel-body">
                        Type: <%=journey.getType()%>

                        <br>

                        Budget: <%=journey.getBudget() %>

                        <br>

                        Duration: <%=journey.getDuration() %>

                        <br>
                        
                    </div>
                </div>
                
                     <% } %>

            </div>


            <!-- END of Journey -->

        </div>        

        <!--Banner -->
        <jsp:include page="_footer.jsp" flush="true"/>

    </body>
</html>
