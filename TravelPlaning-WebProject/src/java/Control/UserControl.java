/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Connect.DBConnect;
import Data.User;
import java.io.IOException;
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
        Connection c = DBConnect.getConnection();
        HttpSession session = request.getSession(true);
        RequestDispatcher rd;
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String command = request.getParameter("command");
        
        if ("search".equals(command)) {
            try {
                Statement st = c.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select * from VUsers where (username='" + username + "') AND password = '" + password + "' ");
                if (rs.next()) {

                    Cookie cookieRealUser = new Cookie("cookieRealUser", "true");
                    response.addCookie(cookieRealUser);
                                        
                    User user = new User(rs.getInt("ID"), rs.getString("username"), rs.getString("password"), 
                            rs.getString("fullname"), rs.getDate("DOB"), rs.getString("gender"), rs.getString("phone"), 
                            rs.getString("email"), rs.getString("country"));
                    
                    session.setAttribute("user", user);
                    
                    rd = request.getServletContext().getRequestDispatcher("/main.jsp");
                    rd.forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserControl.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
        }
    }
