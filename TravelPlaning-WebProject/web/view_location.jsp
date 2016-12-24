<%-- 
    Document   : view_location
    Created on : Dec 4, 2016, 10:23:12 AM
    Author     : CREAT10N
--%>

<%@page import="Control.ImageControl"%>
<%@page import="Data.*"%>
<%@page import="Connect.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Location Page</title>
        <script src="js/jquery-3.1.1.min.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/bootstrap-material-design-font/css/material.css">
        <link rel="stylesheet" href="assets/tether/tether.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/socicon/css/socicon.min.css">
        <link rel="stylesheet" href="assets/animate.css/animate.min.css">
        <link rel="stylesheet" href="assets/dropdown/css/style.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
        <link rel="stylesheet" href="css/star-rating.min.css">
        <script type="text/javascript" src="js/star-rating.min.js"></script>
        <style>
            *{
                margin: 0px auto;
                padding: 0px;
                box-sizing: border-box;
            }

            body{
                background-color: #FDF3E7;
            }

            #location{
                margin-top: 7%;
                padding-top: 9%;
                width: 1000px;
                height: auto;
            }

            /*Location name*/
            #title{
                width: 100%;
                height: 50px;
                font-size: 36px;
                margin-bottom: 2%;
            }

            /*Location pic*/
            #picture{
                text-align: center;
                width: 100%;
                float: left;
            }

            /*Location info*/
            #info{
                width: 80%;
                margin: 0 auto;
            }

            /*Each of location info*/
            li{
                padding-top: 3%; 
                padding-bottom: 3%; 
                width: 33%;
                float: left;
            }

            /*Location rated star*/
            #rated{
                margin-bottom: 3%;
                text-align: center;
            }

            /*Location description*/
            #description{
                margin-bottom: 10%;
            }

            br{
                clear: both;
            }

            #comment{
                width: 1000px;
                height: auto;
            }

            .comment-block{
                display: none;
            }

            .comment-block.active{
                display: block;
            }

            /*Comment avatar*/
            .comment-avatar{
                float: left;
                width: 150px;
                padding-top: 1%;
                text-align: center;
            }

            /*Comment description*/
            .comment-desc{
                float: left;
                width: 600px;
                background: #FFFFFF;
                padding: 2%;
            }

            /*Comment rating*/
            .comment-rate{
                text-align: right;
                padding-top: 4%;
            }

            /*Load More Comments button*/
            a#loadMore, a#loadMore:visited {
                text-decoration: none;
                display: block;
                margin: 10px 0;
            }

            a#loadMore:hover {
                text-decoration: none;
            }

            #loadMore {
                padding: 10px;
                text-align: center;
                background-color: #33739E;
                color: #fff;
                border-width: 0 1px 1px 0;
                border-style: solid;
                border-color: #fff;
                box-shadow: 0 1px 1px #ccc;
                transition: all 600ms ease-in-out;
                -webkit-transition: all 600ms ease-in-out;
                -moz-transition: all 600ms ease-in-out;
                -o-transition: all 600ms ease-in-out;
            }

            #loadMore:hover {
                background-color: #fff;
                color: #33739E;
            }

            /*User comment form*/
            #comment-form{
                margin: 10% 0;
            }
        </style>

        <!--Get and display Location information from database--> 
        <%
            Connection c = DBConnect.getConnection();
            String ID = request.getParameter("LocationID");
            int LocationID = 0;
            LocationID = Integer.parseInt(ID);
            Location l = new Location();

            Statement st = c.createStatement();
            ResultSet rs;
            String query = "SELECT * FROM Locations WHERE LocationID='" + LocationID + "'";
            rs = st.executeQuery(query);
            if (rs.next()) {
                l.setID(rs.getInt("LocationID"));
                l.setName(rs.getString("NameLocation"));
                l.setCity(rs.getString("City"));
                l.setCountry(rs.getString("Country"));
                l.setPrice(rs.getDouble("Price"));
                l.setDescription(rs.getString("Description"));
                l.setType(LocationType.valueOf(rs.getString("TypeLocation").toUpperCase()));
            }
        %>

        <!--Get the list of comment from the location-->
        <%
            List<Comment> listComment = new ArrayList<Comment>();
            query = "SELECT * FROM Comments WHERE LocationID='" + LocationID + "' ORDER BY Rate DESC";
            rs = st.executeQuery(query);
            while (rs.next()) {
                Comment comment = new Comment(rs.getInt("CommentID"), rs.getInt("UserID"),
                        rs.getInt("LocationID"), rs.getString("Description"), rs.getDouble("Rate"));
                listComment.add(comment);
            }
        %>
    </head>
    <body>
        <jsp:include page="_header.jsp" flush="true"/>

        <div class="container" id="location">

            <!--Name of the location-->
            <div id="title"><b><%=l.getName()%></b></div>

            <!--Picture of the location-->
            <div id="picture">
                <!--Getting Location Image from dropbox repository-->
                <img src="<%=ImageControl.importLocationImage(LocationID)%>" 
                     alt="This location image has been removed" 
                     class="img-responsive" style="width: 100%; height: 450px;"/>
            </div>

            <!--Some information of the location-->
            <div id="info">
                <ul>
                    <li><b>Country:</b> <%=l.getCountry()%></li>
                    <li><b>City:</b> <%=l.getCity()%></li>
                    <li><b>Price:</b> <%=l.getPrice()%>$</li>
                    <li class="text-capitalize"><b>Type:</b> <%=l.getType().name().toLowerCase()%></li>
                </ul>
            </div><br>

            <!--Star rating of the location-->
            <div id="rated">
                <!--Calculate the location average rating--> 
                <%
                    double avg = 0;
                    for (Comment comment : listComment) {
                        avg += comment.getRate();
                    }
                    avg = avg / listComment.size();
                %>
                <input id="location-rating" value="<%=avg%>" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs">
            </div>

            <!--Brief description of the location-->
            <div id="description">
                <p><b>Brief Description</b></p>
                <hr>
                <p><%=l.getDescription()%></p>
            </div>
        </div>

        <div class="container" id="comment">
            <p><b>Comments / Reviews</b></p>
            <hr>

            <!--Using for loop to show comments-->
            <%
                for (Comment comment : listComment) {
            %>
            <div class="comment-block">
                <!--User avatar-->
                <div class="comment-avatar">
                    <img src="<%=ImageControl.importUserAvatar(comment.getUserID())%>" 
                         class="img-circle" width="75px" height="75px"/>
                </div>

                <!--User's comment description-->
                <div class="comment-desc">
                    <%
                        String username = null;
                        int userID = comment.getUserID();
                        query = "SELECT * FROM Users WHERE UserID='" + userID + "'";
                        rs = st.executeQuery(query);
                        if (rs.next()) {
                            username = rs.getString("Username");
                        }
                    %>
                    <a href="user_profile.jsp?UserID=<%=userID%>" target="_blank"><b><%=username%></b></a>
                    <hr>
                    <p><%=comment.getDescription()%></p>
                </div>

                <!--User's comment rated-->
                <div class="comment-rate">
                    <input value="<%=comment.getRate()%>" type="number" 
                           class="user-rating rating" min=0 max=5 step=0.5 data-size="xs">      
                </div>
                <br><hr>
            </div>
            <% }%>
            <a id="loadMore">Load More</a>

            <%
                // Get user from session
                User user = (User) session.getAttribute("user");

                if (user != null) {
            %>
            <form id="comment-form" action="CommentControl" method="post">
                <input type="hidden" name="locationID" value="<%=LocationID%>">
                <input type="hidden" name="url" value="view_location.jsp?LocationID=<%=LocationID%>">

                <p><b>Your Review</b></p>
                <hr>
                <div class="comment-avatar">
                    <img src="<%=ImageControl.importUserAvatar(user.getID())%>" 
                         class="img-circle" width="75px" height="75px"/>
                </div>
                <div class="comment-desc">
                    <textarea name="comment" class="form-control" rows="5" id="comment" style="width: 100%; background: #FFFFFF;"></textarea>
                </div>
                <div class="comment-rate">
                    <input name="rating" id="input-rating" value="3" type="number" class="rating" min=1 max=5 step=0.5 data-size="xs">
                </div>
                <div>
                    <input style="margin-left: 80%;" class="btn btn-default" type="submit" value="Post Review"/>
                </div>
            </form>
            <% }%>
        </div>

        <jsp:include page="_footer.jsp" flush="true"/>
    </body>
    <script>
        var $j = jQuery.noConflict();
        $j(document).ready(function () {
            $("#location-rating").rating({
                showCaption: false,
                showClear: false,
                displayOnly: true
            });
            $(".user-rating").rating({
                showCaption: false,
                showClear: false,
                displayOnly: true
            });
            $("#input-rating").rating({
                showCaption: false,
                showClear: false
            });

            $(".comment-block").slice(0, 3).show();
            $('#loadMore').click(function () {
                $(".comment-block:hidden").slice(0, 5).slideDown();
                if ($(".comment-block:hidden").length === 0) {
                    $("#loadMore").fadeOut('slow');
                }
            });
        });
    </script>
</html>
