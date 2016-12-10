<%-- 
    Document   : Login.jsp
    Created on : Nov 20, 2016, 9:21:42 AM
    Author     : CREAT10N
--%>

<%@page import="Data.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Travel Planning</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            body{
                font: 12px Arial, Helvetica, sans-serif;
                margin: 0; 
                height: 100%; 
            }
            #wrapper{
                margin: 0px auto;
                width: 100%;
                height: auto;
                display: block;
                /*display: none;*/
            }
            #background-slide{
                position: fixed;
                margin-top: -8%;
                z-index: -1000;
                width: 100%;
            }
            #content{
                z-index: 1;
            }           
            #login{
                text-align: center;
                margin-top: 8%;
                width: 25%;
                border-radius: 20px;
                background: white;
            }
            #login-banner{
                width: 100%;
                height: 50px;
                font-size: 35px;
                margin-top: 20px;
                text-align: center;
                color: #F28281;
                font-weight: bold;
            }
            #login-form{
                margin-top: 20px;
                padding-left: 12%;
            }
            #reset-pass{
                float: right;
                margin-right: 15%;
                color: #F28281;
                font-weight: bold;
            }
            #login-button{
                width: 135px;
                border-radius: 15px;
            }
            #social-text{
                float: left;
                margin-left: 45px;
                padding-top: 8px;
                color: #F28281;
                font-weight: bold;
            }
            #social-link{
                clear: both;
                height: 40px;
                padding-left: 25px;
            }
            .social-logo{
                width: fit-content;
                float: left;
                margin-left: 30px;
            }
            #register-btn{
                clear: both;
                margin-top: 12px;
            }
            #register-button{
                color: whitesmoke;
                width: 230px;
                border-radius: 15px;
            }
            #footer{
                position: absolute;
                bottom: 0px; 
                width: 100%;
            }


            /* Loading Screen Animation */
            #loader {
                position: absolute;
                opacity: 0.6;
                left: 50%;
                top: 50%;
                z-index: 1;
                width: 100px;
                height: 100px;
                margin: 100px 0 0 -50px;
                border: 16px solid #f3f3f3;
                border-radius: 50%;
                border-top: 16px solid #3498db;
                width: 120px;
                height: 120px;
                -webkit-animation: spin 2s linear infinite;
                animation: spin 2s linear infinite;
            }

            @-webkit-keyframes spin {
                0% { -webkit-transform: rotate(0deg); }
                100% { -webkit-transform: rotate(360deg); }
            }

            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }

            /* Add animation to "page content" */
            .animate-bottom {
                position: relative;
                -webkit-animation-name: animatebottom;
                -webkit-animation-duration: 1s;
                animation-name: animatebottom;
                animation-duration: 1s
            }

            @-webkit-keyframes animatebottom {
                from { bottom:-100px; opacity:0 }
                to { bottom:0px; opacity:1 }
            }

            @keyframes animatebottom {
                from{ bottom:-100px; opacity:0 }
                to{ bottom:0; opacity:1 }
            }
        </style>
        <%
            User user = (User) session.getAttribute("user");

            if (user != null) {
        %>
        <jsp:forward page="main.jsp"/>
        <%  }%>

    </head>
    <!--<body onload="Loader()">-->
    <body>
        <!--        <div id="loader">
                </div>
        
                <video id="loader_video" src="img/Loader_animation.mp4" width="100%" autoplay>
                </video>-->
        <div id="fb-root"></div>
        <script>
            // This is called with the results from from FB.getLoginStatus().
            function statusChangeCallback(response) {
                console.log('statusChangeCallback');
                console.log(response);
                // The response object is returned with a status field that lets the
                // app know the current login status of the person.
                // Full docs on the response object can be found in the documentation
                // for FB.getLoginStatus().
                if (response.status === 'connected') {
                    // Logged into your app and Facebook.
                    testAPI();
                } else if (response.status === 'not_authorized') {
                    // The person is logged into Facebook, but not your app.
                    document.getElementById('status').innerHTML = 'Please log ' +
                            'into this app.';
                } else {
                    // The person is not logged into Facebook, so we're not sure if
                    // they are logged into this app or not.
                    document.getElementById('status').innerHTML = 'Please log ' +
                            'into Facebook.';
                }
            }

            // This function is called when someone finishes with the Login
            // Button.  See the onlogin handler attached to it in the sample
            // code below.
            function checkLoginState() {
                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });
            }

            window.fbAsyncInit = function () {
                FB.init({
                    appId: '326473301073297',
                    cookie: true, // enable cookies to allow the server to access 
                    // the session
                    xfbml: true, // parse social plugins on this page
                    version: 'v2.8' // use graph api version 2.8
                });

                // Now that we've initialized the JavaScript SDK, we call 
                // FB.getLoginStatus().  This function gets the state of the
                // person visiting this page and can return one of three states to
                // the callback you provide.  They can be:
                //
                // 1. Logged into your app ('connected')
                // 2. Logged into Facebook, but not your app ('not_authorized')
                // 3. Not logged into Facebook and can't tell if they are logged into
                //    your app or not.
                //
                // These three cases are handled in the callback function.

                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });

            };

            // Load the SDK asynchronously
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));

            // Here we run a very simple test of the Graph API after login is
            // successful.  See statusChangeCallback() for when this call is made.
            function testAPI() {
                console.log('Welcome!  Fetching your information.... ');
                FB.api('/me', function (response) {
                    console.log('Successful login for: ' + response.name);
                    document.getElementById('status').innerHTML =
                            'Thanks for logging in, ' + response.name + '!';
                });
            }
        </script>

        <jsp:include page="_header.jsp" flush="true" />

        <div id="background-slide">
            <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide1.jpg" style="width: 100%">
            <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide2.jpg" style="width: 100%">
            <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide3.jpg" style="width: 100%">
            <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide5.jpg" style="width: 100%">
            <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide6.jpg" style="width: 100%">
            <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide7.jpg" style="width: 100%">
        </div>
        <div class="container-fluid">
            <div id="content">
                <div id="login">
                    <div id="login-banner">
                        LOGIN
                    </div>

                    <div id="login-form">
                        <form class="form-horizontal" action="UserControl" method="POST">
                            <input type="hidden" name="command" value="login">

                            <div class="col-sm-11" style="margin-bottom: 15px;">
                                <input type="text" name="username" class="form-control" placeholder="Username." autocomplete="off" required/>
                            </div>

                            <div class="col-sm-11" style="margin-bottom: 15px;">
                                <input type="password" name="password" class="form-control" placeholder="Password." required/>
                            </div>                                

                            <a id="reset-pass">Forgot password ?</a>

                            <div class="form-group" style="clear: both; padding-top: 10px;">
                                <div class="col-sm-offset-0">
                                    <button type="submit" class="btn btn-warning" id="login-button">Login</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div id="social-link">
                        <div id="social-text">
                            Or login with 
                        </div>
                        <div class="social-logo">
                            <!--<img src="img/facebook.png" alt="Facebook" width="35" height="35"/>-->
                            <div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="false"></div>
                        </div>
                        <div class="social-logo">
                            <!--<img src="img/twitter.png" alt="Twitter" width="35" height="35"/>-->
                        </div>
                    </div>

                    <div  id="register-btn" class="col-sm-offset-1">
                        <a href="register.jsp" class="btn btn-warning" role="button" id="register-button">Create New Account</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="footer">
            <jsp:include page="_footer.jsp" flush="true"/>
        </div>

        <script>
//            var Var;
//
//            function Loader() {
//                Var = setTimeout(showPage, 2000);
//            }
//
//            function showPage() {
//                document.getElementById("loader").style.display = "none";
//                document.getElementById("loader_video").style.display = "none";
//                document.getElementById("wrapper").style.display = "block";
//            }

            var myIndex = 0;
            carousel();

            function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                myIndex++;
                if (myIndex > x.length) {
                    myIndex = 1;
                }
                x[myIndex - 1].style.display = "block";
                setTimeout(carousel, 10000);
            }

        </script>

        <script src="assets/web/assets/jquery/jquery.min.js"></script>
        <script src="assets/tether/tether.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/smooth-scroll/SmoothScroll.js"></script>
        <script src="assets/viewportChecker/jquery.viewportchecker.js"></script>
        <script src="assets/dropdown/js/script.min.js"></script>
        <script src="assets/touchSwipe/jquery.touchSwipe.min.js"></script>
        <script src="assets/jarallax/jarallax.js"></script>
        <script src="assets/theme/js/script.js"></script>
    </body> 
</html>

