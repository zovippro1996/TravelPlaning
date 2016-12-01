<%-- 
    Document   : _header
    Created on : Nov 17, 2016, 2:08:13 PM
    Author     : krankai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Data.*" %>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/input_getting_style.css">
<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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

<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
        document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginLeft= "0";
        document.body.style.backgroundColor = "white";
    }
</script>

<section id="index-menu-0">
    <nav class="navbar navbar-dropdown bg-color transparent navbar-fixed-top">
        <div class="container">
            <div class="mbr-table">
                <div class="mbr-table-cell">
                    <div class="navbar-brand">
                        <div id="mySidenav" class="sidenav" style="z-index: 3;">
                            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                            <img src ="assets/images/avatar.png" />
                            <a href="#">Username:</a>
                            <a href="#">Email:</a>
                            <a href="#">Previous trips:</a>
                            <a href="#">Sign out</a>
                        </div>
                        
                        <%
                            // If user has logged in, display drop-down bar
                            // If not, hide it
                            User user = (User) session.getAttribute("user");
                            
                            if (user != null) { 
                        %>
                        <span style="font-size:50px;cursor:pointer" onclick="openNav()">&#9776;</span>
                        <% } %>
                        <a class="navbar-caption text-danger" href="main.html" style="padding: 0 0 0 50px; margin-bottom: 20px;">Travel Planning</a>
                    </div>
                </div>
                <div class="mbr-table-cell">
                    <button class="navbar-toggler pull-xs-right hidden-md-up" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="hamburger-icon"></div>
                    </button>

                    <ul class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm" id="exCollapsingNavbar">
                        <li class="nav-item"><a class="nav-link link" href="#" aria-expanded="false">Contact</a></li>
                        <li class="nav-item"><a class="nav-link link" href="index.html" aria-expanded="false">Login/Logout</a></li>
                        <li class="nav-item nav-btn"><a class="nav-link btn btn-secondary-outline btn-secondary" href="booking.html">Start Travel Now!</a></li>
                    </ul>
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="close-icon"></div>
                    </button>
                </div>
            </div>
        </div>
    </nav>
</section>
