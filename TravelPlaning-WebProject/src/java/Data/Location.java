/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

//import java.util.List;

/**
 *
 * @author CREAT10N
 */
public class Location {
    private int ID;
    private String type;
    private String name;
    private String city;
    private String country;
    private double price;
    private String description;
    private double avgRate;
    private boolean morning;        // state the period (morning | afternoon | evening)
    private boolean afternoon;      // to visit this location in the trip
    private boolean evening;        //
    private int day;            // the day to visit the location

//    private List<String> review;
//    private int providerID;    
//    private double latitudeX;
//    private double latitudeY;

    public String display()
    {
        return String.format("Name: %s&nbsp;&nbsp;City: %s&nbsp;&nbsp;Country: %s<br>"
                + "&nbsp;&nbsp;Day: %d&nbsp;&nbsp;Price: $%.2f&nbsp;&nbsp;"
                + "Type: %s&nbsp;&nbsp;Average rate: %.2f"
                + "<br>&nbsp;&nbsp;Description:&nbsp;&nbsp;%s"
                , getName(), getCity(), getCountry(), getDay(), getPrice(),
                getType(), getAvgRate(), getDescription());
    }
    
    public String period()
    {
        String result = "";
        if (morning)
            result += "Morning  ";
        if (afternoon)
            result += "Afternoon  ";
        if (evening)
            result += "Evening  ";
        return result;
    }

    /**
     * @return the ID
     */
    public int getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(int ID) {
        this.ID = ID;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the avgRate
     */
    public double getAvgRate() {
        return avgRate;
    }

    /**
     * @param avgRate the avgRate to set
     */
    public void setAvgRate(double avgRate) {
        this.avgRate = avgRate;
    }

    /**
     * @return the morning
     */
    public boolean isMorning() {
        return morning;
    }

    /**
     * @param morning the morning to set
     */
    public void setMorning(boolean morning) {
        this.morning = morning;
    }

    /**
     * @return the afternoon
     */
    public boolean isAfternoon() {
        return afternoon;
    }

    /**
     * @param afternoon the afternoon to set
     */
    public void setAfternoon(boolean afternoon) {
        this.afternoon = afternoon;
    }

    /**
     * @return the evening
     */
    public boolean isEvening() {
        return evening;
    }

    /**
     * @param evening the evening to set
     */
    public void setEvening(boolean evening) {
        this.evening = evening;
    }

    /**
     * @return the day
     */
    public int getDay() {
        return day;
    }

    /**
     * @param day the day to set
     */
    public void setDay(int day) {
        this.day = day;
    }
}
