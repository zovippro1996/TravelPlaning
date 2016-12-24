<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Oct. 29 2016 Stevano, main.html -->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="generator" content="Mobirise v3.7.3, mobirise.com">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="assets/images/hexa1-128x128-80.png" type="image/x-icon">
        <meta name="description" content="Help users to manage their travel plans with a click of a button.">
        <title>Main Page Of Travel Planning Web Project</title>
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
        
        <%@page import="Control.ImageControl"%>
<%@page import="Data.*"%>
<%@page import="Connect.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>



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
                document.getElementById("main").style.marginLeft = "0";
                document.body.style.backgroundColor = "white";
            }
        </script>

        <section id="main" style="width: 100%;">

            <jsp:include page="_header.jsp" flush="true"/>

            <section class="engine"><a rel="external" href=""></a></section><section class="mbr-section mbr-section-hero mbr-section-full mbr-parallax-background mbr-section-with-arrow mbr-after-navbar" id="index-header1-0" style="background-image: url(assets/images/jumbotron.jpg);">

                <div class="mbr-overlay" style="opacity: 0; background-color: rgb(255, 255, 255);"></div>

                <div class="mbr-table-cell">

                    <div class="container">
                        <div class="row">
                            <div class="mbr-section col-md-10 col-md-offset-1 text-xs-center">

                                <h1 class="mbr-section-title display-1">Your Travel Plan with Click of a Button</h1>
                                <p class="mbr-section-lead lead"><br> "Travel Planning is the travel organizing web app that automagically creates a master itinerary for every trip so you can access all your travel plans, anytime, on any device."&nbsp;</p>
                                <div class="mbr-section-btn"> <a class="btn btn-lg btn-primary" href="input_getting.jsp">Start Travelling</a> </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mbr-arrow mbr-arrow-floating" aria-hidden="true"><a href="#main-header3-0"><i class="mbr-arrow-icon"></i></a></div>

            </section>

            <section class="mbr-section mbr-section__container" id="main-header3-0" style="background-color: rgb(239, 239, 239); padding-top: 20px; padding-bottom: 20px;">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <h3 class="mbr-section-title display-2">Newest destination to travel!</h3>
                            <small class="mbr-section-subtitle"></small>
                        </div>
                    </div>
                </div>
            </section>

            <section class="mbr-cards mbr-section mbr-section-nopadding" id="index-features3-0" style="background-color: rgb(255, 255, 255);">
<div class="mbr-cards-row row">
                     <!--Get newest Location objects from database--> 
        <%
            Connection c = DBConnect.getConnection();

            Statement st = c.createStatement();
            ResultSet rs;
            String query = "SELECT * FROM Locations ORDER BY LocationID DESC LIMIT 3";
            rs = st.executeQuery(query);
            while (rs.next()) {
               %> 
               <div class="mbr-cards-col col-xs-12 col-lg-4" style="padding-top: 80px; padding-bottom: 80px;">
                        <div class="container">
                            <div class="card cart-block">
                                <div class="card-img"><img src="<%=ImageControl.importLocationImage(rs.getInt("LocationID"))%>" class="card-img-top"></div>
                                <div class="card-block">
                                    <h4 class="card-title"><%=rs.getString("NameLocation")%></h4>
                                    <h5 class="card-subtitle"><%=rs.getString("TypeLocation")%></h5>
                                    <p class="card-text"><%=rs.getString("Description")%></p>
                                    <div class="card-btn"><a href="view_location.jsp?LocationID=<%=rs.getInt("LocationID")%>" class="btn btn-primary">VIEW LOCATION</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                                            <%
               
                
            }
        %>

                
                    
