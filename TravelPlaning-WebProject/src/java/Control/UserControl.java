/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Connect.DBConnect;
import Data.User;
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
        RequestDispatcher rd;

       //User Properties
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("firstname") +" "+ request.getParameter("lastname");
        String DOB = request.getParameter("DOByear") + "-" + request.getParameter("DOBmonth") + "-" + request.getParameter("DOBday");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
              
        //Command for control
        String command = request.getParameter("command");


        //Login Control
        if ("login".equals(command)) {
            try {
                Statement st = c.createStatement();
                ResultSet rs;
                String query = "select * from VUsers where username='" + username + "' AND password = '" + password + "' ";
                rs = st.executeQuery(query);
                if (rs.next()) {

                    User user = new User(rs.getInt("ID"), rs.getString("username"), rs.getString("password"),
                            rs.getString("fullname"), rs.getDate("DOB"), rs.getString("gender"), rs.getString("phone"),
                            rs.getString("email"), rs.getString("country"));

                    session.setAttribute("user", user);

                    rd = request.getServletContext().getRequestDispatcher("/main.jsp");
                    rd.forward(request, response);
                } else {
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

        } else
            
           //SignUp Control    
        if ("signupaccount".equals(command)){
                try {
                     Statement st = c.createStatement();
                     ResultSet rs;
                     PrintWriter out = response.getWriter();
                     
                     int i = st.executeUpdate("Insert into VUsers(username,password,fullname,DOB,gender,phone,email,country) values ('"+username+"','"+password+"','" +fullname+"','"+DOB+"','" +gender+"','" + phone + "','" +email + "','" +  country + "')");
        
                     
                     if (i > 0) {
                                 out.println("Sign up successful, please re-login to activate your account! Thank You");
                                 response.sendRedirect("Login.jsp");
                                } 
                    else {
                          response.sendRedirect("register.jsp");
                        }
                    } 
                 catch (SQLException ex) {
                         Logger.getLogger(UserControl.class.getName()).log(Level.SEVERE, null, ex);
                 }
                    
        }


    }
}
