/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Connect.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author CREAT10N
 */
public class EditLocation extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String locationID = request.getParameter("locationID");
        double price;
        int morning;
        int afternoon;
        int evening;
        String briefDes = request.getParameter("briefDes");
        
        if (request.getParameter("price") == null) {
            price = 0.0;
        } else {
            price = Double.parseDouble(request.getParameter("price"));
        }
        
        if (request.getParameter("morning") == null) {
            morning = 0;
        } else {
            morning = 1;
        }
        
        if (request.getParameter("afternoon") == null) {
            afternoon = 0;
        } else {
            afternoon = 1;
        }
        
        if (request.getParameter("evening") == null) {
            evening = 0;
        } else {
            evening = 1;
        }

        String url = "view_location.jsp?LocationID=" + locationID;
        
        Connection c = DBConnect.getConnection();
        try {
            Statement st = c.createStatement();
            ResultSet rs;
            String query = "UPDATE Locations SET Price=" + price + ", Morning=" + morning + ", Afternoon=" + afternoon 
                    + ", Evening=" + evening + ", Description='" + briefDes + "' WHERE LocationID=" + locationID;
            int i = st.executeUpdate(query);
            if (i > 0) {
                response.sendRedirect(url);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditLocation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