<!--                    <div class="mbr-cards-col col-xs-12 col-lg-4" style="padding-top: 80px; padding-bottom: 80px;">
                        <div class="container">
                            <div class="card cart-block">
                                <div class="card-img"><img src="assets/images/Thailand.jpg" class="card-img-top"></div>
                                <div class="card-block">
                                    <h4 class="card-title">Thailand</h4>
                                    <h5 class="card-subtitle">Thailand template plans</h5>
                                    <p class="card-text">Lorem ipsum dolor sit amet.</p>
                                    <div class="card-btn"><a href="input_getting.jsp?location=Thailand" class="btn btn-primary">BOOK IT</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mbr-cards-col col-xs-12 col-lg-4" style="padding-top: 80px; padding-bottom: 80px;">
                        <div class="container">
                            <div class="card cart-block">
                                <div class="card-img"><img src="assets/images/Thailand.jpg" class="card-img-top"></div>
                                <div class="card-block">
                                    <h4 class="card-title">France</h4>
                                    <h5 class="card-subtitle">France template plans</h5>
                                    <p class="card-text">Lorem ipsum dolor sit amet.</p>
                                    <div class="card-btn"><a href="input_getting.jsp?location=France" class="btn btn-primary">BOOK IT</a></div>
                                </div>
                            </div>
                        </div>
                    </div>-->



                </div>
            </section>

            <section class="mbr-section mbr-section-hero mbr-section-full mbr-parallax-background" id="index-header2-0" style="background-image: url(assets/images/landscape.jpg);">

                <div class="mbr-overlay" style="opacity: 0.3; background-color: rgb(0, 0, 0);">
                </div>

                <div class="mbr-table mbr-table-full">
                    <div class="mbr-table-cell">

                        <div class="container">
                            <div class="mbr-section row">
                                <div class="mbr-table-md-up">




                                    <div class="mbr-table-cell mbr-right-padding-md-up col-md-5 text-xs-center text-md-right">

                                        <h3 class="mbr-section-title display-2">Feature Travelers</h3>

                                        <div class="mbr-section-text lead">
                                            <p>See all previous trips from our selected travelers.</p>
                                        </div>

                                        <div class="mbr-section-btn"><a class="btn btn-primary" href="user_profile.jsp?UserID=1">MORE</a></div>

                                    </div>
                                    <div class="mbr-table-cell mbr-valign-top col-md-7">
                                        <div class="mbr-figure"><img src="assets/images/coworkers.jpg"></div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>



            </section>

            <section class="mbr-section mbr-parallax-background" id="main-testimonials3-0" style="background-image: url(assets/images/landscape2.jpg); padding-top: 120px; padding-bottom: 120px;">

                <div class="mbr-overlay" style="opacity: 0.5; background-color: rgb(34, 34, 34);">
                </div>

                <div class="mbr-section mbr-section__container mbr-section__container--middle">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 text-xs-center">
                                <h3 class="mbr-section-title display-2">WHAT OUR FANTASTIC USERS SAY</h3>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="mbr-testimonials mbr-section mbr-section-nopadding">
                    <div class="container">
                        <div class="row">

                            <div class="col-xs-12 col-lg-4">

                                <div class="mbr-testimonial card">
                                    <div class="card-block"><p>“its really very amazing web that makes me finish our honey moon plan in 3 minutes ( that's usually takes more than 1 hours at least from me if i did it from scratch).<span style="font-size: 1.125rem; line-height: 2;">&nbsp;i&nbsp;</span><span style="font-size: 1.125rem; line-height: 2;">hope to have a chance to visit this web page again in the future”</span></p></div>
                                    <div class="mbr-author card-footer">

                                        <div class="mbr-author-name">Job S.</div>

                                    </div>
                                </div>
                            </div><div class="col-xs-12 col-lg-4">

                                <div class="mbr-testimonial card">
                                    <div class="card-block"><p>“First of all hands off to you guys for your effort and nice, super tool. Good work! We are expecting the new version soon with advance functionality with full bootstrap design. Great effort and superb UI experience with on-point function.”</p></div>
                                    <div class="mbr-author card-footer">

                                        <div class="mbr-author-name">Gate B.</div>

                                    </div>
                                </div>
                            </div><div class="col-xs-12 col-lg-4">

                                <div class="mbr-testimonial card">
                                    <div class="card-block"><p>“At first view, looks like a nice web application, i like the great focus and time that was given to the responsive design, i also like the simple and clear booking function. The suggestions are convinence and helpful as well! ”</p></div>
                                    <div class="mbr-author card-footer">

                                        <div class="mbr-author-name">Mark Z.</div>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

            </section>

            <footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="main-footer1-0" style="background-color: rgb(50, 50, 50); padding-top: 1.75rem; padding-bottom: 1.75rem;">

                <div class="container">
                    <p class="text-xs-center"><strong>Copyright (c) 2016 Travel Planning.</strong></p>
                </div>
            </footer>


            <script src="assets/web/assets/jquery/jquery.min.js"></script>
            <script src="assets/tether/tether.min.js"></script>
            <script src="assets/bootstrap/js/bootstrap.min.js"></script>
            <script src="assets/smooth-scroll/SmoothScroll.js"></script>
            <script src="assets/viewportChecker/jquery.viewportchecker.js"></script>
            <script src="assets/dropdown/js/script.min.js"></script>
            <script src="assets/touchSwipe/jquery.touchSwipe.min.js"></script>
            <script src="assets/jarallax/jarallax.js"></script>
            <script src="assets/theme/js/script.js"></script>


            <input name="animation" type="hidden">
            <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon"></i></a></div>


        </section>
    </body>
</html>

