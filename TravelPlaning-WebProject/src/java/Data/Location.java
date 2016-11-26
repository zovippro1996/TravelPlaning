/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import java.util.List;

/**
 *
 * @author CREAT10N
 */
public class Location {
    private int ID;
    private String type;
    private String name;
    private String country;
    private double latitudeX;
    private double latitudeY;
    private double price;
    private int providerID;
    private String description;
    private int rate;
    private List<String> review;

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
     * @return the latitudeX
     */
    public double getLatitudeX() {
        return latitudeX;
    }

    /**
     * @param latitudeX the latitudeX to set
     */
    public void setLatitudeX(double latitudeX) {
        this.latitudeX = latitudeX;
    }

    /**
     * @return the latitudeY
     */
    public double getLatitudeY() {
        return latitudeY;
    }

    /**
     * @param latitudeY the latitudeY to set
     */
    public void setLatitudeY(double latitudeY) {
        this.latitudeY = latitudeY;
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
     * @return the providerID
     */
    public int getProviderID() {
        return providerID;
    }

    /**
     * @param providerID the providerID to set
     */
    public void setProviderID(int providerID) {
        this.providerID = providerID;
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
     * @return the rate
     */
    public int getRate() {
        return rate;
    }

    /**
     * @param rate the rate to set
     */
    public void setRate(int rate) {
        this.rate = rate;
    }

    /**
     * @return the review
     */
    public List<String> getReview() {
        return review;
    }

    /**
     * @param review the review to set
     */
    public void setReview(List<String> review) {
        this.review = review;
    }
}
