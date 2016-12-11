<%-- 
    Document   : user_profile
    Created on : Dec 3, 2016, 10:39:38 PM
    Author     : zovippro1996
--%>

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
        
        
        <style type="text/css">
            
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
                
                width:30%; 
                float: right;
                position: relative;
                margin-right: 10%;
            }
            
            .personalrighttitle{
                 
                background-color: violet; 
                text-align: center; 
                 
                 
                font-size:150%;
            }
            
            
            
            .avatarcss{
                width:150px; 
                height:150px; 
                padding-right: 2%; 
                padding-bottom:2%;
                float:left;
            }
            
        </style>
        
    </head>
    
    
    
    
    
    
    <body>
        
        
        <!-- Banner -->
        <jsp:include page="_header.jsp" flush="true" />
        <jsp:useBean id="user" scope="session" class="Data.User" />
        
        <!-- Outmost DIV -->     
        <div class="outmost">
            
            
            
            <!-- Personal Info. -->
            <div class="personalwrap">
                
                <!-- Avatar + Name -->
                <div style="background-color: #40a0b2; padding-left: 3%; ">
                    <div>
                        <img src="<jsp:getProperty name="user" property="User_Avatar" />" alt="HTML5 Icon" class="avatarcss"> 
                    </div>    
                    
                    
                    <!-- Name + username -->
                    <div style="padding-top:6.3%;">
                        <div style="font-size: 160%; font-weight: 600; color: white">
                           <jsp:getProperty name="user" property="fullname" />
                            
                        </div>    
                        
                        <div style=" color:#d3ffee" >                        
                            <jsp:getProperty name="user" property="username" />
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
                        
                        <div>
                            DAYS of travel:                           
                        </div>
                        
                        <br>
                        
                        <div>
                            Total COUNTRIES visited: 
                        </div>
                        
                        <br>
                        
                        <div>
                            Total LOCATION visited: 
                        </div>
                        
                        
                    </div>
                    
                    <!-- Divider -->
                    <div class ="divider">               
                    </div>
                    
                    
                    <!-- Left -->
                    <div style="margin-left:3%; width:45%; ">
                                            
                        <!-- Personal Information Form -->
                        
                        
                        <div  style =" margin-top:7%; ">
                            <div class="personalinfo">    
                                Birthday : <jsp:getProperty name="user" property="DOB" />       
                            </div>
                            
                            <div class="personalinfo">
                                Gender : <jsp:getProperty name="user" property="gender" />
                            </div>
                            
                            <div class="personalinfo">
                                Mobile Phone : <jsp:getProperty name="user" property="phone" />
                            </div>
                            
                            <div class="personalinfo">
                                Email: <jsp:getProperty name="user" property="email" />
                            </div>
                            
                            <div class="personalinfo">
                                Country: <jsp:getProperty name="user" property="country" />
                            </div>
                            
                        </div>    
                    </div>
                    
                </div>             
            </div>
            <!-- END of Personal Information -->
            
            
            
            <!-- - - - - - - - Journey HERE - - - - - - - - - - -->         
            
            <div style="background-color: red; color: white; margin-bottom: 5%;">
                This is Account's Journeys <br> Input here <br><br>
            </div>
            
            
            <!-- END of Journey -->
            
        </div>        
        
        <!--Banner -->
        <jsp:include page="_footer.jsp" flush="true"/>
    </body>
</html>
