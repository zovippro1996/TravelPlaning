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
                    <h3>Please choose your preferred manager</h3>
                </div>
                
                <!-- Manager section: contain information about three managers -->
                    <div class="row">
                        <div class="col-md-2 col-md-offset-1 manager-box">
                            <img src="img/decker-manager.png" alt="decker-manager"
                                 width="100px" height="130px" class="center-block">
                            <br>
                            <div class="description center-block">
                                Description for <span>Decker</span>.
                            </div>
                            <br>
                            <button class="btn btn-info btn-md center-block">
                                <b>Decker</b>
                            </button>
                        </div>
                        <div class="col-md-2 col-md-offset-2 manager-box">
                            <img src="img/internationale-manager.png" alt="internationale-manager"
                                 width="100px" height="130px" class="center-block">
                            <br>
                            <div class="description center-block">
                                Description for <span>Internationale</span>.
                            </div>
                            <br>
                            <button class="btn btn-info btn-md center-block">
                                <b>Internationale</b>
                            </button>
                        </div>
                        <div class="col-md-2 col-md-offset-2 manager-box">
                            <img src="img/olivia-manager.png" alt="olivia-manager"
                                 width="100px" height="130px" class="center-block">
                            <br>
                            <div class="description center-block">
                                Description for <span>Olivia</span>.
                            </div>
                            <br>
                            <button class="btn btn-info btn-md center-block">
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
