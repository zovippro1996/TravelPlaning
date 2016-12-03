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
        String country = getCountry(request);
        out.println("Country: " + country);
        
        // Get number of days for each city
        List<Integer> listDaysOfCity = getDaysCity(request);
        ListIterator iterator = listDaysOfCity.listIterator();
        out.println("<br>Number of city/cities: " + listDaysOfCity.size());
        out.println("<ul>Days for each city:");
        while (iterator.hasNext())
        {
            int days = (int) iterator.next();
            out.println("<li>" + days + " days");
        }
        out.println("</ul>");
        
        // Get list of cities
        List<String> listCity = getCity(request, country, listDaysOfCity);
        iterator = listCity.listIterator();
        out.println("<ol>List of city:");
        while (iterator.hasNext())
        {
            String city = (String) iterator.next();
            out.println("<li>" + city);
        }
        out.println("</ol>");
        
        // Get list of locations
            
        return null;
    }
    
    /**
     * 
     * @param request
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
     * Return a String specifying the Country user will visit
     * 
     */
    private String getCountry(HttpServletRequest request)
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
     * @return List<Integer>
     * @throws ServletException
     * @throws IOException 
     * 
     * Determine number of cities (max: 2)
     *      If number of days > 4 --> 2 cities
     *      If number of days <= 4 --> 1 city
     * 
     * Assign number of days at each city:
     *      First city --> round([number of days / 2])
     *      Second city --> remaining days
     * 
     * Return a List<Integer> specifying number of days user will
     *      spend for each visited cities
     * 
     */
    private List<Integer> getDaysCity(HttpServletRequest request)
            throws ServletException, IOException
    {
        List<Integer> list = new ArrayList<>();
        int duration = 0;
        
        // Get duration
        try
        {
            duration = Integer.parseInt(request.getParameter("duration"));
            
        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
            System.out.println("Invalid input 'duration'");
        }
        
        // Decide number of cities, and assign appropriate number of days for each
        if (duration > 4)       // choose 2 cities
        {   
            list.add((int) Math.round(duration / 2.0));             // first city
            list.add(duration - (int) Math.round(duration / 2.0));  // second city
        }
        else                    // choose 1 city
        {
            list.add(duration);     // the only city
        }
        
        return list;
    }
    
    /**
     * 
     * @param request
     * @param daysCity
     * @return List<String>
     * @throws ServletException
     * @throws IOException 
     * 
     * Choose city (cities), based on:
     *      Average rate of all users
     *      Type of journey - type of location
     *      Previous locations visited by user
     * 
     * Return a List<String> specifying all cities selected for the trip
     * 
     */
    private List<String> getCity(HttpServletRequest request, String country, List<Integer> daysCity)
            throws ServletException, IOException
    {
        List<String> listCity = new ArrayList<>();
        
        // Get database connection
        Connection connection = DBConnect.getConnection();
        
        // Get number of cities
        int numsCity = daysCity.size();
        
        // Get type of journey
        String paramType = request.getParameter("type");
        JourneyType journeyType = JourneyType.valueOf(paramType); // type of journey
                                                                  // as enum constant
                                             
        // Construct query to choose city
        String query = "SELECT Locations.City as City, "
                + "AVG(Comments.Rate) as AvgRate, "
                + "COUNT(Comments.Rate) as NumsRate "
                + "FROM Locations INNER JOIN Comments "
                + "ON Locations.LocationID = Comments.LocationID "
                + "WHERE Locations.Country = "
                + "'" + country + "' "                 // match country
                + "AND Locations.TypeLocation IN"
                + journeyType.getListLocationType()     // match location types
                + "GROUP BY City "
                + "ORDER BY AvgRate DESC, NumsRate DESC "
                + "LIMIT " + numsCity + ";";            // limit number of cities

        // Determine which cities based on records queried from database
        try
        {
            // Create statement
            Statement statement = connection.createStatement();
            
            // Execute query
            ResultSet resultSet = statement.executeQuery(query);
            
            // Get top city / cities --> assign to listCity
            while (resultSet.next())
            {
                listCity.add(resultSet.getString("City"));
            }
            
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        
        return listCity;
    }
}
