<%-- 
    Document   : display_journey
    Created on : Dec 14, 2016, 5:17:23 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, Data.*, Control.*" %>
<%
    // Retrive journey from session (if being forwared to for generating journey purpose)
    Journey journey = (Journey) session.getAttribute("currentJourney");
%>
<%
    // Display if journey is available
    if (journey != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Display information about the journey">
        <link rel="shortcut icon" href="assets/images/hexa1-128x128-80.png" type="image/x-icon">
        <title>Display Journey</title>
        <link rel="stylesheet" type="text/css" href="css/display_journey_style.css">
        <script src="js/jquery-3.1.1.min.js"></script>
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
        <link rel="stylesheet" href="css/weather-icons.min.css" type="text/css">
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
                            <!-- Sample -->
                            <!-- <span class="num-class">9</span> -->
                            <span class="num-class"><%= journey.getDuration() %></span>
                            <span class="text-class">DAYS</span>
                        </span>
                        <span class="border"></span>
                        <!-- Sample -->
                        <!-- <span class="title">Australia</span> -->
                        <span class="title text-capitalize"><%= journey.getCountry().toLowerCase() %></span>
                    </div>
                </div>
            </div>
            
            <br>
            
            <!-- Display visited cities -->

            <!-- Sample -->
            <!-- <div class="row">
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
            </div> -->

            <% if (journey.getListCity().size() >= 2) {  /* 2 cities */ %>

            <div class="row">
                <div class="col-md-offset-1 col-md-4 city-block">
                    <span class="number"><%= journey.getDaysCity().get(0) %></span>
                    <i style="font-size: 1.3em">days in</i>
                    <span class="text-city text-capitalize"><%= journey.getListCity().get(0).toLowerCase() %></span>
                </div>
                <div class="col-md-2">
                    <img src="img/black-plane.png" class="center-block">
                </div>
                <div class="col-md-4 city-block">
                    <span class="number"><%= journey.getDaysCity().get(1) %></span>
                    <i style="font-size: 1.3em">days in</i>
                    <span class="text-city text-capitalize"><%= journey.getListCity().get(1).toLowerCase() %></span>
                </div>
            </div>

            <!-- Sample -->
            <!-- <div class="row">
                <div class="col-md-offset-4 col-md-4 city-block">
                    <span class="number">6</span>
                    <i style="font-size: 1.3em">days in</i>
                    <span class="text-city">Melbourne</span>
                </div>
            </div> -->

            <% } else { /* 1 city */ %>

            <div class="row">
                <div class="col-md-offset-4 col-md-4 city-block">
                    <span class="number"><%= journey.getDaysCity().get(0) %></span>
                    <i style="font-size: 1.3em">days in</i>
                    <span class="text-city text-capitalize"><%= journey.getListCity().get(0).toLowerCase() %></span>
                </div>
            </div>
            
            <% }    /* end of if .. else .. */ %>

            <br>
            
            <!-- Display list of locations grouped by day -->
            <div class="wrapper-locations">
                <div>

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs nav-style" role="tablist">
                        <!-- Overview tab -->
                        <li role="presentation" class="active"><a href="#overview" aria-controls="overview" role="tab" data-toggle="tab">Overview</a></li>

                        <!-- Sample -->
                        <!-- <li role="presentation"><a href="#sydney" aria-controls="sydney" role="tab" data-toggle="tab">Sydney</a></li>
                        <li role="presentation"><a href="#canberra" aria-controls="canberra" role="tab" data-toggle="tab">Canberra</a></li> -->

                        <!-- if 1 city -> 1 city tab only -->
                        <li role="presentation">
                            <a href="#first_city" aria-controls="first_city" role="tab" data-toggle="tab">
                                <span class="text-capitalize"><%= journey.getListCity().get(0) %></span>
                            </a>
                        </li>

                        <% if (journey.getListCity().size() >= 2) {  /* 2 cities --> 1 more city tab */ %>
                        
                        <li role="presentation">
                            <a href="#second_city" aria-controls="second_city" role="tab" data-toggle="tab">
                                <span class="text-capitalize"><%= journey.getListCity().get(1).toLowerCase() %></span>
                            </a>
                        </li>

                        <% } %>

                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <!-- Overview tab content -->
                        <div role="tabpanel" class="tab-pane fade in active" id="overview">
                            <!-- Sample -->
                            <!-- <ul>
                                <li class="block-text"><strong><em>Country</em>:</strong> Australia</li>
                                <li class="block-text"><strong><em>Cities</em>:</strong> Sydney <em>and</em> Canberra</li>
                                <li class="block-text"><strong><em>Duration</em>:</strong> 9 days</li>
                                <li class="block-text"><strong><em>Estimated budget</em>:</strong> $900</li>
                                <li class="block-text"><strong><em>Type</em>:</strong> Sightseeing</li>
                                <li class="block-text"><strong><em>Deploy date</em>:</strong> Unknown</li>
                            </ul> -->

                            <ul>
                                <li class="block-text">
                                    <strong><em>Country</em>:</strong>&nbsp;
                                    <span class="text-capitalize"><%= journey.getCountry().toLowerCase() %></span>
                                </li>
                                <li class="block-text">
                                    <strong><em>Cities</em>:</strong>&nbsp;
                                    <span class="text-capitalize"><%= journey.getListCity().get(0).toLowerCase() %></span>&nbsp;

                                    <% if (journey.getListCity().size() >= 2) { %>

                                    <em>and</em>&nbsp;
                                    <span class="text-capitalize"><%= journey.getListCity().get(1).toLowerCase() %></span>

                                    <% } %>
                                </li>
                                <li class="block-text">
                                    <strong><em>Duration</em>:</strong>&nbsp;
                                    <%= journey.getDuration() %>&nbsp;day(s)
                                </li>
                                <li class="block-text">
                                    <strong><em>Estimated budget</em>:</strong>&nbsp;
                                    $<%= Math.round((journey.getBudget() + 5) / 10.0) * 10.0 %>
                                </li>
                                <li class="block-text">
                                    <strong><em>Type</em>:</strong>&nbsp;
                                    <span class="text-capitalize"><%= journey.getType().toLowerCase() %></span>
                                </li>
                                <li class="block-text">
                                    <strong><em>Deploy date</em>:</strong>&nbsp;

                                    <% if (journey.getDeployDate() == null) { %>

                                    <span>Unknown</span>

                                    <% } else { %>

                                    <span><%= journey.getDeployDate() %></span>
                                    
                                    <% }    /* end of if - deployDate */ %>
                                    
                                </li>
                            </ul>

                        </div>

                        <!-- First city tab content -->
                        <div role="tabpanel" class="tab-pane fade" id="first_city">

                            <!-- Sample - Day 1 -->
                            <!-- <h1 class="day-title">Day 1</h1>
                            <table width="100%">
                                <tr>
                                    <td class="period-block">
                                        Morning
                                        <i class="wi wi-sunrise"></i>
                                    </td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                           class="img-thumbnail" alt="location-img"></td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="period-block">
                                        Afternoon
                                        <i class="wi wi-day-sunny"></i>
                                    </td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                           class="img-thumbnail" alt="location-img"></td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="period-block">
                                        Evening
                                        <i class="wi wi-night-clear"></i>
                                    </td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                           class="img-thumbnail" alt="location-img"></td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis.</p>
                                    </td>
                                </tr>
                            </table> -->
                            
                            <!-- Sample - Day 2 -->
                            <!-- <h1 class="day-title">Day 2</h1>
                            <table width="100%">
                                <tr>
                                    <td class="period-block">
                                        Morning
                                        <i class="wi wi-sunrise"></i>
                                    </td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                           class="img-thumbnail" alt="location-img"></td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="period-block">
                                        Afternoon
                                        <i class="wi wi-day-sunny"></i>
                                    </td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                           class="img-thumbnail" alt="location-img"></td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="period-block">
                                        Evening
                                        <i class="wi wi-night-clear"></i>
                                    </td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                           class="img-thumbnail" alt="location-img"></td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis.</p>
                                    </td>
                                </tr>
                            </table> -->
                            
                            <!-- Sample - Day 3 -->
                            <!-- <h1 class="day-title">Day 3</h1>
                            <table width="100%">
                                <tr>
                                    <td class="period-block">
                                        All day
                                        <i class="wi wi-time-3"></i>
                                    </td>
                                    <td class="img-block"><img src="http://placehold.it/250x250"
                                           class="img-thumbnail" alt="location-img"></td>
                                    <td class="location-block">
                                        <h2>Location</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur
                                            adipiscing elit. Nulla vitae mi rutrum,
                                            ultricies augue ac, faucibus sapien.
                                            Ut feugiat justo eu libero interdum blandit.
                                            In rhoncus cursus nunc, quis maximus
                                            neque viverra quis.</p>
                                    </td>
                                </tr>
                            </table> -->

                            <%
                                // list through all days spent for the first city
                                for (int i = 0; i < journey.getDaysCity().get(0); ++i)
                                {
                                    Day day = journey.getListDays().get(i);  // current Day
                            %>

                            <h1 class="day-title">Day <%= day.getDayNumber() %></h1>
                            <table width="100%">

                            <% if (day.hasPark()) { /* day spent for park */ %>

                                <tr>
                                    <td class="period-block">
                                        All day&nbsp;<i class="wi wi-time-3"></i>
                                    </td>
                                    <td class="img-block">
                                        <a href="#"><img src="http://placehold.it/250x250" class="img-thumbnail" alt="location-image"></a>
                                    </td>
                                    <td class="location-block">
                                        <h2 class="text-capitalize"><%= day.getPark().getName().toLowerCase() %></h2>
                                        <p class="text-capitalize"><%= day.getPark().getDescription().toLowerCase() %></p>
                                    </td>
                                </tr>

                            <% } else /* normal day */ { %>

                                <% if (day.hasMorning()) {  /* suggest location for morning */ %>

                                <tr>
                                    <td class="period-block">
                                        Morning&nbsp;<i class="wi wi-sunrise"></i>
                                    </td>
                                    <td class="img-block">
                                        <a href="#"><img src="http://placehold.it/250x250" class="img-thumbnail" alt="location-img"></a>
                                    </td>
                                    <td class="location-block">
                                        <h2 class="text-capitalize"><%= day.getMorningLocation().getName().toLowerCase() %></h2>
                                        <p class="text-capitalize"><%= day.getMorningLocation().getDescription().toLowerCase() %></p>
                                    </td>
                                </tr>

                                <% }    /* end of 'morning' */ %>
                                <% if (day.hasAfternoon()) {    /* for afternoon */ %>

                                <tr>
                                    <td class="period-block">
                                        Afternoon&nbsp;<i class="wi wi-day-sunny"></i>
                                    </td>
                                    <td class="img-block">
                                        <a href="#"><img src="http://placehold.it/250x250" class="img-thumbnail" alt="location-img"></a>
                                    </td>
                                    <td class="location-block">
                                        <h2 class="text-capitalize"><%= day.getAfternoonLocation().getName().toLowerCase() %></h2>
                                        <p class="text-capitalize"><%= day.getAfternoonLocation().getDescription().toLowerCase() %></p>
                                    </td>
                                </tr>

                                <% }    /* end of 'afternoon' */ %>
                                <% if (day.hasEvening()) {  /* for evening */ %>

                                <tr>
                                    <td class="period-block">
                                        Evening&nbsp;<i class="wi wi-night-clear"></i>
                                    </td>
                                    <td class="img-block">
                                        <a href="#"><img src="http://placehold.it/250x250" class="img-thumbnail" alt="location-img"></a>
                                    </td>
                                    <td class="location-block">
                                        <h2 class="text-capitalize"><%= day.getEveningLocation().getName().toLowerCase() %></h2>
                                        <p class="text-capitalize"><%= day.getEveningLocation().getDescription().toLowerCase() %></p>
                                    </td>
                                </tr>

                                <% }    /* end of 'evening' */ %>

                            <% }    /* end of normal day */%>

                            </table>

                            <% }    /* end of loop */ %>

                        </div>

                        <% if (journey.getListCity().size() >= 2) {  /* 2 cities */ %>

                        <!-- Second city tab content, if exist -->
                        <div role="tabpanel" class="tab-pane fade" id="second_city">
                            
                            <%
                                // list through all days spent for the second city
                                for (int j = journey.getDaysCity().get(0); j < journey.getDuration(); ++j)
                                {
                                    Day day = journey.getListDays().get(j);  // current Day
                            %>

                            <h1 class="day-title">Day <%= day.getDayNumber() %></h1>
                            <table width="100%">

                            <% if (day.hasPark()) { /* day spent for park */ %>

                                <tr>
                                    <td class="period-block">
                                        All day&nbsp;<i class="wi wi-time-3"></i>
                                    </td>
                                    <td class="img-block">
                                        <a href="#"><img src="http://placehold.it/250x250" class="img-thumbnail" alt="location-image"></a>
                                    </td>
                                    <td class="location-block">
                                        <h2 class="text-capitalize"><%= day.getPark().getName().toLowerCase() %></h2>
                                        <p class="text-capitalize"><%= day.getPark().getDescription().toLowerCase() %></p>
                                    </td>
                                </tr>

                            <% } else /* normal day */ { %>

                                <% if (day.hasMorning()) {  /* suggest location for morning */ %>

                                <tr>
                                    <td class="period-block">
                                        Morning&nbsp;<i class="wi wi-sunrise"></i>
                                    </td>
                                    <td class="img-block">
                                        <a href="#"><img src="http://placehold.it/250x250" class="img-thumbnail" alt="location-img"></a>
                                    </td>
                                    <td class="location-block">
                                        <h2 class="text-capitalize"><%= day.getMorningLocation().getName().toLowerCase() %></h2>
                                        <p class="text-capitalize"><%= day.getMorningLocation().getDescription().toLowerCase() %></p>
                                    </td>
                                </tr>

                                <% }    /* end of 'morning' */ %>
                                <% if (day.hasAfternoon()) {    /* for afternoon */ %>

                                <tr>
                                    <td class="period-block">
                                        Afternoon&nbsp;<i class="wi wi-day-sunny"></i>
                                    </td>
                                    <td class="img-block">
                                        <a href="#"><img src="http://placehold.it/250x250" class="img-thumbnail" alt="location-img"></a>
                                    </td>
                                    <td class="location-block">
                                        <h2 class="text-capitalize"><%= day.getAfternoonLocation().getName().toLowerCase() %></h2>
                                        <p class="text-capitalize"><%= day.getAfternoonLocation().getDescription().toLowerCase() %></p>
                                    </td>
                                </tr>

                                <% }    /* end of 'afternoon' */ %>
                                <% if (day.hasEvening()) {  /* for evening */ %>

                                <tr>
                                    <td class="period-block">
                                        Evening&nbsp;<i class="wi wi-night-clear"></i>
                                    </td>
                                    <td class="img-block">
                                        <a href="#"><img src="http://placehold.it/250x250" class="img-thumbnail" alt="location-img"></a>
                                    </td>
                                    <td class="location-block">
                                        <h2 class="text-capitalize"><%= day.getEveningLocation().getName().toLowerCase() %></h2>
                                        <p class="text-capitalize"><%= day.getEveningLocation().getDescription().toLowerCase() %></p>
                                    </td>
                                </tr>

                                <% }    /* end of 'evening' */ %>

                            <% }    /* end of normal day */%>

                            </table>

                            <% }    /* end of loop */ %>

                        </div>

                        <% }    /* end of if - check second city */ %>

                    </div>

                </div>
            </div>
        </div>
        <div id="footer">
            <jsp:include page="_footer.jsp" flush="true" />
        </div>
    </body>
</html>
<% } else { %>

<!DOCTYPE html><html><head></head><body><h1>No journey in session</h1></body></html>

<% } %>
