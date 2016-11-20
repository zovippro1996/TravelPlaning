/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Connect.DBConnect;
import Control.Encrypt;
import Data.Users;
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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Steven
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
        
        //Encrypt e = new Encrypt();
        
        String value = request.getParameter("rememberMe");
        boolean rememberMe = false;
        if(value != null && value.equalsIgnoreCase("on")){
        rememberMe = true;
}
        
       
        
        String name = request.getParameter("username"); 
        String nameoremail = request.getParameter("nameoremail"); 
        String email = request.getParameter("email");
        String pass ="";
       
            pass = request.getParameter("pass");
       
        
        String command = request.getParameter("command");
         
        
        if ("insert".equals(command))
        {  try {
            Statement st = c.createStatement();
//             ResultSet rs;
              int i = st.executeUpdate("insert into TPUsers(username,email, pass) values ('"+ name + "','" + email + "','" +  pass +"')");
         if (i > 0) {
             System.out.println("Sign up successful");
        response.sendRedirect("welcome.jsp");
         } 
         else {
        response.sendRedirect("index.jsp");
        }
        } 
        catch (SQLException ex) {
            Logger.getLogger(UserControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         
        }
        
         if ("search".equals(command))
         {         
             try {
                 
               if (rememberMe) {           //If your checkbox value is true
        Cookie cookieUsername = new Cookie("cookieLoginUser", name);
        Cookie cookiePassword = new Cookie("cookieLoginPassword",
                    pass);
            // Make the cookie one year last
        cookieUsername.setMaxAge(60 * 60 * 24 * 365);
        cookiePassword.setMaxAge(60 * 60 * 24 * 365);
        response.addCookie(cookieUsername);
        response.addCookie(cookiePassword);
}   
                 
                 
                 
            Statement st = c.createStatement();
            ResultSet rs;
              rs = st.executeQuery("select * from TPUsers where (username='"+nameoremail+"' OR email='"+nameoremail+"') AND pass = '"+pass + "' ");
        if (rs.next())
        {   
            
            Cookie cookieRealUser = new Cookie("cookieRealUser","true");
            response.addCookie(cookieRealUser);
            session.setAttribute("username",rs.getString("username") );
            response.sendRedirect("sucess.jsp");
        }
        } 
        catch (SQLException ex) {
            Logger.getLogger(UserControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         
        }
       
   
          
    }

   

}
