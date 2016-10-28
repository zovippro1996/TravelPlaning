<%-- 
    Document   : plan-generated-interface
    Created on : Oct 27, 2016, 10:10:33 AM
    Author     : krankai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Plan Generate Interface</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="ManagerChoosingStyle.css">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
    </head>
    <body>
        <div id="wrapper" class="animate-bottom">
            <div id="header">
                <div id="header-name">Travel Planning</div>
            </div>
            
            <div class="container">
                <%
                    // Get username; or just 'guest'
                    // Maybe try to determine whether this is the first time
                    // user tries to access the page -> change 'Welcome' accordingly
                    String username = "Krankai";
                    %>
                    
                <div id="welcome">
                    <span>Welcome back, <% out.print(username); %></span>
                    <h3>Thank you for still trusting and using our services.</h3>
                    <h3>As you may already know, our three special managers are always ready
                        to help you plan your trip ahead</h3>
                    <h3>Please choose the one that suits your taste</h3>
                </div>
                
                <!-- Manager section: contain information about three managers -->
                    <div class="row">
                        <div class="col-md-4">
                            <img src="img/decker-manager.png" alt="decker-manager"
                                 width="200px" height="260px" class="center-block">
                            <div class="description center-block">
                                Decker is a hiker and a true mountain climber. He
                                has traveled around the world and challenged some 
                                of the greatest obstacles of nature. If you want
                                a trip full of <span>adventurous</span> and
                                <span>thrilling</span> moments, Decker is the choice
                                for you.
                            </div>
                            <button type="button" class="btn btn-danger manager-button center-block">
                                <b>Decker</b>
                            </button>
                        </div>
                        <div class="col-md-4">
                            <img src="img/internationale-manager.png" alt="internationale-manager"
                                 width="200px" height="260px" class="center-block">
                            <div class="description center-block">
                                Internationale is a socialized person and an expert
                                in <span>cuisine</span> around the world. She has gone to many
                                great restaurant, and experienced food from every
                                cultures. So, if you are also a <span>food-oriented</span>
                                person, why not choose her.
                            </div>
                            <button type="button" class="btn btn-danger manager-button center-block">
                                <b>Internationale</b>
                            </button>
                        </div>
                        <div class="col-md-4">
                            <img src="img/olivia-manager.png" alt="olivia-manager"
                                 width="200px" height="260px" class="center-block">
                            <div class="description center-block">
                                Olivia is a traveler but also an archaeologist at
                                the same time. She has special interests in <span>history</span>
                                and <span>traditions</span> of countries all over
                                the world, and has studies them for a long time.
                                If you want to know more about the great past, just
                                ask her for advice.
                            </div>
                            <button type="button" class="btn btn-danger manager-button center-block">
                                <b>Olivia</b>
                            </button>
                        </div>
                    </div>
                </div>
            
            <br style="clear: both">
            
            <div id="footer">
                Travel Planning &copy; Copyright 2016 | All rights reserved.
            </div>
        </div>
    </body>
</html>
