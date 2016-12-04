<%-- 
    Document   : view_location
    Created on : Dec 4, 2016, 10:23:12 AM
    Author     : CREAT10N
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Location Page</title>
        <link rel="stylesheet" href="assets/et-line-font-plugin/style.css">
        <link rel="stylesheet" href="assets/bootstrap-material-design-font/css/material.css">
        <link rel="stylesheet" href="assets/tether/tether.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/socicon/css/socicon.min.css">
        <link rel="stylesheet" href="assets/animate.css/animate.min.css">
        <link rel="stylesheet" href="assets/dropdown/css/style.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
        <style>
            *{
                margin: 0px auto;
                padding: 0px;
                box-sizing: border-box;
            }

            #footer{
                position: absolute;
                bottom: 0px; 
                width: 100%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="_header.jsp" flush="true"/>

        <div class="container" id="location">
            <div id="title">

            </div>
            <div id="picture">

            </div>
            <div id="rated">

            </div>
            <div id="description">

            </div>
        </div>

        <div class="container" id="comment">

        </div>

        <div id="footer">
            <jsp:include page="_footer.jsp" flush="true"/>
        </div>
    </body>
</html>
