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
        <meta name="generator" content="Mobirise v3.7.3, mobirise.com">
        <meta name="description" content="Help users to manage their travel plans with a click of a button.">
        <link rel="shortcut icon" href="assets/images/hexa1-128x128-80.png" type="image/x-icon">
        <title>Plan Generate Interface</title>
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
    </head>
    <body>
        <!-- Open nav drawer extensive js -->
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
        
        
        <div class="animate-bottom">
            
            <!-- Upper section -->
            <div id="upper">
                <!-- Header -->
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
                                        <span style="font-size:50px;cursor:pointer" onclick="openNav()">&#9776;</span>
                                        <a class="navbar-caption text-danger" href="Main.html" style="padding: 0 0 0 50px; margin-bottom: 20px;">Travel Planning</a>
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

                <!-- Body -->
                <div class="container">
                    <%
                    // Get username; or just 'guest'
                    // Maybe try to determine whether this is the first time
                    // user tries to access the page -> change 'Welcome' accordingly
                    String username = "Krankai";
                    %>

                    <!-- Welcoming section: welcome user -->
                    <div id="welcome">
                        <h1 class="mbr-section-title display-1">Welcome back, <%=username%></h1>
                        <p style="margin-top: 30px">
                            Thank you for still trusting and using our services.<br>
                            Our three managers, each with different style, will help
                            you plan your trip ahead.<br>
                            <span>Please</span> choose your preferred manager.&nbsp;
                        </p>
                    </div>

                    <!-- Manager section: contain information about three managers -->
                    <div class="row">
                        <div class="col-md-2 col-md-offset-1 manager-box">
                            <img src="img/decker-manager.png" alt="decker-manager"
                                 width="100px" height="130px" class="center-block img-responsive">
                            <br>
                            <div class="description center-block">
                                Description for<br><span>Decker</span>.
                                <!-- Challenging trip; beautiful places -->
                            </div>
                        </div>
                        <div class="col-md-2 col-md-offset-2 manager-box">
                            <img src="img/internationale-manager.png" alt="internationale-manager"
                                 width="100px" height="130px" class="center-block img-responsive">
                            <br>
                            <div class="description center-block">
                                Description for<br><span>Internationale</span>.
                                <!-- People care about cusine / food / cultures -->
                            </div>
                        </div>
                        <div class="col-md-2 col-md-offset-2 manager-box">
                            <img src="img/olivia-manager.png" alt="olivia-manager"
                                 width="100px" height="130px" class="center-block img-responsive">
                            <br>
                            <div class="description center-block">
                                Description for<br><span>Olivia</span>.
                                <!-- People care about history / past -->
                            </div>
                        </div>
                    </div>
                    <br clear="both">
                    <div class="row">
                        <!-- Button for Decker -->
                        <div class="col-md-2 col-md-offset-1">
                            <button class="btn btn-primary choose-btn center-block">
                                <a href="#lower"><b>Choose</b></a>
                            </button>
                        </div>
                        <!-- Button for Internationale -->
                        <div class="col-md-2 col-md-offset-2">
                            <button class="btn btn-primary choose-btn center-block">
                                <a href="#lower"><b>Choose</b></a>
                            </button>
                        </div>
                        <!-- Button for Olivia -->
                        <div class="col-md-2 col-md-offset-2">
                            <button class="btn btn-primary choose-btn center-block">
                                <a href="#lower"><b>Choose</b></a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
            <br><br><br><br>
            
            <!-- Lower section: for getting input to plan the trip -->
            <!-- Note: still in body -->
            <div id="lower" class="container">
                <h1>Form section</h1>
            </div>
            
            <br style="clear: both">
            
            <!-- Footer -->
            <footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="main-footer1-0" style="background-color: rgb(50, 50, 50); padding-top: 1.75rem; padding-bottom: 1.75rem;">
                <div class="container">
                    <p class="text-xs-center"><strong>Copyright (c) 2016 Travel Planning.</strong></p>
                </div>
            </footer>
        </div>
                    
        <script src="assets/web/assets/jquery/jquery.min.js"></script>
        <script src="assets/tether/tether.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/smooth-scroll/SmoothScroll.js"></script>
        <script src="assets/viewportChecker/jquery.viewportchecker.js"></script>
        <script src="assets/dropdown/js/script.min.js"></script>
        <script src="assets/touchSwipe/jquery.touchSwipe.min.js"></script>
        <script src="assets/jarallax/jarallax.js"></script>
        <script src="assets/theme/js/script.js"></script>
        
        <!-- Back-to-top button -->
        <input name="animation" type="hidden">
        <div id="scrollToTop" class="scrollToTop mbr-arrow-up">
            <a style="text-align: center;"><i class="mbr-arrow-up-icon"></i></a>
        </div>
        
    </body>
</html>
