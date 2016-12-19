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
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
                <div class="wrapper-title">
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
                    <i style="font-size: 1.3em">days in</i>
                    <span class="text-city">Sydney</span>
                </div>
                <div class="col-md-2">
                    <img src="img/black-plane.png" class="center-block">
                </div>
                <div class="col-md-4 city-block">
                    <span class="number">4</span>
                    <i style="font-size: 1.3em">days in</i>
                    <span class="text-city">Canberra</span>
                </div>
            </div>
            
            <br>
            
            <!-- Display list of locations grouped by day visit -->
            <div class="wrapper-locations">
                <div>

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs nav-style" role="tablist">
                        <li role="presentation" class="active"><a href="#overview" aria-controls="overview" role="tab" data-toggle="tab">Overview</a></li>
                        <li role="presentation"><a href="#sydney" aria-controls="sydney" role="tab" data-toggle="tab">Sydney</a></li>
                        <li role="presentation"><a href="#canberra" aria-controls="canberra" role="tab" data-toggle="tab">Canberra</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="overview">
                            <ul>
                                <li class="block-text"><strong><em>Country</em>:</strong> Australia</li>
                                <li class="block-text"><strong><em>Cities</em>:</strong> Sydney and Canberra</li>
                                <li class="block-text"><strong><em>Duration</em>:</strong> 9 days</li>
                                <li class="block-text"><strong><em>Estimated budget</em>:</strong> $900</li>
                                <li class="block-text"><strong><em>Type</em>:</strong> Sightseeing</li>
                                <li class="block-text"><strong><em>Deploy date</em>:</strong> Unknown</li>
                            </ul>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="sydney">
                            <table width="100%">
                                <tr><h1 class="day-title">Day 1</h1></tr>
                                <tr>
                                    <td class="period-block">
                                        Morning
                                    </td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                            class="img-thumbnail" alt="location-img"</td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis. Donec tempor dictum
                                            metus quis efficitur. Morbi id eros diam.
                                            Maecenas fermentum nisl at pulvinar tristique.
                                            Sed ante turpis, egestas ac risus non,
                                            fringilla ultrices urna. Morbi pharetra
                                            consectetur ligula, posuere fermentum
                                            ante lobortis a. Donec quis fermentum erat.
                                            Mauris facilisis facilisis scelerisque.
                                            In sed lobortis felis.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="period-block">
                                        Afternoon
                                    </td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                            class="img-thumbnail" alt="location-img"</td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis. Donec tempor dictum
                                            metus quis efficitur. Morbi id eros diam.
                                            Maecenas fermentum nisl at pulvinar tristique.
                                            Sed ante turpis, egestas ac risus non,
                                            fringilla ultrices urna. Morbi pharetra
                                            consectetur ligula, posuere fermentum
                                            ante lobortis a. Donec quis fermentum erat.
                                            Mauris facilisis facilisis scelerisque.
                                            In sed lobortis felis.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="period-block">Evening</td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                            class="img-thumbnail" alt="location-img"</td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis. Donec tempor dictum
                                            metus quis efficitur. Morbi id eros diam.
                                            Maecenas fermentum nisl at pulvinar tristique.
                                            Sed ante turpis, egestas ac risus non,
                                            fringilla ultrices urna. Morbi pharetra
                                            consectetur ligula, posuere fermentum
                                            ante lobortis a. Donec quis fermentum erat.
                                            Mauris facilisis facilisis scelerisque.
                                            In sed lobortis felis.</p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="canberra">
                            Locations visit in Canberra
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div id="footer">
            <jsp:include page="_footer.jsp" flush="true" />
        </div>
    </body>
</html>
