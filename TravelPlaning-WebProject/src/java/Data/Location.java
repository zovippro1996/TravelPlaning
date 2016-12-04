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
//    private double latitudeX;
//    private double latitudeY;
    private double price;
//    private int providerID;
    private String description;
    private double avgRate;
//    private List<String> review;
    
    private boolean morning;
    private boolean afternoon;
    private boolean evening;
    private int day;

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
    public String getCity()
    {
        return city;
    }
    
    /**
     * @param city 
     */
    public void setCity(String city)
    {
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

//    /**
//     * @return the latitudeX
//     */
//    public double getLatitudeX() {
//        return latitudeX;
//    }
//
//    /**
//     * @param latitudeX the latitudeX to set
//     */
//    public void setLatitudeX(double latitudeX) {
//        this.latitudeX = latitudeX;
//    }
//
//    /**
//     * @return the latitudeY
//     */
//    public double getLatitudeY() {
//        return latitudeY;
//    }
//
//    /**
//     * @param latitudeY the latitudeY to set
//     */
//    public void setLatitudeY(double latitudeY) {
//        this.latitudeY = latitudeY;
//    }

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

//    /**
//     * @return the providerID
//     */
//    public int getProviderID() {
//        return providerID;
//    }
//
//    /**
//     * @param providerID the providerID to set
//     */
//    public void setProviderID(int providerID) {
//        this.providerID = providerID;
//    }

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
     * @return the average rate
     */
    public double getAvgRate() {
        return avgRate;
    }

    /**
     * @param rate the rate to set
     */
    public void setAvgRate(double rate) {
        avgRate = rate;
    }

//    /**
//     * @return the review
//     */
//    public List<String> getReview() {
//        return review;
//    }
//
//    /**
//     * @param review the review to set
//     */
//    public void setReview(List<String> review) {
//        this.review = review;
//    }
    
    /**
     * @return whether the location opens in morning
     */
    public boolean isMorning()
    {
        return morning;
    }
    
    /**
     * @param morning 
     */
    public void setMorning(boolean morning)
    {
        this.morning = morning;
    }
    
    /**
     * @return whether the location opens in afternoon
     */
    public boolean isAfternoon()
    {
        return afternoon;
    }
    
    /**
     * @param afternoon 
     */
    public void setAfternoon(boolean afternoon)
    {
        this.afternoon = afternoon;
    }
    
    /**
     * @return whether the location opens in evening
     */
    public boolean isEvening()
    {
        return evening;
    }
    
    /**
     * @param evening 
     */
    public void setEvening(boolean evening)
    {
        this.evening = evening;
    }
    
    /**
     * @return the day (day 1, day 2, ...) to visit the location
     */
    public int getDay()
    {
        return day;
    }
    
    /**
     * @param day 
     */
    public void setDay(int day)
    {
        this.day = day;
    }
    
    public String display()
    {
        return String.format("Name: %s&nbsp;&nbsp;City: %s&nbsp;&nbsp;Country: %s\n"
                + "&nbsp;&nbsp;Day: %d&nbsp;&nbsp;Price: $%.2f&nbsp;&nbsp;Average rate: %.2f"
                + "\n&nbsp;&nbsp;Description:\n&nbsp;&nbsp;%s"
                , name, city, country, day, price, avgRate, description);
    }
}
