package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<!--\r\n");
      out.write("Register Page \r\n");
      out.write("TravelPlaning Project\r\n");
      out.write("Author : Trung Pham\r\n");
      out.write("-->\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("  <meta charset=\"UTF-8\">\r\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("  <meta name=\"generator\" content=\"Mobirise v3.7.3, mobirise.com\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("  <link rel=\"shortcut icon\" href=\"assets/images/hexa1-128x128-80.png\" type=\"image/x-icon\">\r\n");
      out.write("  <meta name=\"description\" content=\"Help users to manage their travel plans with a click of a button.\">\r\n");
      out.write("  <title>Create Travel Planing Account</title>\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/et-line-font-plugin/style.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/bootstrap-material-design-font/css/material.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/tether/tether.min.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/bootstrap/css/bootstrap.min.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/socicon/css/socicon.min.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/animate.css/animate.min.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/dropdown/css/style.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/theme/css/style.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/mobirise/css/mbr-additional.css\" type=\"text/css\">\r\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"css/w3.css\">\r\n");
      out.write("  \r\n");
      out.write("  <style type=\"text/css\">\r\n");
      out.write("      .signupform {\r\n");
      out.write("          -webkit-clip-path: polygon(4% 0%, 96% 0%, 100% 3%, 100% 95%, 95% 100%, 5% 100%, 0% 95%, 0% 3%);\r\n");
      out.write("          \r\n");
      out.write("      }\r\n");
      out.write("     \r\n");
      out.write("      .formfieldcontent{\r\n");
      out.write("          padding: 1%;\r\n");
      out.write("          font-size: 100%;\r\n");
      out.write("          margin-left: 3%;\r\n");
      out.write("          margin-bottom: 1%;\r\n");
      out.write("      }\r\n");
      out.write("      \r\n");
      out.write("      legend{\r\n");
      out.write("          \r\n");
      out.write("          font-size: 160%; \r\n");
      out.write("          font-family: Courier New, Courier, monospace;\r\n");
      out.write("          \r\n");
      out.write("          \r\n");
      out.write("      }\r\n");
      out.write("      \r\n");
      out.write("      fieldset{\r\n");
      out.write("          border-width: 1px;\r\n");
      out.write("      \r\n");
      out.write("      }\r\n");
      out.write("      \r\n");
      out.write("  </style>\r\n");
      out.write("  \r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("    <body>\r\n");
      out.write(" <!-- Banner Copy  -->\r\n");
      out.write(" \r\n");
      out.write("      <section id=\"index-menu-0\">\r\n");
      out.write("\r\n");
      out.write("    <nav class=\"navbar navbar-dropdown bg-color transparent navbar-fixed-top\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("\r\n");
      out.write("            <div class=\"mbr-table\">\r\n");
      out.write("                <div class=\"mbr-table-cell\">\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"navbar-brand\">\r\n");
      out.write("                        <a class=\"navbar-caption text-danger\" href=\"Main.html\" style=\"padding: 0 0 0 50px; margin-bottom: 20px;\">Travel Planning</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"mbr-table-cell\">\r\n");
      out.write("\r\n");
      out.write("                    <button class=\"navbar-toggler pull-xs-right hidden-md-up\" type=\"button\" data-toggle=\"collapse\" data-target=\"#exCollapsingNavbar\">\r\n");
      out.write("                        <div class=\"hamburger-icon\"></div>\r\n");
      out.write("                    </button>\r\n");
      out.write("\r\n");
      out.write("                    <ul class=\"nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm\" id=\"exCollapsingNavbar\">\r\n");
      out.write("                    <li class=\"nav-item\"><a class=\"nav-link link\" href=\"#\" aria-expanded=\"false\">Contact</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    <button hidden=\"\" class=\"navbar-toggler navbar-close\" type=\"button\" data-toggle=\"collapse\" data-target=\"#exCollapsingNavbar\">\r\n");
      out.write("                        <div class=\"close-icon\"></div>\r\n");
      out.write("                    </button>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </nav>\r\n");
      out.write("\r\n");
      out.write("</section>\r\n");
      out.write("        \r\n");
      out.write("        <!-- - - - - - - - - Background - - - - - - - - - - -->\r\n");
      out.write("        \r\n");
      out.write("        <div id=\"background-slide\" style=\"position: fixed\">\r\n");
      out.write("                    <img class=\"mySlides w3-animate-fading\" src=\"img/PicforBackgroundWLCpage/slide1.jpg\" style=\"width: 100%\">\r\n");
      out.write("                    <img class=\"mySlides w3-animate-fading\" src=\"img/PicforBackgroundWLCpage/slide2.jpg\" style=\"width: 100%\">\r\n");
      out.write("                    <img class=\"mySlides w3-animate-fading\" src=\"img/PicforBackgroundWLCpage/slide3.jpg\" style=\"width: 100%\">\r\n");
      out.write("                    <img class=\"mySlides w3-animate-fading\" src=\"img/PicforBackgroundWLCpage/slide5.jpg\" style=\"width: 100%\">\r\n");
      out.write("                    <img class=\"mySlides w3-animate-fading\" src=\"img/PicforBackgroundWLCpage/slide7.jpg\" style=\"width: 100%\">\r\n");
      out.write("                </div>\r\n");
      out.write("        \r\n");
      out.write("     <!-- - - - - - - - - - Begin OutMost Div - - - - - - - -->\r\n");
      out.write("     \r\n");
      out.write("        <div  style=\"margin-left: 15%; margin-right:15%;padding-top:5%; margin-bottom: 10%; align-content: center;\">\r\n");
      out.write("            \r\n");
      out.write("            <div style=\"text-align: center; font-size: 340%; margin-bottom:1%; font-style: oblique;\">\r\n");
      out.write("                Create your  Account\r\n");
      out.write("                <br>\r\n");
      out.write("                <span style = \"font-size : 37.5%\">Fill In The Boarding Ticket\r\n");
      out.write("                    And We Are Ready To Go </span>\r\n");
      out.write("            </div>\r\n");
      out.write("        \r\n");
      out.write("            \r\n");
      out.write("           \r\n");
      out.write("            \r\n");
      out.write("            <!-- - - - - - - - - - FORM - - - - - - - -->\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            <div class=\"signupform\" style=\"border: 5px solid #e5e5e5;  padding: 2%;\r\n");
      out.write("  background: #f1f1f1; margin-left: 26%; margin-right: 26%;\">\r\n");
      out.write("                <form>\r\n");
      out.write("                      <input type=\"hidden\" name=\"command\" value=\"addrecord\">\r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("                <!-- - - - - - -USERNAME + PASS - - - - - -->    \r\n");
      out.write("                 <div style=\"margin-bottom: 4%\">\r\n");
      out.write("                    <fieldset style=\"border-radius: 7px;\">\r\n");
      out.write("                        \r\n");
      out.write("                        <legend>Account Info.</legend>\r\n");
      out.write("                         <div class=\"form-group\">\r\n");
      out.write("                           \r\n");
      out.write("                             <input type=\"text\" size=\"25\" placeholder=\"Username\" maxlength =\"20\" class=\"form-control\" id=\"username\" name=\"username\" style=\"width: 55%;\">\r\n");
      out.write("                      \r\n");
      out.write("                           \r\n");
      out.write("                                    \r\n");
      out.write("                       \r\n");
      out.write("                            \r\n");
      out.write("                             <input class=\"form-control\" size=\"25\" placeholder=\"Password\" type=\"password\" id=\"password\" onkeyup=\"CheckPasswordStrength(this.value)\" style=\"width: 55%;\">\r\n");
      out.write("                                <span id=\"password_strength\" style=\"font-size:70%; padding-left: 25%\"></span>\r\n");
      out.write("                        \r\n");
      out.write("                        \r\n");
      out.write("                       \r\n");
      out.write("                                <br>\r\n");
      out.write("                        \r\n");
      out.write("                        <input class=\"form-control\" size=\"25\" placeholder=\"Confirm Password\" type=\"password\" id=\"password\" style=\"width: 55%;\">\r\n");
      out.write("  \r\n");
      out.write("                        </div> \r\n");
      out.write("                    </fieldset>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("                <!-- - - - - - - - - NAME - - - - -  - -->\r\n");
      out.write("                <div style=\"margin-bottom: 4%\">\r\n");
      out.write("                    <fieldset style=\"border-radius: 7px;\">\r\n");
      out.write("                        \r\n");
      out.write("                        <legend>Name</legend>\r\n");
      out.write("                        \r\n");
      out.write("                         <div class=\"form-group\">\r\n");
      out.write("                           \r\n");
      out.write("                             <input type=\"text\" size=\"30\" placeholder=\"First\" maxlength =\"30\" class=\"form-control\" id=\"firstname\" name=\"firstname\" style=\"width: 50%;\">\r\n");
      out.write("                             <input type=\"text\" size=\"30\" placeholder=\"Last\" maxlength =\"30\" class=\"form-control\" id=\"lastname\" name=\"name\" style=\"width: 50%;\">\r\n");
      out.write("                           \r\n");
      out.write("                         </div> \r\n");
      out.write("                        \r\n");
      out.write("                    </fieldset>\r\n");
      out.write("                </div>\r\n");
      out.write("             \r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("                <!-- - - - - - - - Birthday - - - - - -->\r\n");
      out.write("                \r\n");
      out.write("             <div style=\"margin-bottom: 4%\">\r\n");
      out.write("                    <fieldset style=\"border-radius: 7px;\">\r\n");
      out.write("                        \r\n");
      out.write("                        <legend>Birthday</legend>\r\n");
      out.write("                        \r\n");
      out.write("                        <label>\r\n");
      out.write("                            \r\n");
      out.write("                           <select name=\"DOBMonth\">\r\n");
      out.write("                                \r\n");
      out.write("                                <option value=\"01\">January</option>\r\n");
      out.write("                                <option value=\"02\">February</option>\r\n");
      out.write("                                <option value=\"03\">March</option>\r\n");
      out.write("                                <option value=\"04\">April</option>\r\n");
      out.write("                                <option value=\"05\">May</option>\r\n");
      out.write("                                <option value=\"06\">June</option>\r\n");
      out.write("                                <option value=\"07\">July</option>\r\n");
      out.write("                                <option value=\"08\">August</option>\r\n");
      out.write("                                <option value=\"09\">September</option>\r\n");
      out.write("                                <option value=\"10\">October</option>\r\n");
      out.write("                                <option value=\"11\">November</option>\r\n");
      out.write("                                <option value=\"12\">December</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </label>\r\n");
      out.write("                        \r\n");
      out.write("                       \r\n");
      out.write("                        \r\n");
      out.write("                        <label>\r\n");
      out.write("                            <input class =\"formfieldcontent\" type=\"text\" pattern=\"[0-9]\" maxlength=\"2\" size=\"2\" name=\"DOBday\" id=\"Birthday\" placeholder=\"Day\" >\r\n");
      out.write("                        </label>  \r\n");
      out.write("                        \r\n");
      out.write("                        <label>\r\n");
      out.write("                            <input class =\"formfieldcontent\" type=\"text\" pattern=\"[0-9]\" maxlength=\"4\" size=\"4\" name=\"DOByear\" id=\"Birthyear\" placeholder=\"Year\"  >\r\n");
      out.write("                        </label>\r\n");
      out.write("                        \r\n");
      out.write("                    </fieldset>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("                 <!-- - - - - - - - - Gender - - - - -  - -->\r\n");
      out.write("                <div style=\"margin-bottom: 4%\">\r\n");
      out.write("                    <fieldset style=\"border-radius: 7px;\">\r\n");
      out.write("                        \r\n");
      out.write("                        <legend>Gender</legend>\r\n");
      out.write("                        \r\n");
      out.write("                        \r\n");
      out.write("                        <label>\r\n");
      out.write("                            <input type=\"radio\" name=\"gender\" value=\"male\" checked> Male<br>\r\n");
      out.write("                        </label>\r\n");
      out.write("                        \r\n");
      out.write("                        \r\n");
      out.write("                        <label style=\"margin-left:5%\">\r\n");
      out.write("                            <input type=\"radio\" name=\"gender\" value=\"female\"> Female<br>\r\n");
      out.write("                        </label>  \r\n");
      out.write("                        \r\n");
      out.write("                        \r\n");
      out.write("                        <label style=\"margin-left:5%\">\r\n");
      out.write("                            <input type=\"radio\" name=\"gender\" value=\"other\"> Other\r\n");
      out.write("                        </label>\r\n");
      out.write("                        \r\n");
      out.write("                    </fieldset>\r\n");
      out.write("                </div>\r\n");
      out.write("                 \r\n");
      out.write("                 \r\n");
      out.write("                 \r\n");
      out.write("                <!-- - - - - - - - - Mobile Phone - - - - -  - -->\r\n");
      out.write("                <div style=\"margin-bottom: 4%\">\r\n");
      out.write("                    <fieldset style=\"border-radius: 7px;\">\r\n");
      out.write("                        \r\n");
      out.write("                        <legend>Mobile Phone</legend>\r\n");
      out.write("                    \r\n");
      out.write("\r\n");
      out.write("                       \r\n");
      out.write("                        <label>\r\n");
      out.write("                            <input class =\"formfieldcontent\" type=\"text\"  name=\"phone\"  id=\"PhoneNumber\" placeholder=\"(+)-\" >\r\n");
      out.write("                        </label>  \r\n");
      out.write("                        \r\n");
      out.write("  \r\n");
      out.write("                        \r\n");
      out.write("                    </fieldset>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("                 <!-- - - - - - - - - EMAIL - - - - -  - -->\r\n");
      out.write("                <div style=\"margin-bottom: 4%\">\r\n");
      out.write("                    <fieldset style=\"border-radius: 7px;\">\r\n");
      out.write("                        \r\n");
      out.write("                        <legend>Email</legend>\r\n");
      out.write("                        \r\n");
      out.write("                        <label>\r\n");
      out.write("                            <input class =\"formfieldcontent\" type=\"email\" id=\"email\" placeholder=\".com\" maxlength=\"40\" size=\"40\" spellcheck=\"false\">\r\n");
      out.write("                        </label>  \r\n");
      out.write("                        \r\n");
      out.write("                    </fieldset>\r\n");
      out.write("                </div>                \r\n");
      out.write("                    \r\n");
      out.write("                 \r\n");
      out.write("                    \r\n");
      out.write("                    <!-- - - - - - - - - LOCATION - - - - -  - -->\r\n");
      out.write("                <div style=\"margin-bottom: 4%\">\r\n");
      out.write("                    <fieldset style=\"border-radius: 7px;\">\r\n");
      out.write("                        \r\n");
      out.write("                        <legend>Country</legend>\r\n");
      out.write("                        \r\n");
      out.write("                        <label>\r\n");
      out.write("                            \r\n");
      out.write("                            <input class =\"formfieldcontent\"  type=\"text\" name=\"location\" id=\"location\" placeholder=\"Country\" maxlength=\"40\" size=\"40\" spellcheck=\"false\">\r\n");
      out.write("                        </label>  \r\n");
      out.write("                        \r\n");
      out.write("                    </fieldset>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <!-- - - - - - - BUTTON - - - - - - -->\r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("               \r\n");
      out.write("                <div style = \"text-align: center\" >\r\n");
      out.write("                    <input id=\"sumbitbutton\" name=\"submitbuton\" type=\"submit\" value=\"Sign Up for Free\" style=\"font-size : 135%; background-color:#655BFF; color: white; padding: 1.5%; border-radius: 18.5px; font-weight: 400; margin-top: 0.5%\">\r\n");
      out.write("                    \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("     \r\n");
      out.write("     \r\n");
      out.write("     \r\n");
      out.write("      <script type=\"text/javascript\">\r\n");
      out.write("    function CheckPasswordStrength(password) {\r\n");
      out.write("        var password_strength = document.getElementById(\"password_strength\");\r\n");
      out.write(" \r\n");
      out.write("        //TextBox left blank.\r\n");
      out.write("        if (password.length === 0) {\r\n");
      out.write("            password_strength.innerHTML = \"\";\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write(" \r\n");
      out.write("        //Regular Expressions.\r\n");
      out.write("        var regex = new Array();\r\n");
      out.write("        regex.push(\"[A-Z]\"); //Uppercase Alphabet.\r\n");
      out.write("        regex.push(\"[a-z]\"); //Lowercase Alphabet.\r\n");
      out.write("        regex.push(\"[0-9]\"); //Digit.\r\n");
      out.write("        regex.push(\"[$@$!%*#?&]\"); //Special Character.\r\n");
      out.write(" \r\n");
      out.write("        var passed = 0;\r\n");
      out.write(" \r\n");
      out.write("        //Validate for each Regular Expression.\r\n");
      out.write("        for (var i = 0; i < regex.length; i++) {\r\n");
      out.write("            if (new RegExp(regex[i]).test(password)) {\r\n");
      out.write("                passed++;\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write(" \r\n");
      out.write("        //Validate for length of Password.\r\n");
      out.write("        if (passed > 2 && password.length > 8) {\r\n");
      out.write("            passed++;\r\n");
      out.write("        }\r\n");
      out.write(" \r\n");
      out.write("        //Display status.\r\n");
      out.write("        var color = \"\";\r\n");
      out.write("        var strength = \"\";\r\n");
      out.write("        switch (passed) {\r\n");
      out.write("            case 0:\r\n");
      out.write("            case 1:\r\n");
      out.write("                strength = \"Weak\";\r\n");
      out.write("                color = \"red\";\r\n");
      out.write("                break;\r\n");
      out.write("            case 2:\r\n");
      out.write("                strength = \"Good\";\r\n");
      out.write("                color = \"darkorange\";\r\n");
      out.write("                break;\r\n");
      out.write("            case 3:\r\n");
      out.write("            case 4:\r\n");
      out.write("                strength = \"Strong\";\r\n");
      out.write("                color = \"green\";\r\n");
      out.write("                break;\r\n");
      out.write("            case 5:\r\n");
      out.write("                strength = \"Very Strong\";\r\n");
      out.write("                color = \"darkgreen\";\r\n");
      out.write("                break;\r\n");
      out.write("        }\r\n");
      out.write("        password_strength.innerHTML = strength;\r\n");
      out.write("        password_strength.style.color = color;\r\n");
      out.write("    }\r\n");
      out.write("</script> \r\n");
      out.write("     \r\n");
      out.write("    </body>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write(" \r\n");
      out.write("    \r\n");
      out.write("<!-- FOOTER copy -->\r\n");
      out.write("\r\n");
      out.write("<footer class=\"mbr-small-footer mbr-section mbr-section-nopadding\" id=\"main-footer1-0\" style=\"background-color: rgb(50, 50, 50); padding-top: 1.75rem; padding-bottom: 1.75rem;\">\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <p class=\"text-xs-center\"><strong>Copyright (c) 2016 Travel Planning.</strong></p>\r\n");
      out.write("    </div>\r\n");
      out.write("</footer>    \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- Import js -->\r\n");
      out.write("\r\n");
      out.write(" <script src=\"assets/web/assets/jquery/jquery.min.js\"></script>\r\n");
      out.write("  <script src=\"assets/tether/tether.min.js\"></script>\r\n");
      out.write("  <script src=\"assets/bootstrap/js/bootstrap.min.js\"></script>\r\n");
      out.write("  <script src=\"assets/smooth-scroll/SmoothScroll.js\"></script>\r\n");
      out.write("  <script src=\"assets/viewportChecker/jquery.viewportchecker.js\"></script>\r\n");
      out.write("  <script src=\"assets/dropdown/js/script.min.js\"></script>\r\n");
      out.write("  <script src=\"assets/touchSwipe/jquery.touchSwipe.min.js\"></script>\r\n");
      out.write("  <script src=\"assets/jarallax/jarallax.js\"></script>\r\n");
      out.write("  <script src=\"assets/theme/js/script.js\"></script>\r\n");
      out.write("  \r\n");
      out.write("  <script>\r\n");
      out.write("      \r\n");
      out.write("       var myIndex = 0;\r\n");
      out.write("            carousel();\r\n");
      out.write("\r\n");
      out.write("            function carousel() {\r\n");
      out.write("                var i;\r\n");
      out.write("                var x = document.getElementsByClassName(\"mySlides\");\r\n");
      out.write("                for (i = 0; i < x.length; i++) {\r\n");
      out.write("                    x[i].style.display = \"none\";\r\n");
      out.write("                }\r\n");
      out.write("                myIndex++;\r\n");
      out.write("                if (myIndex > x.length) {\r\n");
      out.write("                    myIndex = 1;\r\n");
      out.write("                }\r\n");
      out.write("                x[myIndex - 1].style.display = \"block\";\r\n");
      out.write("                setTimeout(carousel, 4000);\r\n");
      out.write("            }\r\n");
      out.write("      \r\n");
      out.write("      \r\n");
      out.write("      \r\n");
      out.write("      </script>\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  <input name=\"animation\" type=\"hidden\">\r\n");
      out.write("   <div id=\"scrollToTop\" class=\"scrollToTop mbr-arrow-up\"><a style=\"text-align: center;\"><i class=\"mbr-arrow-up-icon\"></i></a></div>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
