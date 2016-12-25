<!DOCTYPE html>
<!--
Register Page 
TravelPlaning Project
Author : Trung Pham
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Data.*" %>

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

        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">

        <!-- Country+City List js -->
        <script type= "text/javascript" src = "js/country_city_list.js"></script>




        <style type="text/css">

            img.bg {
                /* Set rules to fill background */
                min-height: 100%;
                min-width: 1024px;

                /* Set up proportionate scaling */
                width: 100%;
                height: auto;

                /* Set up positioning */
                position: fixed;
                top: 0;
                left: 0;
            }

            @media screen and (max-width: 1024px) { /* Specific to this particular image */
                img.bg {
                    left: 50%;
                    margin-left: -512px;   /* 50% */
                }
            }
            
            .signupform {
          
          border: 3px solid #1594b9;  
          padding: 2%;
          background:  #a0d5c7 ; 
          margin-left: 26%; 
          margin-right: 26%;
          border-radius: 10px;
      }

            


            legend{
                font-size: 160%; 
                font-family: Courier New, Courier, monospace;
                border-width: 1.5px;
                border-radius: 10px;
                border-color: black;
                font-weight: 600;
                padding-left: 1.5%;
            }


            .outmost{
                margin-left: 15%; 
                margin-right:15%;
                padding-top:5%; 
                margin-bottom: 10%; 
                align-content: center;
                position: relative;
                font-size: 90%;

            }

            .error{   
                color:#D8000C;

                padding-left: 17%
            }    

            .success{
                color:#4F8A10;

                padding-left: 23.5%;   
            }

            small{
                color:#a9a9a9;
                font-weight: 800;
            }

            hr{
                display: block;
                height: 2px;
                border: 0;
                border-top: 1px solid #cc7c7c;
                margin: 1em 0;
                padding: 0;
            }

            .locationtitle{
                text-align: center;
                font-size: 240%;
                font-family: Brush Script MT;
            }

            .outmostlocation{
                background-color: #d8c2ff;
                padding:2%;
                margin-bottom: 4%;   
            }

            .provider_description {
                text-align: center; 
                color:#D8000C;
                font-size: 75%;
            }
            
            .section_field{
                
                margin-bottom: 2%;
                
            }

            .submit_button{
                font-size : 135%; 
                background-color:#655BFF; 
                color: white; 
                padding: 1.5%; 
                border-radius: 12px; 
                font-weight: 400; 
                margin-top: 0.5%
            }
        </style>

    </head>



    <body onload="initialize();">
        <!-- Banner Copy  -->

        <jsp:include page="_header.jsp" flush="true" />

        <!-- - - - - - - - - Background - - - - - - - - - - -->

         <img class="bg" src="img/PicforBackgroundWLCpage/slide3.jpg" alt="img/avatartest.jsp">




        <!-- - - - - - - - - - Begin OutMost Div - - - - - - - -->

        <div  class="outmost" >

            <div style="text-align: center; font-size: 340%; font-style: oblique ">
                Update Profile Section
                <br>
                <span style = "font-size : 37.5%">
                    Up-To-Date is a Key.           
                </span>
            </div>

            <br>


            <!-- - - - - - - - - - FORM - - - - - - - -->       
            <div class="signupform">
                <form action="UserControl" method="POST" onsubmit="return validateForm();">


                    <!-- Command : - update_profile - -->
                    <input type="hidden" name="command" id="command" value="update_profile">

                    <span id="hidden_test"></span>


                    <!-- - - - - - -PASSWORD - - - - - -->    
                    <div class="section_field">
                        <fieldset>

                            <legend>Password.</legend>
                            <div class="form-group">

                               

                                <!-- Password -->
                                <input class="form-control " size="25" placeholder="Password" name="password" type="password" id="password" onkeyup="CheckPasswordStrength(this.value);CheckPassword()" style="width: 55%;">
                                <span id="password_strength" style="font-size:80%; padding-left: 25%"></span>

                                <br>

                                <!-- Confirm Password -->
                                <input class="form-control"  size="25" placeholder="Confirm Password" type="password" id="confirm_password" onkeyup="CheckPassword()" style="width: 55%;">
                                <span id="confirm_pass"></span>

                                <br>
                            </div>  
                        </fieldset>
                    </div>


                    <!-- - - - - - - - - NAME - - - - -  - -->
                    <div style="">
                        <fieldset> 
                            <legend>Full Name</legend>

                            <div class="form-group">

                                <input type="text" size="30" placeholder="First" maxlength ="30" class="form-control" id="firstname" name="firstname" style="width: 48%; float:left;">
                                <input type="text" size="30" placeholder="Last" maxlength ="30" class="form-control" id="lastname" name="lastname" style="width: 48%; float: right">

                            </div>                    
                        </fieldset>
                    </div>

                    <br>

                    <!-- - - - - - - - Birthday - - - - - -->

                    <div >
                        <fieldset>   
                            <legend>Birthday</legend>


                            <!-- - - - - - - Month - - - - - -  -->  
                            <label>
                                <select name="DOBmonth" class="form-control" style="float: left">

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
                                <select name="DOBday" class="form-control" style="float:left">

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
                                <input class ="form-control" style="float:left"  type="text" pattern="[0-9]{4}" maxlength="4" size="4" name="DOByear" id="birthyear" placeholder="Year">
                            </label>

                        </fieldset>
                    </div>


                    <br>

                    <!-- - - - - - - - - Gender - - - - -  - -->
                    <div class="section_field" >
                        <fieldset>

                            <legend>Gender</legend>

                            <label>
                                <select name="gender" class="form-control">      
                                    <option value="m">Male</option>
                                    <option value="f">Female</option>
                                    <option value="o">Other</option>
                                </select>
                            </label>

                        </fieldset>
                    </div>


                    <br> 

                    <!-- - - - - - - - - Mobile Phone - - - - -  - -->
                    <div class="section_field">
                        <fieldset>

                            <legend>Mobile Phone</legend>          

                            <label>          
                                <input class="form-control" type="text" size="25" placeholder="+(00)-(0000)" maxlength ="25"  id="phone" name="phone">
                            </label>  

                        </fieldset>
                    </div>


                    <br>


                   

                    <!-- - - - - - - - - COUNTRY - - - - -  - -->
                    <div class="section_field">
                        <fieldset>
                            <legend>Country</legend>

                            <label>
                                <select class="form-control" id="country" name ="country" ></select>   
                            </label>    

                        </fieldset>
                    </div>


                    <br>  


                    <!-- - - - - - - - - City - - - - -  - -->
                    <div class="section_field">
                        <fieldset>
                            <legend>City/State</legend>

                            <label>    
                                <select class="form-control" name ="city" id ="state"></select> 
                            </label>    

                        </fieldset>
                    </div>


                    <br>

                    <!-- - - - - - - Error Notification - - - - - - - - - -->
                    <div id="nortification_submit" style="font-size: 115%;">The following section(s) contain error(s). Please check again : </div>

                    <div class="error" id="password_submit">-Password.</div>
                    <div class="error" id="confirm_password_submit">-Password Confirmation.</div>
                    <div class="error" id="matching_password_submit">-Password Matching (Password and Confirmation).</div>
                    <div class="error" id="name_submit">-Name.</div>
                    <div class="error" id="year_submit">-Birthday.</div>
                    <div class="error" id="phone_submit">-Phone.</div>
                    <div class="error" id="country_submit">-Country.</div>

                    <br>
                   
                    <!-- - - - - - - BUTTON - - - - - - -->
                    <div style = "text-align: center" >
                        <input class="submit_button" id="submitbutton" name="submitbuton" type="submit" value="Save" style="">

                    </div>
                </form>
            </div>

        </div>





        <!-- BACK END --> 

        <script language="javascript">
            //------------------Setting Combo Box for Country---------------------//
            populateCountries("country", "state"); // first parameter is id of country drop-down and second parameter is id of state drop-down
        </script>


        <script type="text/javascript">

            //-----------Initialize Page OnLoad-------------//
            function initialize() {
                
                document.getElementById("password").focus();
                document.getElementById("nortification_submit").style.display = "none";

                //-------------User Account hide error------------------//
               
                document.getElementById("password_submit").style.display = "none";
                document.getElementById("confirm_password_submit").style.display = "none";
                document.getElementById("matching_password_submit").style.display = "none";
                document.getElementById("name_submit").style.display = "none";
                document.getElementById("year_submit").style.display = "none";
                document.getElementById("phone_submit").style.display = "none";
                document.getElementById("country_submit").style.display = "none";
            }


           


            //---------Password Strength--------- -------//  
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




            //------------Check Confirming Password----------//
            function CheckPassword() {

                var confirm_password = document.getElementById("confirm_password").value;
                var password = document.getElementById("password").value;
                var message = document.getElementById("confirm_pass");



                if (confirm_password === password) {
                    message.setAttribute("class", "success");
                    message.innerHTML = "Matched";

                } else {

                    message.setAttribute("class", "error");
                    message.innerHTML = "Password not matched";
                }
            }


            //--------------Validate the Form Submit-------------/
            function validateForm() {

                //------------------- Declare Error Count -------------------//
                var error_count;
                error_count = 0;

                //---------------Declare value variable of input in FORM ----------//
              
                /* Password */         var password = document.getElementById("password");
                /* Confirm_Password */ var confirm_password = document.getElementById("confirm_password");
                /* Name */             var name = document.getElementById("firstname");
                /* Birthyear */        var birthyear = document.getElementById("birthyear");
                /* Phone */            var phone = document.getElementById("phone");
                /* Country */          var country = document.getElementById("country").options[document.getElementById("country").selectedIndex].value;
           

                //-----------------Checking Input in Detail ------------------//
                //------------------------------------------------------------//

                
                //---------Password---------//
                if (password.value === "")
                {
                    error_count = error_count + 1;
                    document.getElementById("password_submit").style.display = "block";
                    password.style.borderColor = "red";
                } else
                {
                    document.getElementById("password_submit").style.display = "none";
                    password.style.borderColor = "#4F8A10";
                }

                //-------Confirm_Password-----------//
                if (confirm_password.value === "")
                {
                    error_count = error_count + 1;
                    document.getElementById("confirm_password_submit").style.display = "block";
                    confirm_password.style.borderColor = "red";
                } else
                {
                    document.getElementById("confirm_password_submit").style.display = "none";
                    confirm_password.style.borderColor = "#4F8A10";
                }


                //-------------Matching Password -----------//
                if (password.value !== confirm_password.value)
                {
                    error_count = error_count + 1;
                    document.getElementById("matching_password_submit").style.display = "block";
                    password.style.borderColor = "red";
                    confirm_password.style.borderColor = "red";
                } else
                {
                    if (confirm_password.value !== "")
                    {
                        document.getElementById("matching_password_submit").style.display = "none";
                        password.style.borderColor = "#4F8A10";
                        confirm_password.style.borderColor = "#4F8A10";
                    }
                }


                //-------------Firstname Existence -----------//        
                if (name.value === "")
                {
                    error_count = error_count + 1;
                    document.getElementById("name_submit").style.display = "block";
                    name.style.borderColor = "red";
                } else
                {

                    document.getElementById("name_submit").style.display = "none";
                    name.style.borderColor = "#4F8A10";
                }


                //-------------Year Input -----------//
                if (birthyear.value === "")
                {
                    error_count = error_count + 1;
                    document.getElementById("year_submit").style.display = "block";
                    birthyear.style.borderColor = "red";
                } else
                {

                    document.getElementById("year_submit").style.display = "none";
                    birthyear.style.borderColor = "#4F8A10";
                }

                //-------Phone--------//
                if (phone.value === "")
                {
                    error_count = error_count + 1;
                    document.getElementById("phone_submit").style.display = "block";
                    phone.style.borderColor = "red";
                } else
                {

                    document.getElementById("phone_submit").style.display = "none";
                    phone.style.borderColor = "#4F8A10";
                }

                //-------------Picking Country-----------//
                if (country === "-1")
                {
                    error_count = error_count + 1;
                    document.getElementById("country_submit").style.display = "block";
                    document.getElementById("country").style.borderColor = "red";
                } else
                {
                    document.getElementById("country_submit").style.display = "none";
                    document.getElementById("country").style.borderColor = "#4F8A10";
                }
                //End of Enterprise User Validating

                //----Final Result of Error---//	
                if (error_count > 0)
                {
                    document.getElementById("nortification_submit").style.display = "block";
                    return false;
                }

            }

        </script> 


        <!-- - - - - - - - - - - Footer - - - - - - - -->

        <jsp:include page="_footer.jsp" flush="true"/>
    </body>
</html>
