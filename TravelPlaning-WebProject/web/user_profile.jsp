<%-- 
    Document   : user_profile
    Created on : Dec 3, 2016, 10:39:38 PM
    Author     : zovippro1996
--%>

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
  
        
        <style type="text/css">
            
            .personalinfo{
                margin-bottom: 3%;
                font-size: 135%;
            }
      
        </style>
  
    </head>
    
    
    
    
    
    
    <body>
        
        
        <!-- Banner -->
        <jsp:include page="_header.jsp" flush="true" />
        
        
        <!-- Outmost DIV -->     
        <div style="align-content:center; background-color: gray; margin-left: 15%; margin-right: 15%; margin-top: 7.5%;  position:relative">
            
            
            
            <!-- Personal Info. -->
            <div style="background-color:green;  margin: 8%; padding-top:2.5%; position:relative; padding-bottom: 2%">
                
                <!-- Left -->
                <div style="background-color: blue; margin-left:2.8%; margin-right: 45%; ">
                    
                    <!-- Avatar + Name -->
                    <div style = "background-color: greenyellow; margin-bottom: 2%; ">
                        <div>
                            <img src="img/avatartest.jpg" alt="HTML5 Icon" style="width:150px; height:150px; padding-right: 4%; padding-bottom:4%;float:left; " > 
                        </div>    
                        
                        
                        <!-- Name + username -->
                        <div>
                            <div style="padding-top:12.75%;  font-size: 160%; background-color: purple">
                                First Name + Last Name
                                    
                            </div>    
                            
                            <div>                        
                                @username
                            </div>
                        </div>    
                    </div>
                    
                    
                    
                    <!-- Personal Information -->
                    
                    
                    <div  style ="background-color: pink; margin-top:7%; ">
                        <div class="personalinfo">    
                            Birthday;           
                        </div>
                        
                        <div class="personalinfo">
                            Gender:
                        </div>
                            
                        <div class="personalinfo">
                            Mobile Phone:
                        </div>
                            
                        <div class="personalinfo">
                            Email:
                        </div>
                            
                        <div class="personalinfo">
                            Country:
                        </div>
                            
                    </div>    
                </div>
                
                
                <!-- Right -->
                <div>
                    
                    
                </div>
                
                
                
            </div>
            
            
            
            
            <!-- - - - - - - - Journey HERE - - - - - - - - - - -->
            <!--         Thinh                 -->
            
            <div style="background-color: black; color: white; font-weight: 600; margin-bottom: 5%; ">
                This is Account's Journeys <br> Input here
            </div>
            
            
            
            
        </div>        
            
        <!--Banner -->
        <jsp:include page="_footer.jsp" flush="true"/>
    </body>
</html>
