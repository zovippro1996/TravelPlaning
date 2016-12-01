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
          
          border: 5px solid #59903d;  
          padding: 2%;
          background:  #daffc7 ; 
          margin-left: 26%; 
          margin-right: 26%;
         
          
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
          border-radius: 10px;
      
      }
      
      select{     
          padding: 2px;
      }
      
  </style>
  
    </head>
    
    
    
    <body>
 <!-- Banner Copy  -->
 
      <jsp:include page="_header.jsp" flush="true" />
        
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
            
            
            <div class="signupform">
                <form action="UserControl" method="POST">
                      <input type="hidden" name="command" value="signupaccount">
                
                
                <!-- - - - - - -USERNAME + PASS - - - - - -->    
                 <div style="margin-bottom: 4%">
                    <fieldset>
                        
                        <legend>Account Info.</legend>
                         <div class="form-group">
                           
                             
                             
                             <!-- Username -->
                             <input type="text" size="25" placeholder="Username" maxlength ="25" class="form-control" id="username" onblur="CheckUsername_available(this.value)" name="username" style="width: 55%;" required>
                             <span id="username_status"> </span>
                        
                             <!-- Password -->
                             <input class="form-control" size="25" placeholder="Password" name="password" type="password" id="password" onkeyup="CheckPasswordStrength(this.value)" style="width: 55%;" required>
                                <span id="password_strength" style="font-size:70%; padding-left: 25%"></span>
                           
                                <br>
                                
                             <!-- Confirm Password -->
                             <input class="form-control"  size="25" placeholder="Confirm Password" name="confirmpassword" type="password" id="confirm_password" onkeyup="CheckPassword(this.value)" style="width: 55%;" required>
                                <span id="confirm_pass"> </span>
                   
                        
                        </div> 
                        
                    </fieldset>
                 </div>
                
                
                
                <!-- - - - - - - - - NAME - - - - -  - -->
                <div style="margin-bottom: 4%">
                    <fieldset>
                        
                        <legend>Name</legend>
                        
                         <div class="form-group">
                           
                             <input type="text" size="30" placeholder="First" maxlength ="30" class="form-control" id="firstname" name="firstname" style="width: 50%;">
                             <input type="text" size="30" placeholder="Last" maxlength ="30" class="form-control" id="lastname" name="lastname" style="width: 50%;">
                           
                         </div> 
                        
                    </fieldset>
                </div>
             
                
                
                <!-- - - - - - - - Birthday - - - - - -->
                
             <div style="margin-bottom: 4%">
                    <fieldset>
                        
                        <legend>Birthday</legend>
                        
                        <label>
                            
                            
                            
                           <!-- - - - - - - Month - - - - - -  -->  
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
                            
                           <!-- - - - - - -DAY - - - - - - - -->  
                           <select name="DOBday">
                                
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                                
                            </select>
                        </label>
                        
                        
                        
                        <!-- - - - - - -YEAR - - - - - - - --> 
                        <label>
                            <input class ="formfieldcontent" type="text" pattern="[0-9]{4}" maxlength="4" size="4" name="DOByear" id="Birthyear" placeholder="Year"  >
                        </label>
                        
                    </fieldset>
                </div>
                
                
                
                
                 <!-- - - - - - - - - Gender - - - - -  - -->
                <div style="margin-bottom: 4%">
                    <fieldset>
                        
                        <legend>Gender</legend>
                        
                        <label>
                           <select name="gender">      
                                <option value="m">Male</option>
                                <option value="f">Female</option>
                                <option value="o">Other</option>
                           </select>
                        </label>
                        
                    </fieldset>
                </div>
                 
                 
                 
                <!-- - - - - - - - - Mobile Phone - - - - -  - -->
                <div style="margin-bottom: 4%">
                    <fieldset>
                        
                        <legend>Mobile Phone</legend>          
                        
                        <label>          
                         <input class="form-control" type="text" size="25" placeholder="+" maxlength ="25"  id="phone" name="phone">
                        </label>  
                        
                    </fieldset>
                </div>
                
                
                
                 <!-- - - - - - - - - EMAIL - - - - -  - -->
                <div style="margin-bottom: 4%">
                    <fieldset>
                        
                        <legend>Email</legend>
                        
                       <div class="form-group">
                           
                             <input type="email" name ="email" class="form-control" id="mail1" aria-describedby="emailHelp" placeholder=".com">
                             <small id="emailHelp" class="text-muted">One account can only have one email address</small>
                        </div>
                        
                    </fieldset>
                </div>                
                    
                 
                    
                    <!-- - - - - - - - - COUNTRY - - - - -  - -->
                <div style="margin-bottom: 2%">
                    <fieldset>
                        
                        <legend>Country</legend>
                        
                        <label>
                            
                         <input class="form-control" type="text" size="25" placeholder="Country" maxlength ="25"  id="country" name="country">
                        </label>  
                        
                    </fieldset>
                </div>
                
                <!-- - - - - - - BUTTON - - - - - - -->
                
                
               
                <div style = "text-align: center" >
                    <input id="submitbutton" name="submitbuton" type="submit" value="Sign Up" style="font-size : 135%; background-color:#655BFF; color: white; padding: 1.5%; border-radius: 18.5px; font-weight: 400; margin-top: 0.5%">
                    
                </div>
                </form>
            </div>
            
        </div>
     
     
     
     
     
    <!-- BACK END --> 
    <script type="text/javascript">
          
          
        //---------Password Strength---------    
        function CheckPasswordStrength(password) {
            var password_strength = document.getElementById("password_strength");
 
                //TextBox left blank.
            if (password.length === 0) {
                password_strength.innerHTML = "";
                return;
            }
 
        
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
    
    
    
    
        //------------Check Confirming Password----------
        function CheckPassword(confirm_password) {
            var password = document.getElementById("password");
            var message = document.getElementById("confirm_pass");
         
           
            
            if (confirm_password === password.value){                 
                      message.innerHTML="True";
                      
                }

            else {
               message.innerHTML="Not Match" + confirm_password + " " +password.value;
                 
                }
    }
    
    
        
        //----------------Check Username Availability-----
        function CheckUsername_available(String username){
            
                var xmlhttp = new XMLHttpRequest();
                
                var message = document.getElementById("username_status");
                
                var url = "username_available.jsp?username="+ username;
                
                xmlhttp.onreadystatechange = function(){
                    
                    if((xmlhttp.readyState) === 4 && (xmlhttp.status === 200)){
                        if (xmlhttp.responseText === "User exists")
                               message.style.color = "red";
                        else
                                message.style.color = "green";
                            
                        message.innerHTML = xmlhttp.responseText;
                        
                    }
                    
                };
                try{
                    xmlhttp.open("GET",url,true);
                    xmlhttp.send();
                }
                catch(e) { alert("unable to connect to server");}
               
            
        }
        
       
        
    
       
    </script> 
     <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i class="mbr-arrow-up-icon"></i></a></div>
     
     
     
     
     
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
  
  
  <jsp:include page="_footer.jsp" flush="true"/>
</body>
</html>

