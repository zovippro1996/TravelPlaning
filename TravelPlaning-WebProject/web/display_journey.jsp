<%-- 
    Document   : display_journey
    Created on : Dec 14, 2016, 5:17:23 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, Data.*, Control.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Display information about the journey">
        <link rel="shortcut icon" href="assets/images/hexa1-128x128-80.png" type="image/x-icon">
        <title>Display Journey</title>
        <link rel="stylesheet" type="text/css" href="css/display_journey_style.css">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
        <link href="https://fonts.googleapis.com/css?family=Lato:700" rel="stylesheet">
        <link rel="stylesheet" href="assets/et-line-font-plugin/style.css">
        <link rel="stylesheet" href="assets/bootstrap-material-design-font/css/material.css">
        <link rel="stylesheet" href="assets/tether/tether.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/socicon/css/socicon.min.css">
        <link rel="stylesheet" href="assets/animate.css/animate.min.css">
        <link rel="stylesheet" href="assets/dropdown/css/style.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
    </head>
    <body>
        <div id ="header">
            <jsp:include page="_header.jsp" flush="true" />
        </div>
        <div class="container" id="body-display">
            <!-- Panel -->
            <div id="panel">
                <div class="wrapper">
                    <div id="title-block">
                        <span class="days">
                            <span class="num-class">9</span>
                            <span class="text-class">DAYS</span>
                        </span>
                        <span class="border"></span>
                        <span class="title">
                            Australia
                        </span>
                    </div>
                </div>
            </div>
            
            <br>
            
            <!-- Display visited cities -->
            <div class="row">
                <div class="col-md-offset-1 col-md-4 city-block">
                    <span class="number">5</span>
                    <i>days in</i>
                    <span class="text-city">Sydney</span>
                </div>
                <div class="col-md-offset-2 col-md-4 city-block">
                    <span class="number">4</span>
                    <i>days in</i>
                    <span class="text-city">Canberra</span>
                </div>
            </div>
            
            <br>
            
            <!-- Display list of locations grouped by day visit -->
            <div class="wrapper-locations">
                
            </div>
            
        </div>
        <div id="footer">
            <jsp:include page="_footer.jsp" flush="true" />
        </div>
    </body>
</html>