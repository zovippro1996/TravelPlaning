<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Register Page 
TravelPlaning Project
Author : Trung Pham
-->

<html>
    <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v3.7.3, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/images/hexa1-128x128-80.png" type="image/x-icon">
  <meta name="description" content="Help users to manage their travel plans with a click of a button.">
  <title>Create Travel Planing Account</title>
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
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/w3.css">
  
  <style type="text/css">
      .signupform {
          -webkit-clip-path: polygon(4% 0%, 96% 0%, 100% 3%, 100% 95%, 95% 100%, 5% 100%, 0% 95%, 0% 3%);
          
      }
     
      .formfieldcontent{
          padding: 1%;
          font-size: 100%;
          margin-left: 3%;
          margin-bottom: 1%;
      }
      
      legend{
          
          font-size: 160%; 
          font-family: Courier New, Courier, monospace;
          
          
      }
      
      fieldset{
          border-width: 1px;
      
      }
      
  </style>
  
    </head>
    
    <body>
 <!-- Banner Copy  -->
 
      <section id="index-menu-0">

    <nav class="navbar navbar-dropdown bg-color transparent navbar-fixed-top">
        <div class="container">

            <div class="mbr-table">
                <div class="mbr-table-cell">

                    <div class="navbar-brand">
                        <a class="navbar-caption text-danger" href="Main.html" style="padding: 0 0 0 50px; margin-bottom: 20px;">Travel Planning</a>
                    </div>

                </div>
                <div class="mbr-table-cell">

                    <button class="navbar-toggler pull-xs-right hidden-md-up" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="hamburger-icon"></div>
                    </button>

                    <ul class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm" id="exCollapsingNavbar">
                    <li class="nav-item"><a class="nav-link link" href="#" aria-expanded="false">Contact</a></li>
                    </ul>
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="close-icon"></div>
                    </button>

                </div>
            </div>

        </div>
    </nav>

