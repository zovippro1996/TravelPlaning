ackage Control;

import Connect.DBConnect;
import Control.Encrypt;
import Data.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;  
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Journey{

	int JourneyID;
	int UserID;
	real Budget =0;
	Date Deploydate;
	int days;
	String journeytype;


	public Journey(){}


	public Journey(String journeytype, int days, String country, boolean isluxury, int UserID)
	{

			 Connection c = DBConnect.getConnection();

			 // Find City suitable for the 

			Statement st = c.createStatement();
                ResultSet rs;
                List<String> City = GetCity(country, journeytype, days);
                String query = "select * from Location where City IN ('"+ City.get(0)+ "','"+City.get(1) +"') ";
                rs = st.executeQuery(query);
                while (rs.next()) {

                Budget += rs.getReal("price");


                 
                



	}

	query = ("Insert into Journey(UserID,budget,Deploydate,DurationDays,Type) values ('"+UserID+"','"+	Budget+"','" +fullname+"','"+DOB+"','" +gender+"','" + phone + "','" +email + "','" +  country + "')");
        


} 