/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Connect.DBConnect;
import Data.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CREAT10N
 */
public class UserControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection c = DBConnect.getConnection();
        HttpSession session = request.getSession(true);
//        RequestDispatcher rd;

        //User Properties
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String password_encrypt = MD5.getMD5(request.getParameter("password"));
        String fullname = request.getParameter("firstname") + " " + request.getParameter("lastname");
        String DOB = request.getParameter("DOByear") + "-" + request.getParameter("DOBmonth") + "-" + request.getParameter("DOBday");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String User_Avatar = request.getParameter("User_Avatar");


        //Command for control
        String command = request.getParameter("command");
        boolean check = false;

        //Login Control
        if ("login".equals(command)) {
            try {
                Statement st = c.createStatement();
                ResultSet rs;
                // Query allows login with username or email
                String query = "SELECT * FROM Users WHERE (Username='" + username + "' OR Email='" + username
                        + "') AND (Password = '" + password + "') ";
                rs = st.executeQuery(query);
                if (rs.next()) {
                    User user = new User(rs.getInt("UserID"), rs.getString("Username"), rs.getString("Password"),
                            rs.getString("Fullname"), rs.getDate("DOB"), rs.getString("Gender"), rs.getString("Phone"),
                            rs.getString("Email"), rs.getString("City"), rs.getString("Country"), rs.getString("User_Avatar"));

                    session.setAttribute("user", user);

//                    rd = request.getServletContext().getRequestDispatcher("/main.jsp");
//                    rd.forward(request, response);
                    check = true;
                    response.sendRedirect("main.jsp");
                }

                query = "SELECT * FROM Providers WHERE (Username='" + username + "' OR Email='" + username
                        + "') AND (Password = '" + password + "') ";
                rs = st.executeQuery(query);
                if (rs.next()) {

                    User user = new User(rs.getInt("ProviderID"), rs.getInt("LocationID"), rs.getString("Username"), rs.getString("Password"),
                            rs.getString("Fullname"), rs.getDate("DOB"), rs.getString("Phone"),
                            rs.getString("Email"), rs.getString("City"), rs.getString("Country"));

                    session.setAttribute("user", user);

//                    rd = request.getServletContext().getRequestDispatcher("/main.jsp");
//                    rd.forward(request, response);
                    check = true;
                    response.sendRedirect("main.jsp");
                }
                
                if (!check) {
                    // Pop up if invalid login
                    // Then redirect to login page
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('You have entered incorrect username or password');");
                    out.println("location = 'login.jsp'");
                    out.println("</script>");
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserControl.class.getName()).log(Level.SEVERE, null, ex);
            }

        } 
         //SignUp Control    
        else if ("signupaccount".equals(command)) {
            try {
                Statement st = c.createStatement();
                ResultSet rs;
                

                int i = st.executeUpdate("insert into Users(username,password,fullname,DOB,gender,phone,email,country, city) values ('" + username + "','" + password_encrypt + "','" + fullname + "','" + DOB
                        + "','" + gender + "','" + phone + "','" + email + "','" + country + "','" + city + "')");

                if (i > 0) {
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Congratulation, your account has been created successfully, please log in to continue');");
                    out.println("location = 'login.jsp'");  //Not Sure About This "location"
                    out.println("</script>");

                } else {
                    response.sendRedirect("register.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserControl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }//End Of Sigup Control
        
        //Provider Sign-Up Control    
        else if ("signupaccount_provider".equals(command)) {
             PrintWriter out = response.getWriter();
             response.setContentType("text/html");
                
            String loc_name = request.getParameter("loc_name");
            String loc_description = request.getParameter("loc_description");
            String type = request.getParameter("type");
            String loc_country = request.getParameter("loc_country");
            String loc_city = request.getParameter("loc_city");
            double loc_price = Double.parseDouble(request.getParameter("loc_price"));
            int morning = Integer.parseInt(request.getParameter("loc_morning"));
            int afternoon = Integer.parseInt(request.getParameter("loc_afternoon"));
            int evening = Integer.parseInt(request.getParameter("loc_evening"));
            
            String locationID = new String();
            
            
            try {
                Statement st = c.createStatement();
                Statement st_1 = c.createStatement();
                ResultSet rs;
                
                int j = st_1.executeUpdate("insert into Locations(NameLocation, TypeLocation, City, Country, Price, Description, Morning, Afternoon, Evening) values ('" + loc_name + "','" + type + "','" + loc_city + "','" + loc_country
                        + "','" + loc_price + "','" + loc_description + "','" + morning + "','" + afternoon + "','" + evening + "')");
                
                String query_location = "select * from Locations where NameLocation='" +loc_name+"' ";
                rs = st.executeQuery(query_location);
                
                if (rs.next()) {
                    locationID = rs.getString("LocationID");
                }
                
                int i = st.executeUpdate("insert into Users(username,password,fullname,DOB,gender,phone,email,country, city, LocationID) values ('" + username + "','" + password_encrypt + "','" + fullname + "','" + DOB
                        + "','" + gender + "','" + phone + "','" + email + "','" + country + "','" + city + "','" + locationID + "')");
                
                
                if ((j>0) && (i > 0)) {
                   

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Sign Up Successfully');");
                    out.println("location = 'login.jsp'");  //Not Sure About This "location"
                    out.println("</script>");

                } else {
                    response.sendRedirect("register.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserControl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }//End Of Provider Register Control
        
        //Update Profile Control    
        else if ("update_profile".equals(command)) {
            User user = (User) session.getAttribute("user");
            String username_session = user.getUsername();

            try {
                Statement st = c.createStatement();
                ResultSet rs;

                int i = st.executeUpdate("update Users SET password='" + password_encrypt + "', fullname='" + fullname + "', DOB='" + DOB + "', gender='" + gender + "', phone='" + phone + "', country='" + country + "', city='" + city + "'"
                        + "where username='" + username_session + "'");

                if (i > 0) {
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Update Successfully');");
                    out.println("location = 'input_getting.jsp'");  //Not Sure About This "location"
                    out.println("</script>");

                } else {
                    response.sendRedirect("main.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserControl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }//End Of Update Profile Control
    }
}