</section>
        
        <!-- - - - - - - - - Background - - - - - - - - - - -->
        
        <div id="background-slide" style="position: fixed">
                    <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide1.jpg" style="width: 100%">
                    <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide2.jpg" style="width: 100%">
                    <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide3.jpg" style="width: 100%">
                    <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide5.jpg" style="width: 100%">
                    <img class="mySlides w3-animate-fading" src="img/PicforBackgroundWLCpage/slide7.jpg" style="width: 100%">
                </div>
        
     <!-- - - - - - - - - - Begin OutMost Div - - - - - - - -->
     
        <div  style="margin-left: 15%; margin-right:15%;padding-top:5%; margin-bottom: 10%; align-content: center;">
            
            <div style="text-align: center; font-size: 340%; margin-bottom:1%; font-style: oblique;">
                Create your  Account
                <br>
                <span style = "font-size : 37.5%">Fill In The Boarding Ticket
                    And We Are Ready</span>
            </div>
        
            
           
            
            <!-- - - - - - - - - - FORM - - - - - - - -->
            
            
            <div class="signupform" style="border: 5px solid #e5e5e5;  padding: 2%;
  background: #f1f1f1; margin-left: 26%; margin-right: 26%;">
                <form action="UserControl" method="POST">
                      <input type="hidden" name="command" value="signupaccount">
                
                
                <!-- - - - - - -USERNAME + PASS - - - - - -->    
                 <div style="margin-bottom: 4%">
                    <fieldset style="border-radius: 7px;">
                        
                        <legend>Account Info.</legend>
                         <div class="form-group">
                           
                             <input type="text" size="25" placeholder="Username" maxlength ="20" class="form-control" id="username" name="username" style="width: 55%;">
                      
                           
                                    
                       
                            
                             <input class="form-control" size="25" placeholder="Password" name="password" type="password" id="password" onkeyup="CheckPasswordStrength(this.value)" style="width: 55%;">
                                <span id="password_strength" style="font-size:70%; padding-left: 25%"></span>
                        
                        
                       
                                <br>
                        
                        <input class="form-control" size="25" placeholder="Confirm Password" name="confirmpassword" type="password" id="password" style="width: 55%;">
  
                        </div> 
                    </fieldset>
                </div>
                
                
                
                <!-- - - - - - - - - NAME - - - - -  - -->
                <div style="margin-bottom: 4%">
                    <fieldset style="border-radius: 7px;">
                        
                        <legend>Name</legend>
                        
                         <div class="form-group">
                           
                             <input type="text" size="30" placeholder="First" maxlength ="30" class="form-control" id="firstname" name="firstname" style="width: 50%;">
                             <input type="text" size="30" placeholder="Last" maxlength ="30" class="form-control" id="lastname" name="lastname" style="width: 50%;">
                           
                         </div> 
                        
                    </fieldset>
                </div>
             
                
                
                <!-- - - - - - - - Birthday - - - - - -->
                
             <div style="margin-bottom: 4%">
                    <fieldset style="border-radius: 7px;">
                        
                        <legend>Birthday</legend>
                        
                        <label>
                            
                           <select name="DOBmonth">
                                
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                        </label>
                        
                       
                        
                        <label>
                            <input class ="formfieldcontent" type="text" pattern="[0-9]" maxlength="2" size="2" name="DOBday" id="Birthday" placeholder="Day" >
                        </label>  
                        
                        <label>
                            <input class ="formfieldcontent" type="text" pattern="[0-9]" maxlength="4" size="4" name="DOByear" id="Birthyear" placeholder="Year"  >
                        </label>
                        
                    </fieldset>
                </div>
                
                
                 <!-- - - - - - - - - Gender - - - - -  - -->
                <div style="margin-bottom: 4%">
                    <fieldset style="border-radius: 7px;">
                        
                        <legend>Gender</legend>
                        
                        
                        <label>
                            <input type="radio" name="gender" value="male" checked> Male<br>
                        </label>
                        
                        
                        <label style="margin-left:5%">
                            <input type="radio" name="gender" value="female"> Female<br>
                        </label>  
                        
                        
                        <label style="margin-left:5%">
                            <input type="radio" name="gender" value="other"> Other
                        </label>
                        
                    </fieldset>
                </div>
                 
                 
                 
                <!-- - - - - - - - - Mobile Phone - - - - -  - -->
                <div style="margin-bottom: 4%">
                    <fieldset style="border-radius: 7px;">
                        
                        <legend>Mobile Phone</legend>
                    

                       
                        <label>
                            <input class ="formfieldcontent" type="text"  name="phone"  id="PhoneNumber" placeholder="(+)-" >
                        </label>  
                        
  
                        
                    </fieldset>
                </div>
                
                
                
                 <!-- - - - - - - - - EMAIL - - - - -  - -->
                <div style="margin-bottom: 4%">
                    <fieldset style="border-radius: 7px;">
                        
                        <legend>Email</legend>
                        
                        <label>
                            <input class ="formfieldcontent" name="email" type="email" id="email" placeholder=".com" maxlength="40" size="40" spellcheck="false">
                        </label>  
                        
                    </fieldset>
                </div>                
                    
                 
                    
                    <!-- - - - - - - - - LOCATION - - - - -  - -->
                <div style="margin-bottom: 4%">
                    <fieldset style="border-radius: 7px;">
                        
                        <legend>Country</legend>
                        
                        <label>
                            
                            <input class ="formfieldcontent"  type="text" name="country" id="location" placeholder="Country" maxlength="40" size="40" spellcheck="false">
                        </label>  
                        
                    </fieldset>
                </div>
                
                <!-- - - - - - - BUTTON - - - - - - -->
                
                
               
                <div style = "text-align: center" >
                    <input id="sumbitbutton" name="submitbuton" type="submit" value="Sign Up for Free" style="font-size : 135%; background-color:#655BFF; color: white; padding: 1.5%; border-radius: 18.5px; font-weight: 400; margin-top: 0.5%">
                    
                </div>
                </form>
            </div>
            
        </div>
     
     
     
      <script type="text/javascript">
    function CheckPasswordStrength(password) {
        var password_strength = document.getElementById("password_strength");
 
        //TextBox left blank.
        if (password.length === 0) {
            password_strength.innerHTML = "";
            return;
        }
 
        //Regular Expressions.
        var regex = new Array();
        regex.push("[A-Z]"); //Uppercase Alphabet.
        regex.push("[a-z]"); //Lowercase Alphabet.
        regex.push("[0-9]"); //Digit.
        regex.push("[$@$!%*#?&]"); //Special Character.
 
        var passed = 0;
 
        //Validate for each Regular Expression.
        for (var i = 0; i < regex.length; i++) {
            if (new RegExp(regex[i]).test(password)) {
                passed++;
            }
        }
 
        //Validate for length of Password.
        if (passed > 2 && password.length > 8) {
            passed++;
        }
 
        //Display status.
        var color = "";
        var strength = "";
        switch (passed) {
            case 0:
            case 1:
                strength = "Weak";
                color = "red";
                break;
            case 2:
                strength = "Good";
                color = "darkorange";
                break;
            case 3:
            case 4:
                strength = "Strong";
                color = "green";
                break;
            case 5:
                strength = "Very Strong";
                color = "darkgreen";
                break;
        }
        password_strength.innerHTML = strength;
        password_strength.style.color = color;
    }
</script> 
     
    </body>
    
    
    
    
 
    
<!-- FOOTER copy -->

<footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="main-footer1-0" style="background-color: rgb(50, 50, 50); padding-top: 1.75rem; padding-bottom: 1.75rem;">
    
    <div class="container">
        <p class="text-xs-center"><strong>Copyright (c) 2016 Travel Planning.</strong></p>
    </div>
</footer>    


<!-- Import js -->

 <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/tether/tether.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smooth-scroll/SmoothScroll.js"></script>
  <script src="assets/viewportChecker/jquery.viewportchecker.js"></script>
  <script src="assets/dropdown/js/script.min.js"></script>
  <script src="assets/touchSwipe/jquery.touchSwipe.min.js"></script>
  <script src="assets/jarallax/jarallax.js"></script>
  <script src="assets/theme/js/script.js"></script>
  
  <script>
      
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
                setTimeout(carousel, 5000);
            }
      
      
      
      </script>
  
  
  
  <input name="animation" type="hidden">
   <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon"></i></a></div>

    
    

</html>

