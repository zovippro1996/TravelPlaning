package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class input_005fgetting_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <meta name=\"generator\" content=\"Mobirise v3.7.3, mobirise.com\">\r\n");
      out.write("        <meta name=\"description\" content=\"Help users to manage their travel plans with a click of a button.\">\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"assets/images/hexa1-128x128-80.png\" type=\"image/x-icon\">\r\n");
      out.write("        <title>Plan Generate Interface</title>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/input_getting_style.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"bootstrap-3.3.7-dist/css/bootstrap.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/et-line-font-plugin/style.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/bootstrap-material-design-font/css/material.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/tether/tether.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/bootstrap/css/bootstrap.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/socicon/css/socicon.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/animate.css/animate.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/dropdown/css/style.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/theme/css/style.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/mobirise/css/mbr-additional.css\" type=\"text/css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- Open nav drawer extensive js -->\r\n");
      out.write("        <script>\r\n");
      out.write("        function openNav() {\r\n");
      out.write("            document.getElementById(\"mySidenav\").style.width = \"250px\";\r\n");
      out.write("            document.getElementById(\"main\").style.marginLeft = \"250px\";\r\n");
      out.write("            document.body.style.backgroundColor = \"rgba(0,0,0,0.4)\";\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function closeNav() {\r\n");
      out.write("            document.getElementById(\"mySidenav\").style.width = \"0\";\r\n");
      out.write("            document.getElementById(\"main\").style.marginLeft= \"0\";\r\n");
      out.write("            document.body.style.backgroundColor = \"white\";\r\n");
      out.write("        }\r\n");
      out.write("        </script>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <div class=\"animate-bottom\">\r\n");
      out.write("            \r\n");
      out.write("            <!-- Upper section -->\r\n");
      out.write("            <div id=\"upper\">\r\n");
      out.write("                <!-- Header -->\r\n");
      out.write("                <section id=\"index-menu-0\">\r\n");
      out.write("                    <nav class=\"navbar navbar-dropdown bg-color transparent navbar-fixed-top\">\r\n");
      out.write("                        <div class=\"container\">\r\n");
      out.write("                            <div class=\"mbr-table\">\r\n");
      out.write("                                <div class=\"mbr-table-cell\">\r\n");
      out.write("                                    <div class=\"navbar-brand\">\r\n");
      out.write("                                        <div id=\"mySidenav\" class=\"sidenav\" style=\"z-index: 3;\">\r\n");
      out.write("                                            <a href=\"javascript:void(0)\" class=\"closebtn\" onclick=\"closeNav()\">&times;</a>\r\n");
      out.write("                                            <img src =\"assets/images/avatar.png\" />\r\n");
      out.write("                                            <a href=\"#\">Username:</a>\r\n");
      out.write("                                            <a href=\"#\">Email:</a>\r\n");
      out.write("                                            <a href=\"#\">Previous trips:</a>\r\n");
      out.write("                                            <a href=\"#\">Sign out</a>\r\n");
      out.write("                                        </div>  \r\n");
      out.write("                                        <span style=\"font-size:50px;cursor:pointer\" onclick=\"openNav()\">&#9776;</span>\r\n");
      out.write("                                        <a class=\"navbar-caption text-danger\" href=\"Main.html\" style=\"padding: 0 0 0 50px; margin-bottom: 20px;\">Travel Planning</a>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"mbr-table-cell\">\r\n");
      out.write("                                    <button class=\"navbar-toggler pull-xs-right hidden-md-up\" type=\"button\" data-toggle=\"collapse\" data-target=\"#exCollapsingNavbar\">\r\n");
      out.write("                                        <div class=\"hamburger-icon\"></div>\r\n");
      out.write("                                    </button>\r\n");
      out.write("\r\n");
      out.write("                                    <ul class=\"nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm\" id=\"exCollapsingNavbar\">\r\n");
      out.write("                                        <li class=\"nav-item\"><a class=\"nav-link link\" href=\"#\" aria-expanded=\"false\">Contact</a></li>\r\n");
      out.write("                                        <li class=\"nav-item\"><a class=\"nav-link link\" href=\"index.html\" aria-expanded=\"false\">Login/Logout</a></li>\r\n");
      out.write("                                        <li class=\"nav-item nav-btn\"><a class=\"nav-link btn btn-secondary-outline btn-secondary\" href=\"booking.html\">Start Travel Now!</a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                    <button hidden=\"\" class=\"navbar-toggler navbar-close\" type=\"button\" data-toggle=\"collapse\" data-target=\"#exCollapsingNavbar\">\r\n");
      out.write("                                        <div class=\"close-icon\"></div>\r\n");
      out.write("                                    </button>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </nav>\r\n");
      out.write("                </section>\r\n");
      out.write("\r\n");
      out.write("                <!-- Body -->\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    ");

                    // Get username; or just 'guest'
                    // Maybe try to determine whether this is the first time
                    // user tries to access the page -> change 'Welcome' accordingly
                    String username = "Krankai";
                    
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <!-- Welcoming section: welcome user -->\r\n");
      out.write("                    <div id=\"welcome\">\r\n");
      out.write("                        <h1 class=\"mbr-section-title display-1\">Welcome back, ");
      out.print(username);
      out.write("</h1>\r\n");
      out.write("                        <p style=\"margin-top: 30px\">\r\n");
      out.write("                            Thank you for still trusting and using our services.<br>\r\n");
      out.write("                            Our three managers, each with different style, will help\r\n");
      out.write("                            you plan your trip ahead.<br>\r\n");
      out.write("                            <span>Please</span> choose your preferred manager.&nbsp;\r\n");
      out.write("                        </p>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <!-- Manager section: contain information about three managers -->\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col-md-2 col-md-offset-1 manager-box\">\r\n");
      out.write("                            <img src=\"img/decker-manager.png\" alt=\"decker-manager\"\r\n");
      out.write("                                 width=\"100px\" height=\"130px\" class=\"center-block img-responsive\">\r\n");
      out.write("                            <br>\r\n");
      out.write("                            <div class=\"description center-block\">\r\n");
      out.write("                                Description for<br><span>Decker</span>.\r\n");
      out.write("                                <!-- Challenging trip; beautiful places -->\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-md-2 col-md-offset-2 manager-box\">\r\n");
      out.write("                            <img src=\"img/internationale-manager.png\" alt=\"internationale-manager\"\r\n");
      out.write("                                 width=\"100px\" height=\"130px\" class=\"center-block img-responsive\">\r\n");
      out.write("                            <br>\r\n");
      out.write("                            <div class=\"description center-block\">\r\n");
      out.write("                                Description for<br><span>Internationale</span>.\r\n");
      out.write("                                <!-- People care about cusine / food / cultures -->\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-md-2 col-md-offset-2 manager-box\">\r\n");
      out.write("                            <img src=\"img/olivia-manager.png\" alt=\"olivia-manager\"\r\n");
      out.write("                                 width=\"100px\" height=\"130px\" class=\"center-block img-responsive\">\r\n");
      out.write("                            <br>\r\n");
      out.write("                            <div class=\"description center-block\">\r\n");
      out.write("                                Description for<br><span>Olivia</span>.\r\n");
      out.write("                                <!-- People care about history / past -->\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <br clear=\"both\">\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <!-- Button for Decker -->\r\n");
      out.write("                        <div class=\"col-md-2 col-md-offset-1\">\r\n");
      out.write("                            <button class=\"btn btn-primary choose-btn center-block\">\r\n");
      out.write("                                <a href=\"#lower\"><b>Choose</b></a>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <!-- Button for Internationale -->\r\n");
      out.write("                        <div class=\"col-md-2 col-md-offset-2\">\r\n");
      out.write("                            <button class=\"btn btn-primary choose-btn center-block\">\r\n");
      out.write("                                <a href=\"#lower\"><b>Choose</b></a>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <!-- Button for Olivia -->\r\n");
      out.write("                        <div class=\"col-md-2 col-md-offset-2\">\r\n");
      out.write("                            <button class=\"btn btn-primary choose-btn center-block\">\r\n");
      out.write("                                <a href=\"#lower h1\"><b>Choose</b></a>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <br><br><br><hr style=\"border: 1px solid black\"><br><br><br> \r\n");
      out.write("            \r\n");
      out.write("            <!-- Lower section: for getting input to plan the trip -->\r\n");
      out.write("            <!-- Note: still in body -->\r\n");
      out.write("            <div id=\"lower\" class=\"container\">\r\n");
      out.write("                <h1>Form section</h1>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <br style=\"clear: both\">\r\n");
      out.write("            \r\n");
      out.write("            <!-- Footer -->\r\n");
      out.write("            <footer class=\"mbr-small-footer mbr-section mbr-section-nopadding\" id=\"main-footer1-0\" style=\"background-color: rgb(50, 50, 50); padding-top: 1.75rem; padding-bottom: 1.75rem;\">\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <p class=\"text-xs-center\"><strong>Copyright (c) 2016 Travel Planning.</strong></p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </footer>\r\n");
      out.write("        </div>\r\n");
      out.write("                    \r\n");
      out.write("        <script src=\"assets/web/assets/jquery/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/tether/tether.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/bootstrap/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/smooth-scroll/SmoothScroll.js\"></script>\r\n");
      out.write("        <script src=\"assets/viewportChecker/jquery.viewportchecker.js\"></script>\r\n");
      out.write("        <script src=\"assets/dropdown/js/script.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/touchSwipe/jquery.touchSwipe.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/jarallax/jarallax.js\"></script>\r\n");
      out.write("        <script src=\"assets/theme/js/script.js\"></script>\r\n");
      out.write("        \r\n");
      out.write("        <!-- Back-to-top button -->\r\n");
      out.write("        <input name=\"animation\" type=\"hidden\">\r\n");
      out.write("        <div id=\"scrollToTop\" class=\"scrollToTop mbr-arrow-up\">\r\n");
      out.write("            <a style=\"text-align: center;\"><i class=\"mbr-arrow-up-icon\"></i></a>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
