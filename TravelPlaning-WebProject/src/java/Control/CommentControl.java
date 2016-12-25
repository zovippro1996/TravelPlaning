/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Connect.DBConnect;
import Data.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CREAT10N
 */
public class CommentControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        int userID = user.getID();
        int locationID = Integer.parseInt(request.getParameter("locationID"));
        String comment = request.getParameter("comment");
        double rating = Double.parseDouble(request.getParameter("rating"));

        String url = "view_location.jsp?LocationID=" + locationID;

        Connection c = DBConnect.getConnection();
        try {
            Statement st = c.createStatement();
            ResultSet rs;
            String query = "SELECT * FROM Comments WHERE (UserID=" + userID + " AND LocationID=" + locationID + ")";
            String query1;
            rs = st.executeQuery(query);
            if (rs.next()) {
                query1 = "UPDATE Comments SET Description='" + comment + "', Rate=" + rating + 
                        " WHERE (UserID=" + userID + " AND LocationID=" + locationID + ")"; 
                int i = st.executeUpdate(query1);
                if (i > 0) {
                    response.sendRedirect(url);
                }
            } else {
                query1 = "INSERT INTO Comments(UserID, LocationID, Description, Rate) values (" + userID + ", "
                        + locationID + ", '" + comment + "', " + rating + ")";
                int i = st.executeUpdate(query1);
                if (i > 0) {
                    response.sendRedirect(url);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
