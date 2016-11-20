<!DOCTYPE html>
<html>
<head>
	<title>Form</title>
<!--theme style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	



<!--//theme style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Form Demo Le Quang Minh Anh" />

<!-- Script -->

<script type="text/javascript">
    function CheckPasswordStrength(password) {
        var password_strength = document.getElementById("password_strength");
 
        //TextBox left blank.
        if (password.length == 0) {
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
</head>
<body>
    
    <!-- Import jsp-->
    
    <%@ page import="javax.servlet.http.*" %>
    
    <!-- Cookie script -->
    <%Cookie[] cookies=request.getCookies();
String valid = "true";
String name = "";
if (cookies != null) {
    
     for (Cookie cookie : cookies) {
         if (cookie.getName().equals("cookieLoginUser")) {
           name=cookie.getValue();
       }
       if (cookie.getName().equals("cookieRealUser")) {
          if (cookie.getValue()==valid)
          {
              session.setAttribute("username",name );
              response.sendRedirect("sucess.jsp");
          }}
    }
}
%>

<div class="header"><h1>My Form!</h1></div>

<div class="form">
<h1>School of Computer Science and Engineering</h1>




				<form action="Login"  method="post">
					<div class="form-container">
						
							<label>Username or Email</label>
							<input type="text" name="nameoremail" value ="" required >
							<span></span>
							

							<label>Password</label>
							<input type="password" name="pass" value ="" onkeyup="CheckPasswordStrength(this.value)" required > 
							<span id="password_strength"></span>

                                                        <label>Keep me logged in</label>
                                                        <input type="checkbox" name="rememberme">
                                                      
						<input type="hidden" name="command" value="search">
				
						<span></span> 
					<input type="Submit" value="submit">
                                        <a href="Register.html" ><input type="button" value="Register"> </a>
					</div>
				</form>
			</div>