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
        response.setContentType("text/html");
        
        // Check action: generateJourney, or ...
        String action = request.getParameter("action");
        
        if (action.equals("generateJourney"))
        {
            // Generate journey
            Journey journey = generateJourney(request, response);
            
            // Save journey in session
            HttpSession session = request.getSession(true);
            session.setAttribute("currentJourney", journey);
        }
    }
    
    /**
     * 
     * @param request
     * @param response
     * @return Journey
     * @throws ServletException
     * @throws IOException 
     * 
     * Generate and return a journey based on user's inputs
     */
    private Journey generateJourney(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        // For debugging
        PrintWriter out = response.getWriter();
        
        // Get country
        String country = getCountry(request, response);
        out.println("<h3>Country: " + country + "</h3>");
        
        // Get list of cities
        String listCity = getCity(request, response);
            
        return null;
    }
    
    /**
     * 
     * @param request
     * @param response
     * @return String
     * @throws ServletException
     * @throws IOException 
     * 
     * Choose country:
     *      If user specifies --> Set country as inputted
     * 
     *      If user indicates only continent --> choose a country randomly
     *          in the specified continent
     * 
     *      If user don't know which country at all --> choose randomly worldwide
     * 
     */
    private String getCountry(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String country = "Nothing";
        
        // Get database connection
        Connection connection = DBConnect.getConnection();
        
        // Decide how to set the country
        String destination = request.getParameter("dest");

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
        else if (destination.equals("notKnown"))    // randomly worldwide
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
                sqle.printStackTrace();
            }
        }
        else        // invalid input
        {
            country = "Invalid";
        }
        
        return country;
    }
    
    /**
     * 
     * @param request
     * @param response
     * @return String
     * @throws ServletException
     * @throws IOException 
     * 
     * Determine number of cities (max: 2):
     *      If number of days > 4 --> 2 cities
     *      If number of days <= 4 --> 1 city
     * 
     * Assign number of days at each city:
     *      First city --> round([number of days / 2])
     *      Second city --> remaining days
     * 
     * Choose city (cities), based on:
     *      Average rate of all users
     *      Type of journey - type of location
     *      Previous locations visited by user
     * 
     */
    private String getCity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        return "List cities";
    }
}
