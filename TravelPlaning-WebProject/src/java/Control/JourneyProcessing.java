package Control;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import Data.*;
import Connect.*;

public class JourneyProcessing extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        // Warning user: do not support GET method
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        
        out.println("Our system do not support get method. There must be"
                + "something wrong...");
    }
    
    /**
     * 
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     * 
     * Functions: Generate journey + 
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        // Get utilities for debugging
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Connect to database; get session
        Connection connection = DBConnect.getConnection();
        HttpSession session = request.getSession(true);
        
        // Check action: generateJourney, or ...
        String action = request.getParameter("action");
        
        if (action.equals("generateJourney"))       // Generate journey
        {
            /**
             *  Country
             * 
             *  Set country as user specifies, or
             *  Choose a country in the selected continent, or
             *  Choose a country randomly 
             */
            String destination = request.getParameter("dest");
            String country = "";
            
            if (destination.equals("knownCountry"))     // user specifies preferred country
            {
                country = request.getParameter("country");
            }
            else if (destination.equals("knowContinent"))    // based on selected continent
            {
                // Get continent
                String continent = request.getParameter("continent");
                
                // Pick country based on the selected continent
            }
            else if (destination.equals("notKnown"))    // randomly
            {
                int numsCountry = 0, id;
                Random random = new Random(System.currentTimeMillis());
                String query;
                
                try
                {
                    Statement statement = connection.createStatement();
                    
                    // Get number of countries registered in the system
                    query = "SELECT COUNT(DISTINCT Country) AS Nums FROM Locations";
                    ResultSet resultSet = statement.executeQuery(query);
                    resultSet.next();
                    numsCountry = resultSet.getInt("Nums");
                    
                    // Pick a random country
                    id = random.nextInt(numsCountry) + 1;   // Determine country's entry
                    query = "SELECT DISTINCT Country FROM Locations ORDER BY Country";
                    resultSet = statement.executeQuery(query);
                    while (id-- > 0)        // Get the record in the determined entry
                    {
                        resultSet.next();
                    }
                    country = resultSet.getString("Country");
                    
                } catch (SQLException sqle) {
                    sqle.printStackTrace(out);
                }
            }
            else
            {
                out.println("<h1>Invalid option</h1>");
            }
            
            out.println("Country: " + country);
            
            /**
             *  Handle 'country' data
             * 
             *  If chosen country is not available in the system --> Apologize
             * 
             *  Otherwise; proceed to next step
             */
            
            
            
            /**
             *  City / Cities
             * 
             *  Decide how many cities user will visit in the trip (Max: 2)
             *      If NumberOfDays > 4 --> 2 cities chosen
             *      Otherwise --> 1 city chosen
             * 
             *  Choose cities based on: 
             *      Number of high-rate locations
             *      Type of journey
             *      Previous visited locations of user [optional]
             */
        }
    }
}