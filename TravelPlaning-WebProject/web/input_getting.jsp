<%-- 
    Document   : plan-generated-interface
    Created on : Oct 27, 2016, 10:10:33 AM
    Author     : Krankai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Data.*" %>

<%
    // Get user from session
    User user = (User) session.getAttribute("user");
    
    // Get user's name
    String username;
    if (user != null)
    {
        username = user.getFullname();
    }
    else
    {
        username = "Guest";
    }

    // Check visit
    // If the first time --> display "Welcome, user_name"
    // If the second time (and onward) --> display "Welcome back, user_name"
    Cookie[] cookies = request.getCookies();
    String welcome = "Welcome back, ";
    boolean found = false;
    if (cookies != null)        // there are cookies
    {
        // find for cookie 'visit'
        for (int i = 0; i < cookies.length; ++i)
        {
            Cookie cookie = cookies[i];
            if ("visit".equals(cookie.getName()))   // found
            {
                found = true;
                break;
            }
        }
    }
    if (!found)
    {
        Cookie cookie = new Cookie("visit", "on");
        response.addCookie(cookie);

        welcome = "Welcome, ";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="generator" content="Mobirise v3.7.3, mobirise.com">
        <meta name="description" content="Getting inputs from user to generate journey.">
        <link rel="shortcut icon" href="assets/images/hexa1-128x128-80.png" type="image/x-icon">
        <title>Generating Plan for a Trip Interface</title>
        <!--<link rel="stylesheet" type="text/css" href="css/style.css">-->
        <link rel="stylesheet" type="text/css" href="css/input_getting_style.css">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">-->
        <link rel="stylesheet" href="assets/et-line-font-plugin/style.css">
        <link rel="stylesheet" href="assets/bootstrap-material-design-font/css/material.css">
        <link rel="stylesheet" href="assets/tether/tether.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/socicon/css/socicon.min.css">
        <link rel="stylesheet" href="assets/animate.css/animate.min.css">
        <link rel="stylesheet" href="assets/dropdown/css/style.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
        <script type= "text/javascript" src = "js/country_city_list.js"></script>
        
        <!--       Fix animation disable page reset scrolling to top -->
        <script type= "text/javascript">
        window.onbeforeunload = function () {
        window.scrollTo(0, 0);
        }
        </script>
        
        
    </head>
    <body>
        <!-- Open nav drawer extensive js -->
        <div class="animate-bottom">
            
            <!-- Upper section -->
            <div id="upper">
                <!-- Header -->
                <jsp:include page="_header.jsp" flush="true" />

                <!-- Welcoming section: welcome user -->
                <div id="welcome" class="container-fluid">
                    <h1 class="mbr-section-title display-1"><%= welcome + username %></h1>
                    <p style="font-size: 25px; font-weight: bold">
                        Thank you for trusting and using our services.
                        <br>
                        It is a pleasure for us to help you have a wonderful
                        and memorable trip.
                        <br>
                        <span style="font-size: 35px; font-weight: bolder">Please</span>
                        fill in the form below so we can plan a suitable journey for you.
                    </p>
                    <button class="btn btn-primary choose-btn center-block">
                        <a href="#lower">Go to Form Section</a>
                    </button>
                </div>
            </div>
            
            <!-- Lower section: for getting input to plan the trip -->
            <div id="lower" class="container-fluid" tabindex="-1">
                <h2 class="mbr-section-title display-2">Form section</h2>
                <div id="form-wrapper">
                    <form action="JourneyProcessing" method="post"> 
                        
                        <!-- Prompt for country -->
                        <div class="form-group">
                            <label>
                                Where do you want to go ? <span class="required">*</span>
                            </label>
                            <select class="form-control" name="country" id="country"></select>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="dest" value="knownCountry" checked>
                                    I want to choose my preferred country
                                </label>
                            </div>
<!--                            <div class="radio">
                                <label>
                                    <input type="radio" name="dest" value="knownContinent">
                                    I don't know which country, but I want to go to
                                </label>
                                <select class="form-inline" name="continent">
                                    <option value="asia"> Asia</option>
                                    <option value="africa">Africa</option>
                                    <option value="namerica">North America</option>
                                    <option value="samerica">South America</option>
                                    <option value="antarctica">Antarctica</option>
                                    <option value="europe"> Europe</option>
                                    <option value="australia">Australia</option>
                                </select>
                            </div>-->
                            <div class="radio">
                                <label>
                                    <input type="radio" name="dest" value="notKnown">
                                    I don't know where to go. I want the system to
                                    help me choose instead.
                                </label>
                            </div>
                        </div>
                        
                        <!-- Prompt for duration -->
                        <div class="form-group">
                            <label for="duration">
                                How long is your journey ? <span class="required">*</span>
                            </label>
                            <div class="input-group">
                                <input type="number" class="form-control" id="duration"
                                       placeholder="Number of days" name="duration"
                                       min="2" max="7" value="2"
                                       autocomplete="off" required>
                                <div class="input-group-addon"> day(s)</div>
                            </div>
                            <p class="help-block" style="display: inline; margin-right: 50px">Min: 2 day</p>
                            <p class="help-block" style="display: inline">Max: 7 days</p>
                        </div>
                        
                        <!-- Prompt for number of cities -->
                        <div class="form-group">
                            <label>
                                How many cities do you want to visit ? <span class="required">*</span>
                            </label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="numsCity" value="one">One
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="numsCity" value="two">Two
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="numsCity" value="notKnown" checked>
                                    Please decide for me
                                </label>
                            </div>
                        </div>
                        
<!--                         Prompt for money stuff ?? 
                        <div class="form-group">
                            <label>
                                Money relating stuff ?? Dont know what to write <span class="required">*</span>
                            </label>
                            <div>
                                <label class="radio-inline">
                                    <input type="radio" name="wealthyStyle" value="standard"> Standard
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="wealthyStyle" value="luxury"> Luxury
                                </label>
                            </div>
                        </div>-->
                        
                        <!-- Prompt for type of journey -->
                        <div class="form-group">
                            <label for="typeJourney">
                                Which types of journey do you prefer ? <span class="required">*</span>
                            </label>
                            <select class="form-control input-sm" name="type"
                                    id="typeJourney" style="font-family: 'Bitter', serifs"
                                    required>
                                
                                <%
                                    for (JourneyType type : JourneyType.values())
                                    {
                                        out.println("<option value=\"" +
                                                type.name() + "\"" +
                                                ">" + type.name() + " TRIP</option>");
                                    }
                                %>
                                
                            </select>
                            <p class="help-block">
                                This information will help us arrange locations
                                that likely suit your taste.
                            </p>
                        </div>
                                
                        <!-- Prompt for park ? -->
                        <div class="form-group">
                            <label>
                                Do you like visiting theme-park ?
                            </label>
                            <div>
                                <label class="radio-inline">
                                    <input type="radio" name="parkPrefer" value="yes"> Yes
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="parkPrefer" value="no" checked> No
                                </label>
                            </div>
                        </div>
                        
                        <!-- Prompt for beach ? -->
                        <div class="form-group">
                            <label>
                                Do you like visiting beach ?
                            </label>
                            <div>
                                <label class="radio-inline">
                                    <input type="radio" name="beachPrefer" value="yes"> Yes
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="beachPrefer" value="no" checked> No
                                </label>
                            </div>
                            <p class="help-block">Only for coastal country</p>
                        </div>
                        
                        <div style="margin-top: -10px">
                            <p style="color: red">Information with <span class="required">*</span>
                                is required</p>
                        </div>
                        
                        <div style="text-align: center">
                            <p style="font-size: 20px; font-weight: bold">
                                -----------
                                That's all. Click Submit and wait for your journey
                                -----------
                            </p>
                        </div>
                        
                        <button type="submit" name="action" value="generateJourney"
                                class="btn btn-primary choose-btn">
                            Submit
                        </button>
                        <button type="reset" class="btn btn-primary choose-btn">
                            Cancel
                        </button>
                    </form>
                </div>
            </div>
            
            <!-- Footer -->
            <jsp:include page="_footer.jsp" flush="true" />
        </div>
        
        <script>
            function focusForm() {
                document.getElementById("lower").focus();
            }
            
            populateCountries("country", "");
        </script>
    </body>
</html>

