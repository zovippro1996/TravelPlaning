/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

/**
 *
 * @author user
 */
public class Day {
    private int dayNumber;                  // number of day. Ex: day 1, day 2
    private Location park = null;           // if park is not null --> ignore
                                            // morningLocation, afternoonLocation,
                                            // and eveningLocation
    private Location morningLocation;       // location to visit in the morning
    private Location afternoonLocation;     // location to visit in the afternoon
    private Location eveningLocation;       // location to visit in the evening
    private double totalPrice;              // estimated total price for the day
    
    public Day()
    {
        
    }
    
    public Day(int dayNumber)
    {
        this.dayNumber = dayNumber;
    }
    
    public void computeTotalPrice()
    {
        double totalPrice = 0;
        if (park != null)
        {
            totalPrice = park.getPrice();
        }
        else
        {
            if (morningLocation != null)
            {
                totalPrice += morningLocation.getPrice();
            }
            if (afternoonLocation != null)
            {
                totalPrice += afternoonLocation.getPrice();
            }
            if (eveningLocation != null)
            {
                totalPrice += eveningLocation.getPrice();
            }
        }
        setTotalPrice(totalPrice);
    }
    
    public String visitedLocations()
    {
        String result = "Day " + dayNumber + "<br>";
        if (park != null)
        {
            result += "All day: " + park.getName();
        }
        else
        {
            if (morningLocation != null)
            {
                result += "Morning: " + morningLocation.getName() + "<br>";
            }
            if (afternoonLocation != null)
            {
                result += "Afternoon: " + afternoonLocation.getName() + "<br>";
            }
            if (eveningLocation != null)
            {
                result += "Evening: " + eveningLocation.getName() + "<br>";
            }
        }
        return result;
    }

    /**
     * @return the dayNumber
     */
    public int getDayNumber() {
        return dayNumber;
    }

    /**
     * @param dayNumber the dayNumber to set
     */
    public void setDayNumber(int dayNumber) {
        this.dayNumber = dayNumber;
    }

    /**
     * @return the morningLocation
     */
    public Location getMorningLocation() {
        return morningLocation;
    }

    /**
     * @param morningLocation the morningLocation to set
     */
    public void setMorningLocation(Location morningLocation) {
        this.morningLocation = morningLocation;
    }

    /**
     * @return the afternoonLocation
     */
    public Location getAfternoonLocation() {
        return afternoonLocation;
    }

    /**
     * @param afternoonLocation the afternoonLocation to set
     */
    public void setAfternoonLocation(Location afternoonLocation) {
        this.afternoonLocation = afternoonLocation;
    }

    /**
     * @return the eveningLocation
     */
    public Location getEveningLocation() {
        return eveningLocation;
    }

    /**
     * @param eveningLocation the eveningLocation to set
     */
    public void setEveningLocation(Location eveningLocation) {
        this.eveningLocation = eveningLocation;
    }

    /**
     * @return the totalPrice
     */
    public double getTotalPrice() {
        return totalPrice;
    }

    /**
     * @param totalPrice the totalPrice to set
     */
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    /**
     * @return the park
     */
    public Location getPark() {
        return park;
    }

    /**
     * @param park the park to set
     */
    public void setPark(Location park) {
        this.park = park;
    }
}
