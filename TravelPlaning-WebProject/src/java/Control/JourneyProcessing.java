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
            
            // Forward to new page to display the generated journey
             RequestDispatcher dispatcher =
                     request.getServletContext().getRequestDispatcher("/display_journey.jsp");
             dispatcher.forward(request, response);
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
        
        // Get duration
        int duration = 0;
        try
        {
            duration = Integer.parseInt(request.getParameter("duration"));
            
        } catch (NumberFormatException nfe) {
            
        }
        
        // Get type of journey
        String paramType = request.getParameter("type");
        JourneyType journeyType = JourneyType.valueOf(paramType); // type of journey
                                                                  // as enum constant

        // Get country
        String country = getCountry(request);
        out.println("Country: " + country);
        
        // Get number of days for each city
        List<Integer> listDaysOfCity = getDaysCity(request, duration);
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
        List<String> listCity = getCity(country, listDaysOfCity, journeyType);
        iterator = listCity.listIterator();
        out.println("<ol>List of city:");
        while (iterator.hasNext())
        {
            String city = (String) iterator.next();
            out.println("<li>" + city);
        }
        out.println("</ol>");
        
//        // Get list of locations
//        List<Location> listLocations = getLocation(request, response, listCity,
//                listDaysOfCity, country);
//        iterator = listLocations.listIterator();
//        out.println("<ul>List of locations:");
//        while (iterator.hasNext())
//        {
//            Location location = (Location) iterator.next();
//            out.println("<li>" + location.display());
//            out.println("<br>Period: " + location.period());
//        }
//        out.println("</ul>");

        // Get list of all locations, grouped according to the day they are visited in the journey
        List<Day> listLocationsPerDay = getLocationsPerDay(request,
                listCity, listDaysOfCity, country, journeyType, duration);
        iterator = listLocationsPerDay.listIterator();
        out.println("<ul>List of locations per day:");
        while (iterator.hasNext())
        {
            Day day = (Day) iterator.next();
            out.println("<li>" + day.visitedLocations());
        }
        out.println("</ul>");
        
        // Save to Journey (Note: journeyID, userID and deployDate are not set here)
        Journey journey = new Journey();
        journey.setDuration(duration);
        journey.setType(journeyType.name());
        journey.setListDays(listLocationsPerDay);
        journey.setCountry(country);
        journey.setListCity(listCity);
        journey.setDaysCity(listDaysOfCity);
        journey.computeBudget();                // computer budget for the journey

        return journey;
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
        Statement statement = null;
        ResultSet resultSet = null;
        Connection connection = null;
        
        String country = "Nothing";
        
        // Get database connection
        connection = DBConnect.getConnection();
        
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
                statement = connection.createStatement();

                // Get number of countries registered in the system
                query = "SELECT COUNT(DISTINCT Country) AS Nums FROM Locations";
                resultSet = statement.executeQuery(query);
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
                
            } finally {
                try {resultSet.close();} catch (Exception e) {}
                try {statement.close();} catch (Exception e) {}
                try {connection.close();} catch (Exception e) {}
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
     * @param duration
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
    private List<Integer> getDaysCity(HttpServletRequest request, int duration)
            throws ServletException, IOException
    {
        List<Integer> list = new ArrayList<>();
        
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
     * @param country
     * @param daysCity
     * @param journeyType
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
    private List<String> getCity(String country, List<Integer> daysCity, JourneyType journeyType)
    {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        List<String> listCity = new ArrayList<>();
        
        // Get database connection
        connection = DBConnect.getConnection();
        
        // Get number of cities
        int numsCity = daysCity.size();
        
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
            statement = connection.createStatement();
            
            // Execute query
            resultSet = statement.executeQuery(query);
            
            // Get top city / cities --> assign to listCity
            while (resultSet.next())
            {
                listCity.add(resultSet.getString("City"));
            }
            
        } catch (SQLException sqle) {
            
        } finally {
            try {resultSet.close();} catch (Exception e) {}
            try {statement.close();} catch (Exception e) {}
            try {connection.close();} catch (Exception e) {}
        }
        
        return listCity;
    }
    
    /**
     * 
     * @param request
     * @param listCity
     * @param dayCity
     * @param country
     * @param type
     * @param duration
     * @return List<Day>
     * @throws ServletException
     * @throws IOException 
     * 
     * Note: (estimated) this function only works well if there is SUFFICIENT amount of data in the database
     *      Each type of location --> >= 5 reviews
     *      Each country --> >= 4 cities
     *      Multiple country
     *      Sufficient locations for morning / afternoon / evening
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
     *      Get 'theme-park' location (if any)
     *      Get 'beach' location (if any)
     *      Get list of all locations for morning
     *      Get list of all locations for afternoon
     *          Check for duplication
     *      Get list of all location for evening
     *          Check for duplication
     * 
     * Return a List<Day>, with each Day specifying locations user will visit in the trip
     * 
     */
    private List<Day> getLocationsPerDay(HttpServletRequest request,
            List<String> listCity, List<Integer> dayCity, String country,
            JourneyType type, int duration)
    {
//        List<Location> listLocations = new ArrayList<>();
        List<Day> listLocationsPerDay = new ArrayList<>();
        List<Integer> chosenID = new ArrayList<>();  // list of chosen locations's IDs
        
        // Check, and get theme-park location
        String parkPrefer = request.getParameter("parkPrefer");
        Location park = getPark(parkPrefer, dayCity, listCity, country);
        
        // Check, and get beach location
        String beachPrefer = request.getParameter("beachPrefer");
        Location beach = getBeach(beachPrefer, dayCity, listCity, country, duration);
        
        // Get list of locations for evening
        List<Location> eveningList = getLocationsPeriod(type, chosenID, country,
                listCity, dayCity, park, beach, "evening");
        for (int i = 0; i < eveningList.size(); ++i)    // construct list of current chosen locationIDs
        {
            chosenID.add(eveningList.get(i).getID());
        }
        
//        out.println("ChosenID: ");
//        for (int i = 0; i < chosenID.size(); ++i)
//        {
//            out.print(chosenID.get(i) + " ");
//        }
//        out.println("<br>");
        
        // Get list of locations for afternoon
        List<Location> afternoonList = getLocationsPeriod(type, chosenID, country,
                listCity, dayCity, park, beach, "afternoon");
        for (int i = 0; i < afternoonList.size(); ++i)  // construct list of current chosen locationIDs
        {
            chosenID.add(afternoonList.get(i).getID());
        }
        
//        out.println("ChosenID: ");
//        for (int i = 0; i < chosenID.size(); ++i)
//        {
//            out.print(chosenID.get(i) + " ");
//        }
//        out.println("<br>");
        
        // Get list of locations for morning
        List<Location> morningList = getLocationsPeriod(type, chosenID, country,
                listCity, dayCity, park, beach, "morning");
        for (int i = 0; i < morningList.size(); ++i)
        {
            chosenID.add(morningList.get(i).getID());   // add chosen location's ID to the list
        }
        
//        out.println("ChosenID: ");
//        for (int i = 0; i < chosenID.size(); ++i)
//        {
//            out.print(chosenID.get(i) + " ");
//        }
//        out.println("<br>");
        
//        out.println("Number of morning locations: " + morningList.size() + "<br>");
//        out.println("Number of afternoon locations: " + afternoonList.size() + "<br>");
//        out.println("Number of evening locations: " + eveningList.size() + "<br>");
        
//        // Assign all locations to a list
//        listLocations.addAll(morningList);
//        listLocations.addAll(afternoonList);
//        listLocations.addAll(eveningList);
//        if (park != null)
//        {
//            listLocations.add(park);
//        }
//        if (beach != null)
//        {
//            listLocations.add(beach);
//        }
        
        // Group each locations according to the day they are visited
        for (int i = 0; i < duration; ++i)  // initialize Days
        {
            Day day = new Day(i + 1);
            listLocationsPerDay.add(day);
        }
        if (park != null)   // add park to the corresponding Day
        {
            int index = park.getDay() - 1;
            listLocationsPerDay.get(index).setPark(park);
        }
        if (beach != null)  // add beach
        {
            int index = beach.getDay() - 1;
            if (beach.isMorning())  // visit beach in the morning
            {
                listLocationsPerDay.get(index).setMorningLocation(beach);
            }
            else                    // visit beach in the afternoon
            {
                listLocationsPerDay.get(index).setAfternoonLocation(beach);
            }
        }
        for (int i = 0, size = morningList.size(); i < size; ++i)   // add other locations
        {
            if (i < morningList.size())     // morning
            {
                Location location = morningList.get(i);
                int index = location.getDay() - 1;
                listLocationsPerDay.get(index).setMorningLocation(location);
            }
            
            if (i < afternoonList.size())   // afternoon
            {
                Location location = afternoonList.get(i);
                int index = location.getDay() - 1;
                listLocationsPerDay.get(index).setAfternoonLocation(location);
            }
            
            if (i < eveningList.size())     // evening
            {
                Location location = eveningList.get(i);
                int index = location.getDay() - 1;
                listLocationsPerDay.get(index).setEveningLocation(location);
            }
        }
        
        // Computer total price per day (= price of all locations)
        for (int i = 0; i < listLocationsPerDay.size(); ++i)
        {
            listLocationsPerDay.get(i).computeTotalPrice();
        }
        
        return listLocationsPerDay;
    }
    
    /**
     * 
     * @param parkPrefer
     * @param dayCity
     * @param listCity
     * @param country
     * @return a Location object representing the chosen Park for the trip
     * 
     * Condition: If duration >= 3 days -> Suggest a park location for the trip
     * 
     * First, choose the city (in case of 2) to suggest the park
     *      If user spends 3 or more days in both cities -> choose the second city
     *      Otherwise, choose the first city
     * 
     * Based on the selected city, choose the park with the highest rate
     * 
     */
    public Location getPark(String parkPrefer, List<Integer> dayCity,
            List<String> listCity, String country)
    {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Location park = null;
        
        // Get database connection
        connection = DBConnect.getConnection();
        
        // If duration >= 3 days, and user does like visiting a park
        if (dayCity.get(0) >= 3 && parkPrefer.equals("yes"))
        {
            try
            {
                statement = connection.createStatement();
                
                // Get the city for the park
                String city;
                if (dayCity.size() == 2 && dayCity.get(0) > 2 && dayCity.get(1) > 2)
                {
                    city = listCity.get(1);
                }
                else
                {
                    city = listCity.get(0);
                }
                
                // Construct query to get location 'park'
                String query = "SELECT Locations.LocationID as ID, "
                            + "Locations.NameLocation as Name, "         // name
                            + "Locations.City as City, "                 // city
                            + "Locations.Country as Country, "           // country
                            + "Locations.Price as Price, "               // price
                            + "Locations.Description as Description, "   // description
                            + "Locations.LocationImage as Image, "       // image for the location
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
                
                resultSet = statement.executeQuery(query);
                
                // Check whether there is park or not
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
                    park.setImage(resultSet.getString("Image"));
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
                
            } catch (SQLException sqle) {
                
            } finally {
                try {resultSet.close();} catch (Exception e) {}
                try {statement.close();} catch (Exception e) {}
                try {connection.close();} catch (Exception e) {}
            }
        }
        
        return park;
    }
    
    /**
     * 
     * @param beachPrefer
     * @param dayCity
     * @param listCity
     * @param country
     * @param totalDays
     * @return a Location object representing a beach for the trip (if possible)
     * 
     * Condition:
     *      User wants to go to a beach
     *      Duration of the trip is more than 3 days
     *      --> Suggest a beach to user
     * 
     * Choose the beach with the highest rate in either cities
     *      Visit the beach in the middle day of the duration spent for each city
     *      Ex: spent 4 days for the first city -> visit beach in day 2
     * 
     */
    public Location getBeach(String beachPrefer, List<Integer> dayCity,
            List<String> listCity, String country, int totalDays)
    {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Location beach = null;
        
        boolean haveBeach;
        
        // If duration > 3 days, and user does like visiting a beach
        if (totalDays > 3 && beachPrefer.equals("yes"))
        {
            haveBeach = true;
        }
        else
        {
            haveBeach = false;
        }
        
        if (haveBeach)      //  include beach
        {
            connection = DBConnect.getConnection();
            try
            {
                statement = connection.createStatement();
                
                // Construct query to find the beach with highest rate
                String query = "SELECT Locations.LocationID as ID, "
                        + "Locations.NameLocation as Name, "         // name
                        + "Locations.City as City, "                 // city
                        + "Locations.Country as Country, "           // country
                        + "Locations.Price as Price, "               // price
                        + "Locations.Description as Description, "   // description
                        + "Locations.LocationImage as Image, "       // image
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
                query = query + "GROUP BY ID "
                        + "ORDER BY AvgRate DESC, NumsRate DESC, Price ASC "
                        + "LIMIT 1;";
                
                resultSet = statement.executeQuery(query);
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
                    beach.setImage(resultSet.getString("Image"));
                    beach.setAvgRate(resultSet.getDouble("AvgRate"));
                    
                    // Determine the day
                    int day;
                    if (beach.getCity().equals(listCity.get(0)))    // first city
                    {
                        day = (int) Math.round(dayCity.get(0) / 2.0);   // mid day
                    }
                    else            // second city
                    {
                        day = dayCity.get(0) + (int) Math.round(dayCity.get(1) / 2.0);  // mid day
                    }
                    beach.setDay(day);
                    
                    // Decide period of day
                    beach.setEvening(false);
                    Random rand = new Random(System.currentTimeMillis());
                    beach.setMorning(rand.nextBoolean());
                    beach.setAfternoon(!beach.isMorning());
                }
                
            } catch (SQLException sqle) {
                
            } finally {
                try {resultSet.close();} catch (Exception e) {}
                try {statement.close();} catch (Exception e) {}
                try {connection.close();} catch (Exception e) {}
            }
        }
        
        return beach;
    }
    
    /**
     * 
     * @param type
     * @param chosenID
     * @param country
     * @param listCity
     * @param dayCity
     * @param park
     * @param beach
     * @param period
     * @return a List<Location> indicating all locations visited in the specified period
     * 
     * Determine locations to visit in the specified period (morning|afternoon|evening),
     * for each city
     *      Exclude 'themepark', if any
     *      Exclude 'beach', if any
     *      Exclude chosen locations (based on their IDs), if any
     * 
     * Period: morning, afternoon, and evening
     * 
     * For morning and afternoon
     *      Choose one location a day
     * For evening
     *      Choose one location per two days (on 2nd day, 4th day, ...)
     * 
     * Assign the day to visit a location (day 1, day 2, ...) randomly
     * 
     */
    private List<Location> getLocationsPeriod(JourneyType type, List<Integer> chosenID,
            String country, List<String> listCity, List<Integer> dayCity,
            Location park, Location beach, String period)
    {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        String city, query1 = "", query2 = "", listID;
        List<Integer> availDay1 = null;
        List<Integer> availDay2 = null;
        int numsLocations;
     
        Random randDay = new Random(System.currentTimeMillis());    // for choosing day randomly
        List<Location> listLocations = new ArrayList<>();
        
        // Construct list of available days to choose for the first city
        availDay1 = new ArrayList<>();
        for (int i = 1; i <= dayCity.get(0); ++i)
        {
            if (period.equalsIgnoreCase("evening")) // for evening, add all even days first
            {
                if (i % 2 == 0)
                    availDay1.add(i);
            }
            else            // for morning | afternoon, add all days first
            {
                availDay1.add(i);
            }
        }
        
        // Construct a string representing lists of chosen locationID
        listID = "(";
        if (chosenID != null && chosenID.size() > 0)
        {
            for (int i = 0; i < chosenID.size(); ++i)
            {
                if (i != 0)
                    listID += ", ";
                listID += chosenID.get(i);
            }
            listID += ")";
        }
        
        // Construct query to get locations for the first city
        city = listCity.get(0);
        if (period.equalsIgnoreCase("evening"))     // evening
        {
            numsLocations = dayCity.get(0) / 2;
        }
        else                                        // morning or afternoon
        {
            numsLocations = dayCity.get(0);
        }
        if (park != null && park.getCity().equals(city)) // exclude park, if any
        {
            if (period.equalsIgnoreCase("morning") || period.equalsIgnoreCase("afternoon") ||
                    (period.equalsIgnoreCase("evening") && park.getDay() % 2 == 0))
            {
                --numsLocations;    // park takes a whole day
                availDay1.remove(new Integer(park.getDay()));    // exclude day for park
            }
        }
        if (beach != null && beach.getCity().equals(city))  // exclude beach, if any
        {
            // beach takes either morning or afternoon
            if ((beach.isMorning() && period.equalsIgnoreCase("morning")) ||
                    (beach.isAfternoon() && period.equalsIgnoreCase("afternoon")))
            {
                --numsLocations;
                availDay1.remove(new Integer(beach.getDay()));   // exclue day for beach
            }
        }
        
        query1 = "SELECT Locations.LocationID as ID, "
                + "Locations.TypeLocation as Type, " // type of location
                + "Locations.NameLocation as Name, " // name
                + "Locations.City as City, " // city
                + "Locations.Country as Country, " // country
                + "Locations.Price as Price, " // price
                + "Locations.Description as Description, " // description
                + "Locations.LocationImage as Image, "  // image
                + "AVG(Comments.Rate) as AvgRate, " // average rate
                + "COUNT(Comments.Rate) as NumsRate " // number of rates
                + "FROM Locations INNER JOIN Comments "
                + "ON Locations.LocationID = Comments.LocationID "
                + "WHERE Country = '" + country + "' "      // match country
                + "AND City = '" + city + "' "             // match city
                + "AND TypeLocation IN " + type.getListLocationType() + " "; // match location types
        if (period.equalsIgnoreCase("morning"))     // match period
        {
            query1 += "AND Morning = 1 ";
        }
        else if (period.equalsIgnoreCase("afternoon"))
        {
            query1 += "AND Afternoon = 1 ";
        }
        else
        {
            query1 += "AND Evening = 1 ";
        }
        if (chosenID != null && chosenID.size() > 0)   // exclude chosen locations
        {
            query1 += "AND Locations.LocationID NOT IN " + listID + " ";
        }
        query1 += "GROUP BY ID "
                + "ORDER BY AvgRate DESC, NumsRate DESC, Price ASC "
                + "LIMIT " + numsLocations + ";";
        
//        PrintWriter out = response.getWriter();
//        out.println(query1 + "<br><br>");
        
        // If two cities
        if (listCity.size() > 1)
        {
            // Construct list of available days to choose for the first city
            availDay2 = new ArrayList<>();
            for (int i = dayCity.get(0) + 1; i <= dayCity.get(0) + dayCity.get(1); ++i) {
                if (period.equalsIgnoreCase("evening")) // for evening, add all even days first
                {
                    if (i % 2 == 0) {
                        availDay2.add(i);
                    }
                } else // for morning | afternoon, add all days first
                {
                    availDay2.add(i);
                }
            }
            
            // Construct query to get locations for the second city
            city = listCity.get(1);
            if (period.equalsIgnoreCase("evening")) // evening
            {
                numsLocations = dayCity.get(1) / 2;
            } else // morning or afternoon
            {
                numsLocations = dayCity.get(1);
            }
            if (park != null && park.getCity().equals(city)) // exclude park, if any
            {
                if (period.equalsIgnoreCase("morning") || period.equalsIgnoreCase("afternoon") ||
                    (period.equalsIgnoreCase("evening") && park.getDay() % 2 == 0))
                {
                    --numsLocations;    // park takes a whole day
                    availDay2.remove(new Integer(park.getDay()));
                }
            }
            if (beach != null && beach.getCity().equals(city)) // exclude beach, if any
            {
                // beach takes either morning or afternoon
                if ((beach.isMorning() && period.equalsIgnoreCase("morning"))
                        || (beach.isAfternoon() && period.equalsIgnoreCase("afternoon")))
                {
                    --numsLocations;
                    availDay2.remove(new Integer(beach.getDay()));
                }
            }

            query2 = "SELECT Locations.LocationID as ID, "
                    + "Locations.TypeLocation as Type, " // type of location
                    + "Locations.NameLocation as Name, " // name
                    + "Locations.City as City, " // city
                    + "Locations.Country as Country, " // country
                    + "Locations.Price as Price, " // price
                    + "Locations.Description as Description, " // description
                    + "Locations.LocationImage as Image, "  // image
                    + "AVG(Comments.Rate) as AvgRate, " // average rate
                    + "COUNT(Comments.Rate) as NumsRate " // number of rates
                    + "FROM Locations INNER JOIN Comments "
                    + "ON Locations.LocationID = Comments.LocationID "
                    + "WHERE Country = '" + country + "' " // match country
                    + "AND City = '" + city + "' " // match city
                    + "AND TypeLocation IN " + type.getListLocationType() + " ";
            if (period.equalsIgnoreCase("morning")) // match period
            {
                query2 += "AND Morning = 1 ";
            } else if (period.equalsIgnoreCase("afternoon")) {
                query2 += "AND Afternoon = 1 ";
            } else {
                query2 += "AND Evening = 1 ";
            }
            if (chosenID != null && chosenID.size() > 0) // exclude chosen locations
            {
                query2 += "AND Locations.LocationID NOT IN " + listID + " ";
            }
            query2 += "GROUP BY ID "
                    + "ORDER BY AvgRate DESC, NumsRate DESC, Price ASC "
                    + "LIMIT " + numsLocations + ";";
            
//            out.println(query2 + "<br><br>");
        }
        
        
        // Query from the database list of locations
        connection = DBConnect.getConnection();
        try
        {
            Location location;
            statement = connection.createStatement();
            
            // Query 1: for the first city
            resultSet = statement.executeQuery(query1);
            while (resultSet.next())
            {
                location = new Location();
                
                // Get location's information from database
                location.setID(resultSet.getInt("ID"));
                location.setType(resultSet.getString("Type").toUpperCase());
                location.setName(resultSet.getString("Name"));
                location.setCity(resultSet.getString("City"));
                location.setCountry(resultSet.getString("Country"));
                location.setPrice(resultSet.getDouble("Price"));
                location.setDescription(resultSet.getString("Description"));
                location.setImage(resultSet.getString("Image"));
                location.setAvgRate(resultSet.getDouble("AvgRate"));
                
                if (period.equalsIgnoreCase("morning"))     // assign period
                {
                    location.setMorning(true);
                    location.setAfternoon(false);
                    location.setEvening(false);
                }
                else if (period.equalsIgnoreCase("afternoon"))
                {
                    location.setMorning(false);
                    location.setAfternoon(true);
                    location.setEvening(false);
                }
                else
                {
                    location.setMorning(false);
                    location.setAfternoon(false);
                    location.setEvening(true);
                }
                
                int indexDay = randDay.nextInt(availDay1.size());   // choose, and assign day
                location.setDay(availDay1.get(indexDay));
                availDay1.remove(indexDay);  // remove the day from the list of availablle days
                
                // Assign the location into the list
                listLocations.add(location);
            }
            
            // Query 2: for the second city, if needed
            if (listCity.size() > 1 && query2 != null)
            {
                resultSet = statement.executeQuery(query2);
                while (resultSet.next())
                {
                    location = new Location();

                    // Get location's information from database
                    location.setID(resultSet.getInt("ID"));
                    location.setType(resultSet.getString("Type").toUpperCase());
                    location.setName(resultSet.getString("Name"));
                    location.setCity(resultSet.getString("City"));
                    location.setCountry(resultSet.getString("Country"));
                    location.setPrice(resultSet.getDouble("Price"));
                    location.setDescription(resultSet.getString("Description"));
                    location.setImage(resultSet.getString("Image"));
                    location.setAvgRate(resultSet.getDouble("AvgRate"));

                    if (period.equalsIgnoreCase("morning")) // assign period
                    {
                        location.setMorning(true);
                        location.setAfternoon(false);
                        location.setEvening(false);
                    } else if (period.equalsIgnoreCase("afternoon"))
                    {
                        location.setMorning(false);
                        location.setAfternoon(true);
                        location.setEvening(false);
                    } else
                    {
                        location.setMorning(false);
                        location.setAfternoon(false);
                        location.setEvening(true);
                    }

                    int indexDay = randDay.nextInt(availDay2.size());   // choose, and assign day
                    location.setDay(availDay2.get(indexDay));
                    availDay2.remove(indexDay);  // remove the day from the list of availablle days

                    // Assign the location into the list
                    listLocations.add(location);
                }
            }
            
        } catch (SQLException sqle) {
            
        } finally {
            try {resultSet.close();} catch (Exception e) {}
            try {statement.close();} catch (Exception e) {}
            try {connection.close();} catch (Exception e) {}
        }
        
        return listLocations;
    }
}
