/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connect;


import Data.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Steven
 */
public class DBConnect {
    public static Connection getConnection()
    {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://db4free.net:3306/usertp_db","traveladmin","travel123");
                
        }
    catch (Exception e)
    {
        e.printStackTrace();
    }
    return conn;
}
    // Function getUser to aquire User Object
     public User getUser(String username, String password){
 
        User user = null;
        try(Connection conn = this.getConnection()){
                        
            Statement stm = conn.createStatement();
            String sql = "SELECT * FROM TPUsers WHERE username = '"+username+"' and pass = '"+password+"'";
                    
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                user = new User();
//                user.setUserName(rs.getString("username"));
//                user.setUserPass(rs.getString("pass"));
//                user.setEmail(rs.getString("email"));
                
                
                break;
            }
        }
        catch(Exception ex){
        }
        
        return user;
    }
    
    // Uncomment to test Database connection
//    public static void main(String[] args) {
//        Connection c = DBConnect.getConnection();
//        Statement st;
//        try {
//            st = c.createStatement();
//             int i = st.executeUpdate("insert into users(id, name,email, pass) values ('5','MinhAnh','minhanh96@gmail.com','minhanh123')");
//        } catch (SQLException ex) {
//            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
  

