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
        List<Location> listLocations = getLocation(request, response, listCity, listDaysOfCity, country);
        iterator = listLocations.listIterator();
        out.println("<ul>List of locations:");
        while (iterator.hasNext())
        {
            Location location = (Location) iterator.next();
            out.println("<li>" + location.display());
        }
        out.println("</ul>");
            
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
        String numsCityUser = request.getParameter("numsCity");
        if (numsCityUser.equals("one") || (numsCityUser.equals("notKnown") && duration <= 4))
        {
            list.add(duration);
        }
        else
        {
            list.add((int) Math.round(duration / 2.0));             // first city
            list.add(duration - (int) Math.round(duration / 2.0));  // second city
        }
        
        return list;
    }
    
    /**
     * 
     * @param request
     * @param country
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
    
    /**
     * 
     * @param request
     * @param listCity
     * @param dayCity
     * @param country
     * @return List<Location>
     * @throws ServletException
     * @throws IOException 
     * 
     * Note: this function only works well if there is SUFFICIENT amount of data in the database
     *      Each type of location --> >= 5 reviews
     *      Each country --> >= 4 cities
     *      Multiple country
     * 
     * How to get locations ?
     *      Based on selected 'country' from user
     *      Based on generated 'city'
     *      Based on the 'average rate' and 'number of rates' of each location
     *      Based on different periods of day: morning | afternoon | evening
     *      Based on the type of each location and its relation with the chosen journey type
     *      Based on the price: standard | luxury [maybe optional]
     *      Coastal country: if user specifies and the trip lasts more than 3 days
     *          Include the beach with higher rate, in the mid-day morning of the duration
     *              for the corresponding city
     *      More than 2 days (>=3 days)--> location for last day: theme-park (if possible)
     *          Note: one theme-park for one trip only. If both locations are
     *          sufficient --> choose the last one
     * 
     * Algorithm:
     *      Get 'them-park' location (if any)
     *      Get 'beach' location (if any)
     *      Get list of all locations for morning
     *      Get list of all locations for afternoon
     *          Check for duplication
     *      Get list of all location for evening
     *          Check for duplication
     * 
     * Return a List<Location> specifying all the locations in the trip
     * 
     */
    private List<Location> getLocation(HttpServletRequest request, HttpServletResponse response,
            List<String> listCity, List<Integer> dayCity, String country)
            throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        
        List<Location> listLocations = new ArrayList<>();
        
        // Get database connection
        Connection connection = DBConnect.getConnection();
        
        // Check, and get theme-park location
        Location park = null;
        if (dayCity.get(0) >= 3)
        {
            try
            {
                Statement statement = connection.createStatement();
                
                // Get the city
                String city;
                if (dayCity.size() == 2 && dayCity.get(0) > 2 && dayCity.get(1) > 2)
                {
                    city = listCity.get(1);
                }
                else
                {
                    city = listCity.get(0);
                }
                
                // Check whether there is theme-park location registered or not
//                String query = "SELECT LocationID "
//                        + "FROM Locations "
//                        + "WHERE TypeLocation = '" + LocationType.THEMEPARK.name() + "' "
//                        + "AND City = '" + city + "' "
//                        + "AND Country = '" + country + "';";
//                ResultSet test = statement.executeQuery(query);
//                if (test.next())        // there is theme-park registered
//                {
                // Construct query to get location 'park'
                String query = "SELECT Locations.LocationID as ID, "
                            + "Locations.NameLocation as Name, "         // name
                            + "Locations.City as City, "                 // city
                            + "Locations.Country as Country, "           // country
                            + "Locations.Price as Price, "               // price
                            + "Locations.Description as Description, "   // description
                            + "AVG(Comments.Rate) as AvgRate, "          // average rate
                            + "COUNT(Comments.Rate) as NumsRate "        // number of rates
                            + "FROM Locations INNER JOIN Comments "
                            + "ON Locations.LocationID = Comments.LocationID "
                            + "WHERE Country = '" + country + "' "       // match country
                            + "AND City = '" + city + "' "               // match city
                            + "AND Locations.TypeLocation = '" + LocationType.THEMEPARK.name() + "' "
                            + "GROUP BY ID "
                            + "ORDER BY AvgRate DESC, NumsRate DESC, Price ASC "
                            + "LIMIT 1; ";
                    
                // Get result
                ResultSet resultSet = statement.executeQuery(query);
//                    resultSet.next();       // move to the first, and only, result
                if (resultSet.next())       // there is at least one theme-park registered
                {
                    park = new Location();
                    park.setID(resultSet.getInt("ID"));     // assign value for park
                    park.setType(LocationType.THEMEPARK.name());
                    park.setName(resultSet.getString("Name"));
                    park.setCity(resultSet.getString("City"));
                    park.setCountry(resultSet.getString("Country"));
                    park.setPrice(resultSet.getDouble("Price"));
                    park.setDescription(resultSet.getString("Description"));
                    park.setAvgRate(resultSet.getDouble("AvgRate"));
                    
                    park.setMorning(true);
                    park.setAfternoon(true);
                    park.setEvening(true);
                    if (city.equals(listCity.get(0)))   // last day of first / only city
                    {
                        park.setDay(dayCity.get(0));
                    }
                    else                                // last day of second city
                    {
                        park.setDay(dayCity.get(0) + dayCity.get(1));
                    }
                }
                else            // no theme-park
                {
                    park = null;
                }
                
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
        }
        else            // no theme-park
        {
            park = null;
        }
        
        // Check, and get beach location
        Location beach = null;
        String beachPrefer = request.getParameter("beachPrefer");
        int totalDays = dayCity.get(0);
        if (dayCity.size() > 1)
            totalDays += dayCity.get(1);
        boolean haveBeach;
        
        if (totalDays > 3 && beachPrefer.equals("yes")) // user wish + more than 3-day trip
        {
            haveBeach = true;
        }
        else
        {
            haveBeach = false;
        }
        if (haveBeach)      //  include beach
        {
            try
            {
                Statement statement = connection.createStatement();
                
                // Construct query to find the beach with highest rate
                String query = "SELECT Locations.LocationID as ID, "
                        + "Locations.NameLocation as Name, "         // name
                        + "Locations.City as City, "                 // city
                        + "Locations.Country as Country, "           // country
                        + "Locations.Price as Price, "               // price
                        + "Locations.Description as Description, "   // description
                        + "AVG(Comments.Rate) as AvgRate, "          // average rate
                        + "COUNT(Comments.Rate) as NumsRate "        // number of rates
                        + "FROM Locations INNER JOIN Comments "
                        + "ON Locations.LocationID = Comments.LocationID "
                        + "WHERE Locations.TypeLocation = '" + LocationType.BEACH.name() + "' "
                        + "AND Country = '" + country + "' "
                        + "AND City IN ('" + listCity.get(0) + "'";
                if (listCity.size() > 1)
                {
                    query += ", '" + listCity.get(1) + "') ";
                }
                else
                {
                    query += ") ";
                }
                query = query + "GROUP BY City "
                        + "ORDER BY AvgRate DESC, NumsRate DESC, Price ASC "
                        + "LIMIT 1;";
                ResultSet resultSet = statement.executeQuery(query);
                if (resultSet.next())      // there is at least a beach in either of two cities
                {
                    // Get the highest-rate (and only) beach
                    beach = new Location();
                    beach.setID(resultSet.getInt("ID"));
                    beach.setType(LocationType.BEACH.name());
                    beach.setName(resultSet.getString("Name"));
                    beach.setCity(resultSet.getString("City"));
                    beach.setCountry(resultSet.getString("Country"));
                    beach.setPrice(resultSet.getDouble("Price"));
                    beach.setDescription(resultSet.getString("Description"));
                    beach.setAvgRate(resultSet.getDouble("AvgRate"));
                    
                    // Determine the day
                    int day;
                    if (beach.getCity().equals(listCity.get(0)))    // first city
                    {
                        day = dayCity.get(0) / 2;   // mid day of duration for first city
                    }
                    else            // second city
                    {
                        day = dayCity.get(0) + dayCity.get(1) / 2;  // mid day of duration for second city
                    }
                    beach.setDay(day);
                    beach.setMorning(true);
                    beach.setAfternoon(false);
                    beach.setEvening(false);
                }
                else            // no beach
                {
                    beach = null;
                }
                
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
        }
        else                // not include beach
        {
            beach = null;
        }
        
        // Get list of other locations
        
        // Assign
        if (park != null)
        {
            listLocations.add(park);
        }
        if (beach != null)
        {
            listLocations.add(beach);
        }
        
        // Close connection
        if (connection != null)
        {
            try
            {
                connection.close();
            } catch (SQLException sqle) {
                
            }
        }
        
        return listLocations;
    }
}
